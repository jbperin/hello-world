def opt_merge_consecutive_assigns(instructions): 
    """Regroupe les affectations de plusieurs bits en une instruction unique.""" 

    def rewrite_code(list_of_instruction):

        new_instrs = []

        indent = list_of_instruction[0]["indent"]
        indent_str = "  " * indent

        regs = [(ins['reg'], ins['value']) for ins in list_of_instruction if ins["type"] == "comment_assign"]
        assigns_str = ", ".join([f"r{r} = {v}" for r, v in regs])
        new_instrs.append({
            "type": "comment_multi_assign",
            "regs": regs,
            "assigns": assigns_str,
            "indent": indent,
            "raw": f"{indent_str}; {assigns_str}"
        })


        list_of_different_register = list(set([ins['tmp'] for ins in list_of_instruction if ins["type"] == "assign_or_bit"]))
        for reg in list_of_different_register:
            # list_of_assign = [ins for ins in list_of_instruction if ins["type"] == "assign_or_bit" and ins["tmp"] == reg]
            bits = [ins["bit"] for ins in list_of_instruction if ins["type"] == "assign_or_bit" and ins["tmp"] == reg]



            # # Collecter registres et valeurs
            # regs = []
            # for instr in list_of_instruction:
            #     if instr["type"] == "comment_assign":
            #         regs.append((int(instr["reg"]), int(instr["value"])))
            #     elif instr["type"] == "comment_multi_assign" and instr["tmp"] == reg:
            #         regs.extend(instr["regs"])

            # Collecter bits
            # bits = []
            # for instr in list_of_instruction:
            #     if instr["type"] == "assign_or_bit":
            #         bits.extend(instr["bits"])
            #     elif instr["type"] == "assign_multi_or_bit":
            #         bits.extend(instr["bits"])

            # Construire nouvelle séquence fusionnée

            if bits:
                nb_bits = len(bits)
                if nb_bits == 0:
                    pass
                elif nb_bits == 1:
                    # instr['var']}: ora #BIT_{instr['bit']
                    bits_str = f"BIT_{bits[0]}" 

                    new_instrs.append({
                        "type": "assign_or_bit",
                        "var": reg,
                        "bit": bits[0],
                        "indent": indent,
                        "raw": f"{indent_str}lda {reg}: ora #{bits_str}: sta {reg}"
                    })
                else:
                    bits_str = "+".join([f"BIT_{b}" for b in sorted(bits, reverse=True)])
                    new_instrs.append({
                        "type": "assign_multi_or_bit",
                        "var": reg,
                        "bits": bits,
                        "indent": indent,
                        "raw": f"{indent_str}lda {reg}: ora #{bits_str}: sta {reg}"
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
