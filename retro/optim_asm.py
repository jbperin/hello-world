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
    return instr.get("raw", "")


# === Filtres d’optimisation ===
def opt_remove_double_jumps(instructions):
    """Exemple : supprime les 'jmp' qui pointent directement sur un autre 'jmp'."""
    new_instrs = []
    for i, instr in enumerate(instructions):
        if instr["type"] == "terminal_jmp":
            # vérifier si le label visé est immédiatement un autre jmp
            if i + 1 < len(instructions):
                next_instr = instructions[i + 1]
                if next_instr["type"] == "terminal_jmp":
                    # on saute celui-ci
                    continue
        new_instrs.append(instr)
    return new_instrs

def opt_merge_consecutive_assigns(instructions):
    """Exemple : regroupe les affectations de plusieurs bits en une instruction ."""


    def rewrite_code(list_of_instruction):
        # TODO:
        # Faire une fonction qui regroupe les bits
        # Ainsi les lignes
        #       ; r1 = 1
        #       lda tmp7: ora #BIT_1: sta tmp7
        #       ; r0 = 1
        #       lda tmp7: ora #BIT_0: sta tmp7
        # en:
        #       ; [r0, r1] = [1, 1]
        #       lda tmp7: ora #BIT_1+BIT_0: sta tmp7

        return []


    new_instrs = []
    etat = 0 # 0:en attente première affectation, 1: en attente fin affectation
    stack = []
    nb_assigment_to_merge = 0
    for i, instr in enumerate(instructions):
        if (etat == 0):
            if instr["type"] in ['assign_or_bit', 'comment_assign']:                
                etat = 1
                stack.append(instr)
                if (instr["type"] == 'assign_or_bit'):
                    nb_assigment_to_merge += 1
            else:
                new_instrs.append(instr)
        elif (etat == 1):
            if instr["type"] not in ['assign_or_bit', 'comment_assign']:
                # TODO: Catch it here !!
                if (nb_assigment_to_merge > 1):
                    # print (stack)
                    rewritten = rewrite_code(stack)
                    while len(rewritten) != 0: new_instrs.append(stack.pop(0))
                    stack = []
                else:
                    while len(stack) != 0:
                        new_instrs.append(stack.pop(0))
                nb_assigment_to_merge = 0
                etat = 0
                new_instrs.append(instr)
            else:
                if (instr["type"] == 'assign_or_bit'):
                    nb_assigment_to_merge += 1
                stack.append(instr)
    return new_instrs

def apply_optimizations(instructions):
    """Chaîne de filtres, modifiable à volonté"""
    filters = [
        opt_merge_consecutive_assigns,
        opt_remove_double_jumps,
    ]
    for f in filters:
        instructions = f(instructions)
    return instructions


# ——— Main ———
if __name__ == "__main__":
    # lecture du fichier function_raw.asm
    file_path = Path("retro/function_raw.asm")
    with file_path.open(encoding="utf-8") as f:
        lines = f.readlines()

    # Extraction
    instructions = [classify_and_extract(l.rstrip("\n")) for l in lines]

    # Application des optimisations
    optimized_instructions = apply_optimizations(instructions)

    # Régénération
    new_lines = [regenerate_line(instr) for instr in optimized_instructions]

    # Écriture dans function_clean.asm
    out_path = Path("retro/function_clean.asm")
    with out_path.open("w", encoding="utf-8") as f:
        f.write("\n".join(new_lines))

    print(f"✅ Code régénéré écrit dans {out_path}")
