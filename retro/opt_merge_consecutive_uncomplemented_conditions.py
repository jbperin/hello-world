# BUG line 81
def opt_merge_consecutive_uncomplemented_conditions(instructions): 
    """Regroupe les test de conditions sur plusieurs bits en une instruction unique.""" 


    def multi_reg_condition_merge(instrs):
        new_instrs = []
        list_of_condition = [ins for ins in instrs if ins["type"] == "and_bit_branch"]
        list_of_different_register = list(set([ins['addr'] for ins in instrs if ins["type"] == "and_bit_branch"]))
        list_of_bit_4_and_on_tmp0 = [ins['bit'] for ins in instrs if (ins["type"] == "and_bit_branch") and (ins["addr"] == "tmp0")] 
        list_of_bit_4_and_on_tmp0p1 = [ins['bit'] for ins in instrs if (ins["type"] == "and_bit_branch") and (ins["addr"] == "tmp0+1")] 
        list_of_bit_4_cmp_on_tmp0 = [ins['bit'] for ins in instrs if (ins["type"] == "and_bit_branch") and (ins["addr"] == "tmp0") and (ins["branch"] == "bne")] 
        list_of_bit_4_cmp_on_tmp0p1 = [ins['bit'] for ins in instrs if (ins["type"] == "and_bit_branch") and (ins["addr"] == "tmp0+1") and (ins["branch"] == "bne")] 
        list_of_bit_4_and_on_tmp1 = [ins['bit'] for ins in instrs if (ins["type"] == "and_bit_branch") and (ins["addr"] == "tmp1")] 
        list_of_bit_4_and_on_tmp1p1 = [ins['bit'] for ins in instrs if (ins["type"] == "and_bit_branch") and (ins["addr"] == "tmp1+1")] 
        list_of_bit_4_cmp_on_tmp1 = [ins['bit'] for ins in instrs if (ins["type"] == "and_bit_branch") and (ins["addr"] == "tmp1") and (ins["branch"] == "bne")] 
        list_of_bit_4_cmp_on_tmp1p1 = [ins['bit'] for ins in instrs if (ins["type"] == "and_bit_branch") and (ins["addr"] == "tmp1+1") and (ins["branch"] == "bne")] 
        list_of_assigns_related = [ins for ins in instrs if ins["type"] in ["assign_multi_or_bit", "comment_multi_assign",'assign_or_bit', 'comment_assign']]
        list_of_endif_related = [ins for ins in instrs if ins["type"] in ["label", "terminal_jmp"]]
        if (len(list_of_bit_4_and_on_tmp0)!=0): 
            ins_cond_tmp0={
                            "type": "and_multi_bit_branch",
                            "var": "tmp0",
                            "and_bits": list_of_bit_4_and_on_tmp0,
                            "cmp_bits": list_of_bit_4_cmp_on_tmp0,
                            "label": instrs[1]["label"], # FIXME : find the label of the first branch condition rather than hardcoded '1'
                            "indent": instrs[0]["indent"]
                        }
            new_instrs.append (ins_cond_tmp0)
        if (len(list_of_bit_4_and_on_tmp0p1)!=0): 
            ins_cond_tmp0p1={
                            "type": "and_multi_bit_branch",
                            "var": "tmp0+1",
                            "and_bits": list_of_bit_4_and_on_tmp0p1,
                            "cmp_bits": list_of_bit_4_cmp_on_tmp0p1,
                            "label": instrs[1]["label"], # FIXME : find the label of the first branch condition rather than hardcoded '1'
                            "indent": instrs[0]["indent"]
                        }
            new_instrs.append (ins_cond_tmp0p1)
        if (len(list_of_bit_4_and_on_tmp1)!=0): 
            ins_cond_tmp1={
                            "type": "and_multi_bit_branch",
                            "var": "tmp1",
                            "and_bits": list_of_bit_4_and_on_tmp1,
                            "cmp_bits": list_of_bit_4_cmp_on_tmp1,
                            "label": instrs[1]["label"], # FIXME : find the label of the first branch condition rather than hardcoded '1'
                            "indent": instrs[0]["indent"]
                        }
            new_instrs.append (ins_cond_tmp1)
        if (len(list_of_bit_4_and_on_tmp1p1)!=0): 
            ins_cond_tmp1p1={
                            "type": "and_multi_bit_branch",
                            "var": "tmp1+1",
                            "and_bits": list_of_bit_4_and_on_tmp1p1,
                            "cmp_bits": list_of_bit_4_cmp_on_tmp1p1,
                            "label": instrs[1]["label"], # FIXME : find the label of the first branch condition rather than hardcoded '1'
                            "indent": instrs[0]["indent"]
                        }
            new_instrs.append (ins_cond_tmp1p1)
        
        
        new_instrs.extend(list_of_assigns_related)
        new_instrs.append ({
            "type": "label",
            "label": instrs[1]["label"]
        })
        nb_remaining_instr = len(list_of_endif_related) -  2 * len(list_of_condition)
        if (nb_remaining_instr != 0): new_instrs.extend(list_of_endif_related[-nb_remaining_instr:])
        return new_instrs
    
    def fuse_nested_ifs(instrs):
        """
        Transforme une séquence imbriquée de comment_cond + and_bit_branch
        en un seul comment_multi_if + and_multi_bit_branch.
        """

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
                new_instrs += instrs[num_line+1:]
                # new_instrs.append({
                #     "type": "terminal_jmp",
                #     "indent": main_indent,
                # })
                # new_instrs.append({
                #     "type": "label",
                #     "label": main_label,
                # })


                return new_instrs
            num_line += 1
        return new_instrs

    def rewrite_code(list_of_instruction):
        # Cet optimiseur ne s'applique qu'à des sections contenant plusieurs conditions imbriquées
        nb_condition = len([ins for ins in list_of_instruction if ins["type"] == "and_bit_branch"])
        if nb_condition < 2:
            return list_of_instruction
        else:
            list_of_different_register = list(set([ins['addr'] for ins in list_of_instruction if ins["type"] == "and_bit_branch"]))
            if len(list_of_different_register) == 1:
                return fuse_nested_ifs(list_of_instruction)
            else:
                return multi_reg_condition_merge(list_of_instruction)
                
    
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

    for num_line, instr in enumerate(instructions):
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
    if len(stack):
        if nb_conditions_to_merge > 1:
            rewritten = rewrite_code(stack)
            new_instrs.extend(rewritten)
        else:
            new_instrs.extend(stack)
    return new_instrs
