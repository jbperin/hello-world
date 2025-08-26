# exemple from not_log2_10_10
["                jmp _unefonctionDone",
"lbl_878:",
"                ; else:",
"                  ; if (a1 == 0):",
"                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_879: skip:.):",
"                    ; if (a0 == 0):",
"                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_880: skip:.):",
"                      ; r1 = 1",
"                      lda tmp7: ora #BIT_1: sta tmp7",
"                    jmp _unefonctionDone",
"lbl_880:",
"                    ; else:",
"                      ; r0 = 1",
"                      lda tmp7: ora #BIT_0: sta tmp7",
"                  jmp _unefonctionDone",
"lbl_879:",
"                  ; else:",
"                    ; r0 = 1",
"                    lda tmp7: ora #BIT_0: sta tmp7",
"                jmp _unefonctionDone",
"            jmp _unefonctionDone",
"          jmp _unefonctionDone",
"lbl_857:",
"          ; else:",
]

# - Supprimer les clauses else
# - Modifier les labels dans les sauts des conditions

#                 jmp _unefonctionDone
# lbl_878:
#                 ; else:
#                   ; if (a1 == 0):
#                   lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_879: skip:.):
#                     ; if (a0 == 0):
#                     lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_879: skip:.):
#                       ; r1 = 1
#                       lda tmp7: ora #BIT_1: sta tmp7
#                     jmp _unefonctionDone
# lbl_879:
#                   ; else:
#                     ; r0 = 1
#                     lda tmp7: ora #BIT_0: sta tmp7
#                 jmp _unefonctionDone
#             jmp _unefonctionDone
#           jmp _unefonctionDone
# lbl_857:
#           ; else:

# exemple from not_log2_10_10
["                ; if (a2 == 0):",
"                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_929: skip:.):",
"                  ; if (a0 == 0):",
"                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_930: skip:.):",
"                    ; if (a1 == 0):",
"                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_931: skip:.):",
"                      ; r2 = 1",
"                      lda tmp7: ora #BIT_2: sta tmp7",
"                    jmp _unefonctionDone",
"lbl_931:",
"                    ; else:",
"                      ; r1 = 1",
"                      lda tmp7: ora #BIT_1: sta tmp7",
"                      ; r0 = 1",
"                      lda tmp7: ora #BIT_0: sta tmp7",
"                  jmp _unefonctionDone",
"lbl_930:",
"                  ; else:",
"                    ; r1 = 1",
"                    lda tmp7: ora #BIT_1: sta tmp7",
"                    ; r0 = 1",
"                    lda tmp7: ora #BIT_0: sta tmp7",
"                jmp _unefonctionDone",
]

#                 ; if (a2 == 0):
#                 lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_929: skip:.):
#                   ; if (a0 == 0):
#                   lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_930: skip:.):
#                     ; if (a1 == 0):
#                     lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_930: skip:.):
#                       ; r2 = 1
#                       lda tmp7: ora #BIT_2: sta tmp7
#                     jmp _unefonctionDone
# lbl_930:
#                   ; else:
#                     ; r1 = 1
#                     lda tmp7: ora #BIT_1: sta tmp7
#                     ; r0 = 1
#                     lda tmp7: ora #BIT_0: sta tmp7
#                 jmp _unefonctionDone

def rewrite_code(list_of_instruction):
    # Cet optimiseur ne s'applique qu'à des sections contenant plusieurs conditions imbriquées
    # nb_condition = len([ins for ins in list_of_instruction if ins["type"] == "and_bit_branch"])
    # if nb_condition < 2:
    #     return list_of_instruction
    # else:
    #     list_of_different_register = list(set([ins['addr'] for ins in list_of_instruction if ins["type"] == "and_bit_branch"]))
    #     if len(list_of_different_register) == 1:
    #         return fuse_nested_ifs(list_of_instruction)
    #     else:
    #         return multi_reg_condition_merge(list_of_instruction)
    pass


def opt_merge_consecutive_identical_else_clause(instructions):


    new_instrs = []

    # 0: attente comment_cond / and_bit_branch / comment_multi_if / and_multi_bit_branch
    # 1: attente comment_assign / comment_multi_assign / assign_or_bit/ assign_multi_or_bit
    # 2: attente else
    # 3: attente comment_assign / comment_multi_assign / assign_or_bit/ assign_multi_or_bit
    # 4: attente else
    # 5: attente same assign /.../
    # 6: attente else
    etat                        = 0 
    stack                       = []

    for num_line, instr in enumerate(instructions):

        if etat == 0:
            if instr ["type"] in ["and_bit_branch"]:
                pass
        elif etat == 1:
            if instr ["type"] in ["comment_multi_if", "and_multi_bit_branch"]:
                pass
        print (num_line, instr)
        num_line += 1
    return (instructions)


# ——— Main ———
if __name__ == "__main__":

    from pathlib import Path
    from optim_asm import classify_and_extract, regenerate_line
    file_path = Path("retro/brute_code/function_core_opt.s")
    with file_path.open(encoding="utf-8") as f:
        lines = f.readlines()

    # Extraction
    instructions = [classify_and_extract(l.rstrip("\n")) for l in lines]
    

    new_lines = [regenerate_line(instr) for instr in opt_merge_consecutive_identical_else_clause(instructions)]

    # Écriture dans function_clean.asm
    out_path = Path("retro/brute_code/function_core_opt2.s")
    with out_path.open("w", encoding="utf-8") as f:
        f.write("\n".join(new_lines))
