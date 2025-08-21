import re
from pathlib import Path

patterns = {
    "assign_or_bit": re.compile(
        r"""^\s*lda\s+(?P<tmp>tmp\d+(?:\+\d+)?)\s*:\s*ora\s+\#BIT_(?P<bit>\d+)\s*:\s*sta\s+(?P=tmp)\s*$""",
        re.IGNORECASE | re.VERBOSE
    ),
    "assign_multi_or_bit": re.compile(
        r"""^\s*lda\s+(?P<tmp>tmp\d+(?:\+\d+)?)\s*:\s*ora\s+\#(?P<bits>(?:BIT_\d+\+?)+)\s*:\s*sta\s+(?P=tmp)\s*$""",
        re.IGNORECASE | re.VERBOSE
    ),
    "comment_assign": re.compile(
        r"""^\s*;\s*r(?P<reg>\d+)\s*=\s*(?P<value>-?\d+)\s*$""",
        re.IGNORECASE | re.VERBOSE
    ),
    "comment_multi_assign": re.compile(
        r"""^\s*;\s*(?P<assigns>(?:r\d+\s*=\s*\d+\s*,?\s*)+)\s*$""",
        re.IGNORECASE | re.VERBOSE
    ),
    "comment_cond": re.compile(
        r"""^\s*;\s*if\s*\(\s*a(?P<abit>\d+)\s*(?P<op>==|!=)\s*0\s*\)\s*:\s*$""",
        re.IGNORECASE | re.VERBOSE
    ),
    "and_bit_branch": re.compile(
        r"""
        ^\s*lda\s+(?P<addr>tmp\d+(?:\+\d+)?)\s*:\s*
        and\s+\#BIT_(?P<bit>\d+)\s*:\s*
        \.\(\s*:\s*(?P<branch>bne|beq)\s+\w+\s*:\s*
        jmp\s+(?P<label>\w+)\s*:\s*
        \w+\s*:\.\)\s*:?\s*$
        """,
        re.IGNORECASE | re.VERBOSE
    ),
    "terminal_jmp": re.compile(
        r"""^\s*jmp\s+(?P<label>\w+)\s*$""",
        re.IGNORECASE | re.VERBOSE
    ),
    "comment_else": re.compile(
        r"""^\s*;\s*else\s*:\s*$""",
        re.IGNORECASE | re.VERBOSE
    ),
    "label": re.compile(
        r"""^\s*(?P<label>\w+)\s*:\s*$""",
        re.IGNORECASE | re.VERBOSE
    ),
}

def normalize_label(value: str) -> str:
    """Extrait la partie numérique si le label commence par lbl_, sinon retourne tel quel."""
    if value is None:
        return None
    m = re.match(r"lbl_(\d+)", value, flags=re.IGNORECASE)
    if m:
        return m.group(1)  # juste le numéro
    return value


def classify_and_extract(line: str):
    indent = len(line) - len(line.lstrip(" "))
    indent_level = indent // 2
    stripped = line.strip("\n")

    # # 1. Comment multi-if
    # if stripped.startswith("; if (") and "and" in stripped:
    #     conds_raw = re.findall(r"\((a\d+) *([!=]=) *(\d+)\)", stripped)
    #     conditions = []
    #     for reg, op, val in conds_raw:
    #         conditions.append({
    #             "reg": int(reg[1:]),  # a3 -> 3
    #             "op": op,
    #             "value": int(val)
    #         })
    #     return {
    #         "type": "comment_multi_if",
    #         "conditions": conditions,
    #         "indent": indent,
    #         "raw": line.rstrip("\n")
    #     }

    # # 2. Multi-bit AND + CMP branch
    # m = re.match(
    #     r"lda (\w+): and #((?:BIT_\d+\+?)+): cmp #((?:BIT_\d+\+?)+): .\(:beq skip: jmp lbl_(\d+): skip:.\)",
    #     stripped
    # )
    # if m:
    #     var, and_bits_raw, cmp_bits_raw, label = m.groups()
    #     and_bits = [int(b.replace("BIT_", "")) for b in and_bits_raw.split("+")]
    #     cmp_bits = [int(b.replace("BIT_", "")) for b in cmp_bits_raw.split("+")]
    #     return {
    #         "type": "and_multi_bit_branch",
    #         "var": var,
    #         "and_bits": and_bits,
    #         "cmp_bits": cmp_bits,
    #         "label": int(label),
    #         "indent": indent,
    #         "raw": line.rstrip("\n")
    #     }
    
    for name, rx in patterns.items():
        m = rx.match(line)
        if m:
            d = {"type": name, **m.groupdict(), "indent": indent_level, "raw": line}

            # Ajout clé uniforme var
            if name == "assign_or_bit":
                d["var"] = d["tmp"]
                d["bits"] = [int(d["bit"])]
            elif name == "assign_multi_or_bit":
                d["var"] = d["tmp"]
                d["bits"] = [int(x.split("_")[1]) for x in d["bits"].split("+")]
            elif name == "comment_assign":
                d["var"] = f"r{d['reg']}"
                d["regs"] = [(int(d["reg"]), int(d["value"]))]
            elif name == "comment_multi_assign":
                # exemple : "r2 = 1, r1 = 1"
                assigns = []
                for a in d["assigns"].split(","):
                    a = a.strip()
                    if not a:
                        continue
                    reg, val = a.split("=")
                    assigns.append((int(reg.strip()[1:]), int(val.strip())))
                d["regs"] = assigns
            elif name == "comment_cond":
                d["var"] = f"a{d['abit']}"
            elif name == "and_bit_branch":
                d["var"] = d["addr"]
                d["bits"] = [int(d["bit"])]

            # Normaliser labels
            if "label" in d:
                d["label"] = normalize_label(d["label"])

            return d
    return {"type": "unmatched", "indent": indent_level, "raw": line}



def regenerate_line(instr: dict) -> str:
    """Reprend strictement la ligne originale"""
    result = ""
    indent = "  " * instr.get("indent", 0)

    if instr["type"] == "comment_cond":
        result = f"{indent}; if ({instr['var']} {instr['op']} 0):"

    elif instr["type"] == "assign_or_bit":
        result = f"{indent}lda {instr['var']}: ora #BIT_{instr['bit']}: sta {instr['var']}"

    elif instr["type"] == "comment_multi_assign":
        regs = [f"r{a}" for a,b in instr["regs"]]
        vals = [f"{b}" for a,b in instr["regs"]]
        lst = ", ".join(f"{r} = {v}" for r, v in zip(regs, vals))
        result = f"{indent}; {lst}"

    elif instr["type"] == "assign_multi_or_bit":
        bits = "+".join([f"BIT_{b}" for b in instr["bits"]])
        result = f"{indent}lda {instr['var']}: ora #{bits}: sta {instr['var']}"

    elif instr["type"] == "comment_assign":
        result = f"{indent}; r{instr['reg']} = {instr['value']}"

    elif instr["type"] == "and_bit_branch":
        result = (
            f"{indent}lda {instr['var']} : and #BIT_{instr['bit']}: "
            f".(:{instr['branch']} skip: jmp lbl_{instr['label']}: skip:.):"
        )

    elif instr["type"] == "comment_multi_if":
        # for cond in instr["conditions"]:
        #     conds.append(f"({ 'a'+str(cond['reg']) } {cond['op']} {cond['value']})")
        joined = " and ".join(instr["conditions"])
        result = f"{indent}; if {joined}:"

    elif instr["type"] == "and_multi_bit_branch":
        and_bits = "+".join([f"BIT_{b}" for b in instr["and_bits"]])
        cmp_bits = "+".join([f"BIT_{b}" for b in instr["cmp_bits"]])
        if len(cmp_bits) != 0:
            result = (
                f"{indent}lda {instr['var']}: and #{and_bits}: "
                f"cmp #{cmp_bits}: "
                f".(:beq skip: jmp lbl_{instr['label']}: skip:.)"
            )
        else:
            result = (
                f"{indent}lda {instr['var']}: and #{and_bits}: "
                f".(:beq skip: jmp lbl_{instr['label']}: skip:.)"
            )

    elif instr["type"] == "label":
        result = f"{indent}lbl_{instr['label']}:"

    elif instr["type"] == "raw":
        result = instr["raw"]
    elif instr["type"] == "terminal_jmp":
        result = f"{indent}jmp _unefonctionDone"
    else:
        # fallback
        result = instr.get("raw", "")

    return result # instr.get("raw", "")


# === Filtres d’optimisation ===
# import sys, os
# sys.path.append(os.path.join(os.path.dirname(__file__), 'retro'))

from opt_remove_multiple_jumps import opt_remove_double_jumps
from opt_merge_consecutive_assigns import opt_merge_consecutive_assigns
from opt_merge_consecutive_uncomplemented_conditions import opt_merge_consecutive_uncomplemented_conditions



def apply_optimizations(instructions):
    """Chaîne de filtres, modifiable à volonté"""
    filters = [
        opt_merge_consecutive_assigns,
        opt_merge_consecutive_uncomplemented_conditions,
        # opt_remove_double_jumps,
    ]
    for f in filters:
        instructions = f(instructions)
    return instructions


# ——— Main ———
if __name__ == "__main__":

    file_path = Path("retro/brute_code/function_core.s")
    with file_path.open(encoding="utf-8") as f:
        lines = f.readlines()

    # Extraction
    instructions = [classify_and_extract(l.rstrip("\n")) for l in lines]

    # Application des optimisations
    optimized_instructions = apply_optimizations(instructions)

    # Régénération
    new_lines = [regenerate_line(instr) for instr in optimized_instructions]

    # Écriture dans function_clean.asm
    out_path = Path("retro/brute_code/function_core_opt.s")
    with out_path.open("w", encoding="utf-8") as f:
        f.write("\n".join(new_lines))

    print(f"✅ Code régénéré écrit dans {out_path}")
