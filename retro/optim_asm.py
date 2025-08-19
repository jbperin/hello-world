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
        result = (
            f"{indent}lda {instr['var']}: and #{and_bits}: "
            f"cmp #{cmp_bits}: "
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
    """Regroupe les affectations de plusieurs bits en une instruction unique.""" 

    def rewrite_code(list_of_instruction):
        # Récupère la variable (tmpX)
        tmp_vars = {instr["var"] for instr in list_of_instruction if instr["type"] == "assign_or_bit"}
        if len(tmp_vars) != 1:
            # Ambigu, on ne fusionne pas
            return list_of_instruction  
        tmp_var = tmp_vars.pop()

        indent = list_of_instruction[0]["indent"]
        indent_str = "  " * indent

        # Collecter registres et valeurs
        regs = []
        for instr in list_of_instruction:
            if instr["type"] == "comment_assign":
                regs.append((int(instr["reg"]), int(instr["value"])))
            elif instr["type"] == "comment_multi_assign":
                regs.extend(instr["regs"])

        # Collecter bits
        bits = []
        for instr in list_of_instruction:
            if instr["type"] == "assign_or_bit":
                bits.extend(instr["bits"])
            elif instr["type"] == "assign_multi_or_bit":
                bits.extend(instr["bits"])

        # Construire nouvelle séquence fusionnée
        new_instrs = []
        if regs:
            assigns_str = ", ".join([f"r{r} = {v}" for r, v in regs])
            new_instrs.append({
                "type": "comment_multi_assign",
                "regs": regs,
                "assigns": assigns_str,
                "indent": indent,
                "raw": f"{indent_str}; {assigns_str}"
            })

        if bits:
            bits_str = "+".join([f"BIT_{b}" for b in sorted(bits, reverse=True)])
            new_instrs.append({
                "type": "assign_multi_or_bit",
                "var": tmp_var,
                "bits": bits,
                "indent": indent,
                "raw": f"{indent_str}lda {tmp_var}: ora #{bits_str}: sta {tmp_var}"
            })

        return new_instrs

    new_instrs = []
    etat = 0 # 0: attente, 1: séquence d'affectations
    stack = []
    nb_assigment_to_merge = 0

    for i, instr in enumerate(instructions):
        if etat == 0:
            if instr["type"] in ['assign_or_bit', 'comment_assign']:                
                etat = 1
                stack.append(instr)
                if instr["type"] == 'assign_or_bit':
                    nb_assigment_to_merge += 1
            else:
                new_instrs.append(instr)
        elif etat == 1:
            if instr["type"] not in ['assign_or_bit', 'comment_assign']:
                if nb_assigment_to_merge > 1:
                    rewritten = rewrite_code(stack)
                    new_instrs.extend(rewritten)
                    stack = []
                else:
                    new_instrs.extend(stack)
                    stack = []
                nb_assigment_to_merge = 0
                etat = 0
                new_instrs.append(instr)
            else:
                if instr["type"] == 'assign_or_bit':
                    nb_assigment_to_merge += 1
                stack.append(instr)

    # S’il reste un stack à la fin
    if stack:
        if nb_assigment_to_merge > 1:
            rewritten = rewrite_code(stack)
            new_instrs.extend(rewritten)
        else:
            new_instrs.extend(stack)

    return new_instrs

# BUG: ligne 145
def opt_merge_consecutive_uncomplemented_conditions(instructions): 
    """Regroupe les test de conditions sur plusieurs bits en une instruction unique.""" 

    def fuse_nested_ifs(instrs):
        """
        Transforme une séquence imbriquée de comment_cond + and_bit_branch
        en un seul comment_multi_if + and_multi_bit_branch.
        """

        # [
        #     {
        #         "type": "comment_multi_if",
        #         "conditions": [
        #             {"reg": 5, "op": "==", "value": 0},
        #             {"reg": 1, "op": "!=", "value": 0},
        #             {"reg": 2, "op": "!=", "value": 0},
        #             {"reg": 0, "op": "!=", "value": 0},
        #             {"reg": 4, "op": "!=", "value": 0},
        #             {"reg": 3, "op": "!=", "value": 0},
        #         ],
        #         "indent": 3
        #     },
        #     {
        #         "type": "and_multi_bit_branch",
        #         "var": "tmp0",
        #         "and_bits": [5,1,2,0,4,3],
        #         "cmp_bits": [1,2,0,3],
        #         "label": 373,
        #         "indent": 3
        #     }
        # ]

        comment_conditions = []
        conditions = []
        comment_assigns = []
        assigns = []
        and_bits = []
        cmp_bits = []
        var = None
        main_label = None
        main_indent = None
    



        new_instrs = []
        num_line = 0

        # 0: waiting for "comment_cond", "and_bit_branch"
        # 1: waiting for 'comment_assign', 'comment_multi_assign', 'assign_or_bit', 'assign_multi_or_bit'
        # 2: waiting for 'label','terminal_jmp'
        # 3: waiting for end
        etat = 0

        for instr in instrs:

            # instr = instrs[i]
            indent = instr["indent"]

            if (etat == 0):
                if instr["type"] in ["comment_cond", "and_bit_branch"]:
                    etat = 1
                    if instr["type"] == "comment_cond":
                        comment_conditions.append(f"(a{instr['abit']} {instr['op']} 0)")
                    elif instr["type"] == "and_bit_branch":
                        instr['branch']
                        bitnum = int(var[1:])
                        regnum = bitnum // 16
                        offset = "+1" if ((bitnum%16)//8 != 0) else ""

                        if not main_label: main_label = instr["label"]
                        conditions.append({
                            "reg": "tmp{regnum}{offset}",
                            "var": instr["var"],
                            "bit": instr["bit"],
                            'branch': instr["branch"],
                            "label": instr["label"],
                        })

                else:
                    pass
            elif (etat == 1):
                if instr["type"] in ['comment_assign', 'comment_multi_assign', 'assign_or_bit', 'assign_multi_or_bit']:
                    etat = 2
                    assigns.append(instr)
                elif instr["type"] in ["comment_cond", "and_bit_branch"]:
                    if instr["type"] == "comment_cond":
                        comment_conditions.append(f"(a{instr['abit']} {instr['op']} 0)")
                    elif instr["type"] == "and_bit_branch":
                        conditions.append({
                            "var": instr["var"],
                            "bit": instr["bit"],
                            'branch': instr["branch"],
                            "label": instr["label"],
                        })
                        if not main_label: main_label = instr["label"]
                        if not main_indent : main_indent = instr["indent"]
                        and_bits.append(instr["bit"])
                        if (instr["branch"] == 'bne'): cmp_bits.append(instr["bit"])
                else:
                    pass
            elif (etat == 2):
                if instr["type"] in ['label', 'terminal_jmp']:
                    etat = 3
                elif instr["type"] in ['comment_assign', 'comment_multi_assign', 'assign_or_bit', 'assign_multi_or_bit']:
                    # TODO: réduire l'indentation des assigns
                    assigns.append(instr)
                elif instr["type"] in ["comment_cond", "and_bit_branch"]:
                    etat = 1
                    if instr["type"] == "comment_cond":
                        comment_conditions.append(f"(a{instr['abit']} {instr['op']} 0)")
                    elif instr["type"] == "and_bit_branch":
                        instr['branch']
                        bitnum = int(var[1:])
                        regnum = bitnum // 16
                        offset = "+1" if ((bitnum%16)//8 != 0) else ""

                        if not main_label: main_label = instr["label"]
                        conditions.append({
                            "reg": "tmp{regnum}{offset}",
                            "var": instr["var"],
                            "bit": instr["bit"],
                            'branch': instr["branch"],
                            "label": instr["label"],
                        })
                else:
                    pass
            elif (etat == 3):
                for reg in ['tmp0']:
                    conds = [c for c in conditions if c['var'] == 'tmp0']
                    if len(conds) != 0:
                        # print (f"assigns = {assigns}")
                        # print (f"conditions = {conditions}")
                        # print (f"comment_conditions = {comment_conditions}")
                        new_instrs.append({
                            "type": "comment_multi_if",
                            "conditions": comment_conditions,
                            "indent": main_indent
                        })
                        new_instrs.append({
                            "type": "and_multi_bit_branch",
                            "var": reg,
                            "and_bits": and_bits,
                            "cmp_bits": cmp_bits,
                            "label": main_label,
                            "indent": main_indent
                        })
                # TODO: réduire l'indentation des assigns
                new_instrs += assigns
                new_instrs.append({
                    "type": "terminal_jmp",
                    "indent": main_indent,
                })
                new_instrs.append({
                    "type": "label",
                    "label": main_label,
                })


                return new_instrs
            num_line += 1
        return new_instrs

    def rewrite_code(list_of_instruction):
        # Cet optimiseur ne s'applique qu'à des sections contenant plusieurs conditions imbriquées
        nb_condition = len([ins for ins in list_of_instruction if ins["type"] == "and_bit_branch"])
        if nb_condition < 2:
            return list_of_instruction
        else:
            return fuse_nested_ifs(list_of_instruction)
    
    new_instrs = []

    nb_conditions_to_merge      = 0
    nb_assigment_to_merge       = 0
    nb_jumps_to_merge           = 0
    current_indentation         = 0
    # 0: attente comment_cond / and_bit_branch
    # 1: attente comment_assign / comment_multi_assign / assign_or_bit/ assign_multi_or_bit
    # 2: attente label / terminal_jmp
    # 3: attente autre chose que label / terminal_jmp
    etat                        = 0 
    stack                       = []

    for i, instr in enumerate(instructions):
        if etat == 0:
            if instr["type"] in ['comment_cond', 'and_bit_branch']:                
                etat = 1
                current_indentation = instr["indent"]
                stack.append(instr)
                if instr["type"] == 'and_bit_branch':
                    nb_conditions_to_merge += 1
            else:
                new_instrs.append(instr)
        elif etat == 1:
            if instr["type"] in ['comment_assign', 'comment_multi_assign', 'assign_or_bit', 'assign_multi_or_bit']:                
                etat = 2
                stack.append(instr)
                if instr["type"] == 'assign_or_bit':
                    nb_assigment_to_merge += 1
                if instr["type"] == 'and_bit_branch':
                    nb_conditions_to_merge += 1
            elif instr["type"] in ['comment_cond', 'and_bit_branch']:
                stack.append(instr)
                if instr["type"] == 'and_bit_branch':
                    nb_conditions_to_merge += 1
            # elif instr["type"] not in ['label','terminal_jmp']:
            else:
                new_instrs.append(instr)
        elif etat == 2:
            if instr["type"] in ['label','terminal_jmp']:
                etat = 3
                stack.append(instr)
                if instr["type"] == 'terminal_jmp':
                    nb_jumps_to_merge += 1
            elif instr["type"] in ['comment_assign', 'comment_multi_assign', 'assign_or_bit', 'assign_multi_or_bit']:
                stack.append(instr)
                if instr["type"] == 'assign_or_bit':
                    nb_assigment_to_merge += 1
                if instr["type"] == 'and_bit_branch':
                    nb_conditions_to_merge += 1
            elif instr["type"] in ['comment_cond', 'and_bit_branch']:
                etat = 1
                nb_assigment_to_merge = 0
                nb_conditions_to_merge = 0
                nb_jumps_to_merge = 0
                current_indentation         = instr["indent"]
                new_instrs.extend(stack)
                stack = []
                stack.append(instr)
            else:
                print ("--== ERROR ==--")
                pass
        elif etat==3:
            if instr["type"] in ['label','terminal_jmp']:
                if instr["type"] == 'terminal_jmp': 
                    if instr["indent"] >= current_indentation:
                        nb_jumps_to_merge += 1
                        stack.append(instr)
                    else:
                        # we cannot optimise at the level of the "else" we are on. So indent level + 1
                        while stack[0]["indent"] < instr["indent"]+1:
                            new_instrs.append(stack.pop(0))
                        rewritten = rewrite_code(stack)
                        new_instrs.extend(rewritten)
                        stack = []
                        etat = 0
                        nb_assigment_to_merge = 0
                        nb_conditions_to_merge = 0
                        nb_jumps_to_merge = 0
                        new_instrs.append(instr)
                elif instr["type"] == 'label':
                    stack.append(instr)
            else:
                if nb_assigment_to_merge > 1 or nb_conditions_to_merge > 1 or nb_jumps_to_merge > 1:
                    # we cannot optimise at the level of the "else" we are on. So indent level + 1
                    while stack[0]["indent"] < instr["indent"]+1:
                        new_instrs.append(stack.pop(0))
                    rewritten = rewrite_code(stack)
                    new_instrs.extend(rewritten)
                    stack = []
                else:
                    new_instrs.extend(stack)
                    stack = []

                if instr["type"] in ['comment_assign', 'comment_multi_assign', 'assign_or_bit', 'assign_multi_or_bit']:
                    print ("--== ERROR ==--")
                    pass
                elif instr["type"] in ['comment_else']:
                    etat = 0
                    nb_assigment_to_merge = 0
                    nb_conditions_to_merge = 0
                    nb_jumps_to_merge = 0
                    new_instrs.append(instr)
                elif instr["type"] in ['comment_cond', 'and_bit_branch']:
                    etat = 1
                    nb_assigment_to_merge = 0
                    nb_conditions_to_merge = 0
                    nb_jumps_to_merge = 0
                    stack.append(instr)
                else: 
                    etat = 0
                    new_instrs.append(instr)
            

    # S’il reste un stack à la fin
    # if stack:
    #     if nb_conditions_to_merge > 1:
    #         rewritten = rewrite_code(stack)
    #         new_instrs.extend(rewritten)
    #     else:
    #         new_instrs.extend(stack)
    return new_instrs


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
    # lecture du fichier function_raw.asm
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
