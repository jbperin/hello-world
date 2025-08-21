import json
from pathlib import Path


def read_abstree_from_json():
    with open(Path("retro/abstree.json"), "r") as fic_in:
        abstree = json.load(fic_in)
    return abstree

labeller = 0
def labeller_get():
    global labeller
    labeller += 1
    return labeller



    
def abstree_to_asm6502_code(abstree, indent=0):
    code_lines = []
    ind = '  ' * indent
    gen_comment = True
    def comment(st): return code_lines.append(st) if gen_comment else ""
    # Handle value assignment
    if 'value' in abstree:
        comment(f"{ind}; {abstree['value']}")
        
        [bitnum, bitval] = [int(v.strip().replace('r','')) for v in abstree['value'].strip().split("=")]
        offset = "+1" if ((bitnum%16)//8 != 0) else ""
        code_lines.append(f"{ind}lda tmp7{offset}: ora #BIT_{bitnum}: sta tmp7{offset}")
    # If there is a subtree, process it recursively
    if 'subtree' in abstree:
        if 'feature' in abstree['subtree']:
            var = f"a{abstree['subtree']['feature']}"
            if 'left' in abstree['subtree']:
                comment(f"{ind}; if ({var} == 0):")
                new_label = labeller_get()
                bitnum = int(var[1:])
                regnum = bitnum // 16
                offset = "+1" if ((bitnum%16)//8 != 0) else ""
                # code_lines.append(f"{ind}lda tmp{regnum}{offset} : and #BIT_{bitnum}: bne lbl_{new_label}")
                code_lines.append(f"{ind}lda tmp{regnum}{offset} : and #BIT_{bitnum}: .(:beq skip: jmp lbl_{new_label}: skip:.):")
                
                code_lines += abstree_to_asm6502_code(abstree['subtree']['left'], indent + 1)   
                code_lines.append(f"{ind}jmp _unefonctionDone")    
                code_lines.append(f"lbl_{new_label}:")    
                if 'right' in abstree['subtree']:
                    comment(f"{ind}; else:")     
                    code_lines += abstree_to_asm6502_code(abstree['subtree']['right'], indent + 1)
                    code_lines.append(f"{ind}jmp _unefonctionDone")

            else:
                if 'right' in abstree['subtree']:  
                    comment(f"{ind}; if ({var} != 0):")       
                    new_label = labeller_get()
                    bitnum = int(var[1:])
                    regnum = bitnum // 16
                    offset = "+1" if ((bitnum%16)//8 != 0) else ""

                    # code_lines.append(f"{ind}lda tmp{regnum}{offset} : and #BIT_{bitnum}: beq lbl_{new_label}")
                    code_lines.append(f"{ind}lda tmp{regnum}{offset} : and #BIT_{bitnum}: .(:bne skip: jmp lbl_{new_label}: skip:.):")
                    code_lines += abstree_to_asm6502_code(abstree['subtree']['right'], indent + 1)
                    code_lines.append(f"{ind}jmp _unefonctionDone")
                    code_lines.append(f"lbl_{new_label}:")
        else:
            code_lines += abstree_to_asm6502_code(abstree['subtree'], indent)
    else:
        # If there is a feature, handle it
        if 'feature' in abstree:
            var = f"a{abstree['feature']}"
            if 'left' in abstree:

                comment(f"{ind}; if ({var} == 0):")
                new_label = labeller_get()
                bitnum = int(var[1:])
                regnum = bitnum // 16
                offset = "+1" if ((bitnum%16)//8 != 0) else ""
                # code_lines.append(f"{ind}lda tmp{regnum}{offset}: and #BIT_{bitnum}: bne lbl_{new_label}")
                code_lines.append(f"{ind}lda tmp{regnum}{offset} : and #BIT_{bitnum}: .(:beq skip: jmp lbl_{new_label}: skip:.):")

                code_lines += abstree_to_asm6502_code(abstree['left'], indent + 1)

                code_lines.append(f"{ind}jmp _unefonctionDone")
                code_lines.append(f"lbl_{new_label}:")
                if 'right' in abstree:
                    new_label_2 = labeller_get()
                    # code_lines.append(f"{ind}jmp lbl_{new_label_2}:")
                    comment(f"{ind}; else:")
                    code_lines += abstree_to_asm6502_code(abstree['right'], indent + 1)
                    # code_lines.append(f"lbl_{new_label_2}:")
                
                
            else:
                if 'right' in abstree:
                    comment(f"{ind}; if ({var} != 0):")
                    new_label = labeller_get()
                    bitnum = int(var[1:])
                    regnum = bitnum // 16
                    offset = "+1" if ((bitnum%16)//8 != 0) else ""
                    # code_lines.append(f"{ind}lda tmp{regnum}{offset}: and #BIT_{bitnum}: beq lbl_{new_label}")
                    code_lines.append(f"{ind}lda tmp{regnum}{offset} : and #BIT_{bitnum}: .(:bne skip: jmp lbl_{new_label}: skip:.):")
                    code_lines += abstree_to_asm6502_code(abstree['right'], indent + 1)
                    code_lines.append(f"{ind}jmp _unefonctionDone")
                    code_lines.append(f"lbl_{new_label}:")
    # Sauvegarde des lignes dans function_raw.asm
    # raw_file_path = Path("retro/function_raw.asm")
    # with raw_file_path.open("w", encoding="utf-8") as raw_ficout:
    #     for line in code_lines:
    #         raw_ficout.write(line + "\n")

    return code_lines

def optim_asm_code(code_lines):
    return code_lines

def generate_function_asm_code(abstree, indent=0):
    code_lines = ["#define BIT_0    1",
                  "#define BIT_1    2",
                  "#define BIT_2    4",
                  "#define BIT_3    8",
                  "#define BIT_4   16",
                  "#define BIT_5   32",
                  "#define BIT_6   64",
                  "#define BIT_7  128",
                  "#define BIT_8    1",
                  "#define BIT_9    2",
                  "#define BIT_10   4",
                  "#define BIT_11   8",
                  "#define BIT_12  16",
                  "#define BIT_13  32",
                  "#define BIT_14  64",
                  "#define BIT_15 128",
                  "#define BIT_16   1",
                  "#define BIT_17   2",
                  "#define BIT_18   4",
                  "#define BIT_19   8",
                  "#define BIT_20  16",
                  "#define BIT_21  32",
                  "#define BIT_22  64",
                  "#define BIT_23 128",
                  "_function_input_0        .dsb	2",
                  "_function_input_1        .dsb	2",
                  "_function_output 		.dsb	2",
                  "sav_reg_0 		        .dsb	2",
                  "sav_reg_1 		        .dsb	2",
                  "sav_reg_7 		        .dsb	2",
                  "",
                  "theFunction:",
                  ".(",
                  '#include "function_core.s"',
                  "_unefonctionDone",
                  ".)",
                  "    rts",
                  "_uneFonction:",
                  ".(",
                  "lda tmp0: sta sav_reg_0",
                  "lda tmp0+1: sta sav_reg_0+1",
                  "lda tmp1: sta sav_reg_1",
                  "lda tmp1+1: sta sav_reg_1+1",
                  "lda tmp7: sta sav_reg_7",
                  "lda tmp7+1: sta sav_reg_7+1",
                  "lda #0: sta tmp7: sta tmp7+1",
                  "lda _function_input_0: sta tmp0",
                  "lda _function_input_0+1: sta tmp0+1",
                  "lda _function_input_1: sta tmp1",
                  "lda _function_input_1+1: sta tmp1+1",
                  #"  [a0, a1, a2, a3] = a",
                  # f"  [{', '.join([f'a{i}' for i in range(NBITS_INPUT)])}] = a",
                  #"  [r0, r1, r2, r3] = [0, 0, 0, 0]",
                  # f"  [{', '.join([f'r{i}' for i in range(NBITS_OUTPUT)])}] = [{', '.join([f'0' for i in range(NBITS_OUTPUT)])}]",
                 ]  # Function header
    # code_lines += abstree_to_asm6502_code(abstree, indent=indent+1)
    code_lines += ['jsr theFunction']
    code_lines += [
                  "lda tmp7: sta _function_output",
                  "lda tmp7+1: sta _function_output+1",
                  "lda sav_reg_0: sta tmp0: ",
                  "lda sav_reg_0+1: sta tmp0+1: ",
                  "lda sav_reg_1: sta tmp1: ",
                  "lda sav_reg_1+1: sta tmp1+1: ",
                  "lda sav_reg_7: sta tmp7: ",
                  "lda sav_reg_7+1: sta tmp7+1: ",
    ]
    # code_lines.append(f"  r = [{', '.join([f'r{i}' for i in range(NBITS_OUTPUT)])}]")
    code_lines.append(f".):")
    code_lines.append(f"rts")

    return code_lines

# ——— Main ———
if __name__ == "__main__":


    with open ("retro\\brute_code\\fonction.s", "w") as ficout:
        for line in generate_function_asm_code(read_abstree_from_json()):
            # print (line)
            ficout.write(line+"\n")
