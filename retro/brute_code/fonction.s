#define BIT_0    1
#define BIT_1    2
#define BIT_2    4
#define BIT_3    8
#define BIT_4   16
#define BIT_5   32
#define BIT_6   64
#define BIT_7  128
#define BIT_8    1
#define BIT_9    2
#define BIT_10   4
#define BIT_11   8
#define BIT_12  16
#define BIT_13  32
#define BIT_14  64
#define BIT_15 128
_function_input 		    .dsb	2
_function_output 		.dsb	2
sav_reg_0 		        .dsb	2
sav_reg_7 		        .dsb	2
_uneFonction:
.(
lda tmp0: sta sav_reg_0
lda tmp0+1: sta sav_reg_0+1
lda tmp7: sta sav_reg_7
lda tmp7+1: sta sav_reg_7+1
lda #0: sta tmp7: sta tmp7+1
lda _function_input: sta tmp0
lda _function_input+1: sta tmp0+1
  ; if (a8 == 0):
  lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a10 == 0):
    lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a11 == 0):
      lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a9 == 0):
        lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_4: skip:.):
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_5: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_6: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_7: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_8: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_9: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_10: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_11: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_12: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_12:
                      jmp _unefonctionDone
lbl_11:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_14: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_14:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_10:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; if (a0 != 0):
                      lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_16: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_17: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_17:
                      jmp _unefonctionDone
lbl_16:
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_9:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_19: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_20: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_21: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_21:
                      jmp _unefonctionDone
lbl_20:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_19:
                jmp _unefonctionDone
lbl_8:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_23: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_23:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_7:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_25: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_26: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_27: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_27:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_29: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_30: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_30:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_29:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_26:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_33: skip:.):
                      ; if (a1 != 0):
                      lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_34: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_35: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_35:
                      jmp _unefonctionDone
lbl_34:
                    jmp _unefonctionDone
lbl_33:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_25:
                ; else:
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_37: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_38: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_38:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_39: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_39:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_41: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_41:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_37:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_44: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_45: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_46: skip:.):
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_46:
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_45:
                      ; else:
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_44:
                    ; else:
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_6:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_50: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_51: skip:.):
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_52: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_52:
                jmp _unefonctionDone
lbl_51:
                ; else:
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_54: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_55: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_56: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_57: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_57:
                      jmp _unefonctionDone
lbl_56:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_55:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_54:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_60: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_61: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_61:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_63: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_63:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_60:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_50:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_66: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_67: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_68: skip:.):
                      ; if (a1 != 0):
                      lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_69: skip:.):
                        ; if (a3 != 0):
                        lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_70: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_70:
                      jmp _unefonctionDone
lbl_69:
                    jmp _unefonctionDone
lbl_68:
                  jmp _unefonctionDone
lbl_67:
                jmp _unefonctionDone
lbl_66:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_5:
          ; else:
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_72: skip:.):
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_73: skip:.):
                ; if (a6 == 0):
                lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_74: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_75: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_76: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_76:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_78: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_79: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_79:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_78:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_75:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_74:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_84: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_85: skip:.):
                      ; if (a1 != 0):
                      lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_86: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_87: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_87:
                      jmp _unefonctionDone
lbl_86:
                    jmp _unefonctionDone
lbl_85:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_84:
              jmp _unefonctionDone
lbl_73:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a6 == 0):
                lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_89: skip:.):
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_90: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_91: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_92: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_93: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_93:
                      jmp _unefonctionDone
lbl_92:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_91:
                  jmp _unefonctionDone
lbl_90:
                jmp _unefonctionDone
lbl_89:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_95: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_95:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_72:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_97: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a6 == 0):
                lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_98: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_98:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_97:
              ; else:
                ; if (a6 == 0):
                lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_100: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_101: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_102: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_102:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_104: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_104:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_106: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_106:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_101:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_100:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_109: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_110: skip:.):
                      ; if (a3 == 0):
                      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_111: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_112: skip:.):
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_112:
                        ; else:
                          ; r4 = 1
                          lda tmp7: ora #BIT_4: sta tmp7
                      jmp _unefonctionDone
lbl_111:
                      ; else:
                        ; r4 = 1
                        lda tmp7: ora #BIT_4: sta tmp7
                    jmp _unefonctionDone
lbl_110:
                    ; else:
                      ; r4 = 1
                      lda tmp7: ora #BIT_4: sta tmp7
                  jmp _unefonctionDone
lbl_109:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
        jmp _unefonctionDone
lbl_4:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_117: skip:.):
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_118: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_119: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_119:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_121: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_122: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_122:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_124: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_125: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_126: skip:.):
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_126:
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_125:
                      ; else:
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_124:
                    ; else:
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_121:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_118:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_132: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_133: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_134: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_134:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_136: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_137: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_137:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_139: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_139:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_136:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_133:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_132:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_143: skip:.):
                  ; if (a5 != 0):
                  lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_144: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_145: skip:.):
                      ; if (a3 != 0):
                      lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_146: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_147: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_147:
                      jmp _unefonctionDone
lbl_146:
                    jmp _unefonctionDone
lbl_145:
                  jmp _unefonctionDone
lbl_144:
                jmp _unefonctionDone
lbl_143:
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_117:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_148: skip:.):
              ; if (a7 == 0):
              lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_149: skip:.):
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_150: skip:.):
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_151: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_152: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_153: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_154: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_154:
                      jmp _unefonctionDone
lbl_153:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_152:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_151:
                jmp _unefonctionDone
lbl_150:
              jmp _unefonctionDone
lbl_149:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_148:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_157: skip:.):
                ; if (a7 == 0):
                lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_158: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_158:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_157:
              ; else:
                ; if (a7 == 0):
                lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_160: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_160:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_162: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_163: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_163:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_165: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_166: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_166:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_165:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_162:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; r5 = 1
        lda tmp7: ora #BIT_5: sta tmp7
        ; if (a9 == 0):
        lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_171: skip:.):
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_172: skip:.):
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_173: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_174: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_175: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_175:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_177: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_178: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_178:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_180: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_180:
                      ; else:
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_182: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_182:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_177:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_174:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_173:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a6 != 0):
              lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_186: skip:.):
                ; if (a4 != 0):
                lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_187: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_188: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_189: skip:.):
                      ; if (a0 != 0):
                      lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_190: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_191: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_191:
                      jmp _unefonctionDone
lbl_190:
                    jmp _unefonctionDone
lbl_189:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_188:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_187:
              jmp _unefonctionDone
lbl_186:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_172:
          ; else:
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_195: skip:.):
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_195:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_197: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_198: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_198:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_200: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_201: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_202: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_203: skip:.):
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_203:
                        ; else:
                          ; r4 = 1
                          lda tmp7: ora #BIT_4: sta tmp7
                      jmp _unefonctionDone
lbl_202:
                      ; else:
                        ; r4 = 1
                        lda tmp7: ora #BIT_4: sta tmp7
                    jmp _unefonctionDone
lbl_201:
                    ; else:
                      ; r4 = 1
                      lda tmp7: ora #BIT_4: sta tmp7
                  jmp _unefonctionDone
lbl_200:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
              jmp _unefonctionDone
lbl_197:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
        jmp _unefonctionDone
lbl_171:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_209: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_210: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_210:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_212: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_213: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_213:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_215: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_215:
                  ; else:
                    ; if (a4 == 0):
                    lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_217: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_217:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_219: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_220: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_220:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_219:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_212:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_209:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 != 0):
            lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_224: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_225: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_226: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_227: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_228: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_229: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_230: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_230:
                      jmp _unefonctionDone
lbl_229:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_228:
                  jmp _unefonctionDone
lbl_227:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_226:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_225:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_224:
          jmp _unefonctionDone
        jmp _unefonctionDone
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; r5 = 1
      lda tmp7: ora #BIT_5: sta tmp7
      ; if (a11 == 0):
      lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_235: skip:.):
        ; if (a9 == 0):
        lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_236: skip:.):
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_237: skip:.):
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_238: skip:.):
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_239: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_240: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_241: skip:.):
                    ; if (a4 == 0):
                    lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_242: skip:.):
                      ; if (a3 == 0):
                      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_243: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_244: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_244:
                      jmp _unefonctionDone
lbl_243:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_242:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_241:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_240:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_239:
            jmp _unefonctionDone
lbl_238:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_249: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_250: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_251: skip:.):
                    ; if (a1 != 0):
                    lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_252: skip:.):
                      ; if (a2 != 0):
                      lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_253: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_254: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_254:
                      jmp _unefonctionDone
lbl_253:
                    jmp _unefonctionDone
lbl_252:
                  jmp _unefonctionDone
lbl_251:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_250:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_249:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_237:
          ; else:
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_257: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_258: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_258:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_259: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_260: skip:.):
                    ; if (a4 == 0):
                    lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_261: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_262: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_262:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_264: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_264:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_261:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_260:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_259:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_257:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_270: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_270:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_272: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_273: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_273:
                  ; else:
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_275: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_275:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_277: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_278: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_278:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_277:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_272:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_236:
        ; else:
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_282: skip:.):
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_283: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_284: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_285: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_285:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_287: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_287:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_289: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_290: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_291: skip:.):
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_291:
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_290:
                      ; else:
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_289:
                    ; else:
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_284:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_283:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_297: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_297:
              ; else:
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_298: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_298:
                ; else:
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_300: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_300:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_302: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_303: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_303:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_305: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_305:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_302:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_282:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_309: skip:.):
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_310: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_311: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_312: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_313: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_314: skip:.):
                        ; if (a2 != 0):
                        lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_315: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_315:
                      jmp _unefonctionDone
lbl_314:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_313:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_312:
                jmp _unefonctionDone
lbl_311:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_310:
            jmp _unefonctionDone
lbl_309:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_235:
      ; else:
        ; r4 = 1
        lda tmp7: ora #BIT_4: sta tmp7
        ; if (a4 == 0):
        lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_319: skip:.):
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_320: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_321: skip:.):
              ; if (a7 == 0):
              lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_322: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_323: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_324: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_324:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_326: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_327: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_328: skip:.):
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_328:
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_327:
                      ; else:
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_326:
                    ; else:
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_323:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_322:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_321:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_335: skip:.):
                ; if (a7 != 0):
                lda tmp0 : and #BIT_7: .(:bne skip: jmp lbl_336: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_336:
              jmp _unefonctionDone
lbl_335:
              ; else:
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_337: skip:.):
                  ; if (a7 != 0):
                  lda tmp0 : and #BIT_7: .(:bne skip: jmp lbl_338: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_338:
                jmp _unefonctionDone
lbl_337:
                ; else:
                  ; if (a7 != 0):
                  lda tmp0 : and #BIT_7: .(:bne skip: jmp lbl_340: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_341: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_342: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_342:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_344: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_344:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_341:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_340:
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_320:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_348: skip:.):
              ; if (a7 != 0):
              lda tmp0 : and #BIT_7: .(:bne skip: jmp lbl_349: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_349:
            jmp _unefonctionDone
lbl_348:
            ; else:
              ; if (a7 == 0):
              lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_350: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_351: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_352: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_353: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_354: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_355: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_355:
                      jmp _unefonctionDone
lbl_354:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_353:
                  jmp _unefonctionDone
lbl_352:
                jmp _unefonctionDone
lbl_351:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_350:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_358: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_359: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_360: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_360:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_362: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_362:
                      ; else:
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_364: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_364:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_359:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_358:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_319:
        ; else:
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_368: skip:.):
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_369: skip:.):
              ; if (a7 != 0):
              lda tmp0 : and #BIT_7: .(:bne skip: jmp lbl_370: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_370:
            jmp _unefonctionDone
lbl_369:
            ; else:
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_371: skip:.):
                ; if (a7 != 0):
                lda tmp0 : and #BIT_7: .(:bne skip: jmp lbl_372: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_372:
              jmp _unefonctionDone
lbl_371:
              ; else:
                ; if (a7 == 0):
                lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_374: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_375: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_376: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_377: skip:.):
                        ; if (a2 != 0):
                        lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_378: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_378:
                      jmp _unefonctionDone
lbl_377:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_376:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_375:
                jmp _unefonctionDone
lbl_374:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_368:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_382: skip:.):
              ; if (a7 != 0):
              lda tmp0 : and #BIT_7: .(:bne skip: jmp lbl_383: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_383:
            jmp _unefonctionDone
lbl_382:
            ; else:
              ; if (a7 == 0):
              lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_384: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_384:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; if (a11 == 0):
    lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_386: skip:.):
      ; if (a10 == 0):
      lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_387: skip:.):
        ; if (a7 == 0):
        lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_388: skip:.):
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_389: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_390: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_391: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_392: skip:.):
                  ; if (a5 != 0):
                  lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_393: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_393:
                jmp _unefonctionDone
lbl_392:
                ; else:
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_395: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_396: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_397: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_398: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_398:
                      jmp _unefonctionDone
lbl_397:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_396:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_395:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_401: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_402: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_402:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_404: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_404:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_401:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_391:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_407: skip:.):
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_408: skip:.):
                    ; if (a0 != 0):
                    lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_409: skip:.):
                      ; if (a1 != 0):
                      lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_410: skip:.):
                        ; if (a2 != 0):
                        lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_411: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_411:
                      jmp _unefonctionDone
lbl_410:
                    jmp _unefonctionDone
lbl_409:
                  jmp _unefonctionDone
lbl_408:
                jmp _unefonctionDone
lbl_407:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_390:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_412: skip:.):
                ; if (a6 == 0):
                lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_413: skip:.):
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_414: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_414:
                jmp _unefonctionDone
lbl_413:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_415: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_415:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_412:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_417: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_418: skip:.):
                    ; if (a6 == 0):
                    lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_419: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_419:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_418:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a6 != 0):
                    lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_421: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_421:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_417:
                ; else:
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_423: skip:.):
                    ; if (a6 == 0):
                    lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_424: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_424:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_423:
                  ; else:
                    ; if (a6 == 0):
                    lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_426: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_426:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_428: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_429: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_429:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_428:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_389:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_432: skip:.):
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_433: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_434: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_435: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_436: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_437: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_438: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_438:
                      jmp _unefonctionDone
lbl_437:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_436:
                  jmp _unefonctionDone
lbl_435:
                jmp _unefonctionDone
lbl_434:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_433:
            jmp _unefonctionDone
lbl_432:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_441: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_441:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_443: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_444: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_445: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_445:
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_447: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_447:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_449: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_449:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_444:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_443:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_388:
        ; else:
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_454: skip:.):
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_455: skip:.):
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_456: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_457: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_458: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_459: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_460: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_461: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_461:
                      jmp _unefonctionDone
lbl_460:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_459:
                  jmp _unefonctionDone
lbl_458:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_457:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_456:
            jmp _unefonctionDone
lbl_455:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_465: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_466: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_467: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_467:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_469: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_469:
                    ; else:
                      ; if (a3 == 0):
                      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_471: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_471:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_473: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_473:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_466:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_465:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a5 != 0):
                lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_477: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_478: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_479: skip:.):
                      ; if (a1 != 0):
                      lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_480: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_481: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_481:
                      jmp _unefonctionDone
lbl_480:
                    jmp _unefonctionDone
lbl_479:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_478:
                jmp _unefonctionDone
lbl_477:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_454:
          ; else:
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_484: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a6 != 0):
              lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_485: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_485:
            jmp _unefonctionDone
lbl_484:
            ; else:
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_487: skip:.):
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_488: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_489: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_490: skip:.):
                      ; if (a0 != 0):
                      lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_491: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_492: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_492:
                      jmp _unefonctionDone
lbl_491:
                    jmp _unefonctionDone
lbl_490:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_489:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_488:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_487:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_496: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_497: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_498: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_499: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_500: skip:.):
                          ; r4 = 1
                          lda tmp7: ora #BIT_4: sta tmp7
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_500:
                        ; else:
                          ; r5 = 1
                          lda tmp7: ora #BIT_5: sta tmp7
                      jmp _unefonctionDone
lbl_499:
                      ; else:
                        ; r5 = 1
                        lda tmp7: ora #BIT_5: sta tmp7
                    jmp _unefonctionDone
lbl_498:
                    ; else:
                      ; r5 = 1
                      lda tmp7: ora #BIT_5: sta tmp7
                  jmp _unefonctionDone
lbl_497:
                  ; else:
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                jmp _unefonctionDone
lbl_496:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
      jmp _unefonctionDone
lbl_387:
      ; else:
        ; r5 = 1
        lda tmp7: ora #BIT_5: sta tmp7
        ; if (a9 == 0):
        lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_506: skip:.):
          ; r2 = 1
          lda tmp7: ora #BIT_2: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_507: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_508: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_509: skip:.):
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_510: skip:.):
                  ; if (a5 != 0):
                  lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_511: skip:.):
                    ; if (a4 != 0):
                    lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_512: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_512:
                  jmp _unefonctionDone
lbl_511:
                jmp _unefonctionDone
lbl_510:
              jmp _unefonctionDone
lbl_509:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_508:
            ; else:
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_514: skip:.):
                ; if (a5 != 0):
                lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_515: skip:.):
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_516: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_517: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_518: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_519: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_519:
                      jmp _unefonctionDone
lbl_518:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_517:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_516:
                jmp _unefonctionDone
lbl_515:
              jmp _unefonctionDone
lbl_514:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_523: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_523:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_525: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_525:
                  ; else:
                    ; if (a4 == 0):
                    lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_527: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_527:
                    ; else:
                      ; if (a5 == 0):
                      lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_529: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_529:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_531: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_531:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
          jmp _unefonctionDone
lbl_507:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a6 != 0):
            lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_533: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_534: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_535: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_536: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_537: skip:.):
                      ; if (a0 != 0):
                      lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_538: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_539: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_539:
                      jmp _unefonctionDone
lbl_538:
                    jmp _unefonctionDone
lbl_537:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_536:
                jmp _unefonctionDone
lbl_535:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_534:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_533:
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_506:
        ; else:
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_543: skip:.):
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_544: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_545: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_546: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_547: skip:.):
                    ; if (a0 != 0):
                    lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_548: skip:.):
                      ; if (a3 != 0):
                      lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_549: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_550: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_550:
                      jmp _unefonctionDone
lbl_549:
                    jmp _unefonctionDone
lbl_548:
                  jmp _unefonctionDone
lbl_547:
                jmp _unefonctionDone
lbl_546:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_545:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_544:
            ; else:
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_553: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_553:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_555: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_556: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_557: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_557:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_559: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_560: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_560:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_559:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_556:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_555:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_543:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_565: skip:.):
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_566: skip:.):
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_567: skip:.):
                  ; if (a5 != 0):
                  lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_568: skip:.):
                    ; if (a3 != 0):
                    lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_569: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_570: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_571: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_571:
                      jmp _unefonctionDone
lbl_570:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_569:
                  jmp _unefonctionDone
lbl_568:
                jmp _unefonctionDone
lbl_567:
              jmp _unefonctionDone
lbl_566:
            jmp _unefonctionDone
lbl_565:
            ; else:
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone
lbl_386:
    ; else:
      ; if (a7 == 0):
      lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_574: skip:.):
        ; r5 = 1
        lda tmp7: ora #BIT_5: sta tmp7
        ; r4 = 1
        lda tmp7: ora #BIT_4: sta tmp7
        ; if (a10 == 0):
        lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_575: skip:.):
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_576: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_577: skip:.):
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_578: skip:.):
                ; if (a5 != 0):
                lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_579: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_580: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_581: skip:.):
                      ; if (a3 == 0):
                      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_582: skip:.):
                        ; if (a2 != 0):
                        lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_583: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_583:
                      jmp _unefonctionDone
lbl_582:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_581:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_580:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_579:
              jmp _unefonctionDone
lbl_578:
            jmp _unefonctionDone
lbl_577:
            ; else:
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_576:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_587: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_588: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_588:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_590: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_591: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_591:
                  ; else:
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_593: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_593:
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_595: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_595:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_597: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_597:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_590:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_587:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_575:
        ; else:
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_600: skip:.):
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a6 != 0):
            lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_601: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_602: skip:.):
                ; if (a4 != 0):
                lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_603: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_604: skip:.):
                    ; if (a0 != 0):
                    lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_605: skip:.):
                      ; if (a3 != 0):
                      lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_606: skip:.):
                        ; if (a2 != 0):
                        lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_607: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_607:
                      jmp _unefonctionDone
lbl_606:
                    jmp _unefonctionDone
lbl_605:
                  jmp _unefonctionDone
lbl_604:
                jmp _unefonctionDone
lbl_603:
              jmp _unefonctionDone
lbl_602:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_601:
          jmp _unefonctionDone
lbl_600:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a6 != 0):
            lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_609: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_610: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_611: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_612: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_613: skip:.):
                      ; if (a1 != 0):
                      lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_614: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_615: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_615:
                      jmp _unefonctionDone
lbl_614:
                    jmp _unefonctionDone
lbl_613:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_612:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_611:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_610:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_609:
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_574:
      ; else:
        ; if (a6 == 0):
        lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_621: skip:.):
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a10 == 0):
          lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_622: skip:.):
            ; if (a9 == 0):
            lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_623: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_624: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_625: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_625:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_627: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_628: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_629: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_629:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_631: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_631:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_628:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_627:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_624:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_623:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_635: skip:.):
                ; if (a4 != 0):
                lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_636: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_637: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_638: skip:.):
                      ; if (a0 != 0):
                      lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_639: skip:.):
                        ; if (a1 != 0):
                        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_640: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_640:
                      jmp _unefonctionDone
lbl_639:
                    jmp _unefonctionDone
lbl_638:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_637:
                jmp _unefonctionDone
lbl_636:
              jmp _unefonctionDone
lbl_635:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_622:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a9 == 0):
            lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_642: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_642:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_621:
        ; else:
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_644: skip:.):
            ; r5 = 1
            lda tmp7: ora #BIT_5: sta tmp7
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a10 == 0):
            lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_645: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_646: skip:.):
                ; if (a5 != 0):
                lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_647: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_648: skip:.):
                    ; if (a1 != 0):
                    lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_649: skip:.):
                      ; if (a2 != 0):
                      lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_650: skip:.):
                        ; if (a0 != 0):
                        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_651: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_651:
                      jmp _unefonctionDone
lbl_650:
                    jmp _unefonctionDone
lbl_649:
                  jmp _unefonctionDone
lbl_648:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_647:
              jmp _unefonctionDone
lbl_646:
            jmp _unefonctionDone
lbl_645:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_653: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_654: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_654:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_656: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_657: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_657:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_659: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_660: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_660:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_659:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_656:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_653:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_644:
          ; else:
            ; if (a10 == 0):
            lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_665: skip:.):
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_665:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_667: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_668: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_669: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_670: skip:.):
                      ; if (a4 == 0):
                      lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_671: skip:.):
                        ; if (a3 == 0):
                        lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_672: skip:.):
                          ; r5 = 1
                          lda tmp7: ora #BIT_5: sta tmp7
                          ; r4 = 1
                          lda tmp7: ora #BIT_4: sta tmp7
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_672:
                        ; else:
                          ; r6 = 1
                          lda tmp7: ora #BIT_6: sta tmp7
                      jmp _unefonctionDone
lbl_671:
                      ; else:
                        ; r6 = 1
                        lda tmp7: ora #BIT_6: sta tmp7
                    jmp _unefonctionDone
lbl_670:
                    ; else:
                      ; r6 = 1
                      lda tmp7: ora #BIT_6: sta tmp7
                  jmp _unefonctionDone
lbl_669:
                  ; else:
                    ; r6 = 1
                    lda tmp7: ora #BIT_6: sta tmp7
                jmp _unefonctionDone
lbl_668:
                ; else:
                  ; r6 = 1
                  lda tmp7: ora #BIT_6: sta tmp7
              jmp _unefonctionDone
lbl_667:
              ; else:
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
  jmp _unefonctionDone
_unefonctionDone
lda tmp7: sta _function_output
lda tmp7+1: sta _function_output+1
lda sav_reg_0: sta tmp0: 
lda sav_reg_0+1: sta tmp0+1: 
lda sav_reg_7: sta tmp7: 
lda sav_reg_7+1: sta tmp7+1: 
.):
rts
