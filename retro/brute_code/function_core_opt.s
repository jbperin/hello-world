  ; if (a6 == 0):
  lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a8 == 0):
    lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a7 == 0):
      lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_4: skip:.):
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_5: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_6: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_7: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_8: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_9: skip:.):
                    ; r5 = 1, r4 = 1, r3 = 1, r0 = 1
                    lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_9:
                  ; else:
                    ; r6 = 1, r4 = 1, r3 = 1, r1 = 1
                    lda tmp7: ora #BIT_6+BIT_4+BIT_3+BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_8:
              jmp _unefonctionDone
lbl_7:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_12: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_13: skip:.):
                    ; r6 = 1, r5 = 1, r4 = 1, r1 = 1
                    lda tmp7: ora #BIT_6+BIT_5+BIT_4+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_13:
                  ; else:
                    ; r7 = 1, r4 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_7+BIT_4+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_12:
                ; else:
                  ; r7 = 1
                  lda tmp7: ora #BIT_7: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_16: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_16:
                  ; else:
                    ; r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
            jmp _unefonctionDone
lbl_6:
            ; else:
              ; r7 = 1
              lda tmp7: ora #BIT_7: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_17: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_18: skip:.):
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_19: skip:.):
                    ; r3 = 1, r1 = 1
                    lda tmp7: ora #BIT_3+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_19:
                  ; else:
                    ; r4 = 1, r2 = 1
                    lda tmp7: ora #BIT_4+BIT_2: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_18:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_21: skip:.):
                    ; r5 = 1, r4 = 1, r3 = 1, r2 = 1, r0 = 1
                    lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_21:
                  ; else:
                    ; r6 = 1, r2 = 1
                    lda tmp7: ora #BIT_6+BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_17:
              ; else:
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_23: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_24: skip:.):
                    ; r3 = 1, r2 = 1
                    lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_24:
                  ; else:
                    ; r4 = 1, r1 = 1
                    lda tmp7: ora #BIT_4+BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_23:
                ; else:
                  ; r4 = 1, r3 = 1
                  lda tmp7: ora #BIT_4+BIT_3: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_26: skip:.):
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_26:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_5:
          ; else:
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_28: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_29: skip:.):
                ; r7 = 1, r6 = 1, r5 = 1
                lda tmp7: ora #BIT_7+BIT_6+BIT_5: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_30: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_31: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_31:
                  ; else:
                    ; r3 = 1, r2 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_30:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_32: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                  jmp _unefonctionDone
lbl_32:
                  ; else:
                    ; r4 = 1, r0 = 1
                    lda tmp7: ora #BIT_4+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_29:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_35: skip:.):
                  ; r7 = 1, r6 = 1, r5 = 1, r4 = 1
                  lda tmp7: ora #BIT_7+BIT_6+BIT_5+BIT_4: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_36: skip:.):
                    ; r2 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_36:
                  ; else:
                    ; r3 = 1, r2 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_35:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_38: skip:.):
                    ; r7 = 1, r6 = 1, r5 = 1, r4 = 1, r3 = 1, r0 = 1
                    lda tmp7: ora #BIT_7+BIT_6+BIT_5+BIT_4+BIT_3+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_38:
                  ; else:
                    ; r8 = 1
                    lda tmp7+1: ora #BIT_8: sta tmp7+1
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_28:
            ; else:
              ; r8 = 1
              lda tmp7+1: ora #BIT_8: sta tmp7+1
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_41: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_42: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_43: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_43:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_42:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_45: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_45:
                  ; else:
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_41:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_46: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_47: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_47:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_46:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_48: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_48:
                  ; else:
                    ; r3 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
        jmp _unefonctionDone
lbl_4:
        ; else:
          ; r8 = 1
          lda tmp7+1: ora #BIT_8: sta tmp7+1
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_51: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_52: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_53: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_54: skip:.):
                  ; r4 = 1, r3 = 1, r2 = 1
                  lda tmp7: ora #BIT_4+BIT_3+BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_55: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_55:
                jmp _unefonctionDone
lbl_54:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_57: skip:.):
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_57:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_53:
              ; else:
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_59: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_60: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_60:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_59:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_61: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_61:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_52:
            ; else:
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_62: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_63: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_64: skip:.):
                    ; r3 = 1, r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_64:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                jmp _unefonctionDone
lbl_63:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_67: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_67:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_62:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_68: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_69: skip:.):
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_69:
                  ; else:
                    ; r3 = 1, r1 = 1
                    lda tmp7: ora #BIT_3+BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_68:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_71: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_71:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_51:
          ; else:
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_72: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_73: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_74: skip:.):
                  ; r5 = 1, r4 = 1, r3 = 1, r2 = 1
                  lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_75: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_75:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_74:
                ; else:
                  ; r6 = 1
                  lda tmp7: ora #BIT_6: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_77: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_77:
              jmp _unefonctionDone
lbl_73:
              ; else:
                ; r6 = 1, r3 = 1
                lda tmp7: ora #BIT_6+BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_79: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_80: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_80:
                jmp _unefonctionDone
lbl_79:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_81: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_81:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_72:
            ; else:
              ; r6 = 1
              lda tmp7: ora #BIT_6: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_83: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_84: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_85: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_85:
                jmp _unefonctionDone
lbl_84:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_86: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_86:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_83:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_88: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_89: skip:.):
                    ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_89:
                  ; else:
                    ; r4 = 1, r0 = 1
                    lda tmp7: ora #BIT_4+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_88:
                ; else:
                  ; r4 = 1, r1 = 1
                  lda tmp7: ora #BIT_4+BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_92: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_92:
              jmp _unefonctionDone
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; r8 = 1
        lda tmp7+1: ora #BIT_8: sta tmp7+1
        ; r7 = 1
        lda tmp7: ora #BIT_7: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_94: skip:.):
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_95: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_96: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_97: skip:.):
                ; r3 = 1, r2 = 1
                lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_98: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_99: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_99:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_98:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_101: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_101:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_97:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_103: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_104: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_104:
                jmp _unefonctionDone
lbl_103:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_96:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_106: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_107: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_108: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_108:
                jmp _unefonctionDone
lbl_107:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_109: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_109:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_106:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_111: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_111:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_112: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_112:
                jmp _unefonctionDone
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_95:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a1 == 0):
            lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_113: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_114: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_115: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_116: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_116:
                  ; else:
                    ; r3 = 1, r2 = 1
                    lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_115:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_119: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_119:
              jmp _unefonctionDone
lbl_114:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_121: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_122: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_122:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_121:
                ; else:
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_113:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_123: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_124: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_125: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_125:
                jmp _unefonctionDone
lbl_124:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_126: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_126:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_123:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_127: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_127:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_94:
        ; else:
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_128: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_129: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_130: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_131: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_131:
              jmp _unefonctionDone
lbl_130:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_132: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_132:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_129:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_133: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_134: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_134:
              jmp _unefonctionDone
lbl_133:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_135: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_135:
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_128:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_136: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_137: skip:.):
                ; if (a1 != 0) and (a0 != 0):
                lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_138: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_138:
              jmp _unefonctionDone
lbl_137:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_140: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_141: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_141:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_140:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_144: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_144:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_136:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_145: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_146: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_147: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_147:
                  ; else:
                    ; r2 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_146:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_150: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_150:
              jmp _unefonctionDone
lbl_145:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_152: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_152:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; r8 = 1
      lda tmp7+1: ora #BIT_8: sta tmp7+1
      ; r7 = 1
      lda tmp7: ora #BIT_7: sta tmp7
      ; r6 = 1
      lda tmp7: ora #BIT_6: sta tmp7
      ; if (a7 == 0):
      lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_154: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_155: skip:.):
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_156: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_157: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_158: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_159: skip:.):
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_160: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_160:
                jmp _unefonctionDone
lbl_159:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_162: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_162:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_158:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_165: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_165:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_166: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_166:
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_157:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_167: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_168: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_169: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_169:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_168:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_172: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_172:
              jmp _unefonctionDone
lbl_167:
              ; else:
                ; r2 = 1, r1 = 1
                lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_173: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_173:
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_156:
          ; else:
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_175: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_176: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_177: skip:.):
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_177:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_176:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_179: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_180: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_180:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_179:
                ; else:
                  ; r2 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_175:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_183: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_184: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_185: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_185:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_184:
                ; else:
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_183:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_187: skip:.):
                  ; r3 = 1, r1 = 1
                  lda tmp7: ora #BIT_3+BIT_1: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_188: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_188:
                jmp _unefonctionDone
lbl_187:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_190: skip:.):
                    ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_190:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
        jmp _unefonctionDone
lbl_155:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_192: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_193: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_194: skip:.):
                ; if (a1 != 0) and (a0 != 0):
                lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_195: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_195:
              jmp _unefonctionDone
lbl_194:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_197: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_197:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_193:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_198: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_199: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_200: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_200:
                jmp _unefonctionDone
lbl_199:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_198:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_201: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_202: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_202:
                jmp _unefonctionDone
lbl_201:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_192:
          ; else:
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_203: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_204: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_205: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_205:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_204:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_206: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_207: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_207:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_206:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_203:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_210: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_211: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_211:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_210:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_213: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_214: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_214:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_213:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_154:
      ; else:
        ; r5 = 1
        lda tmp7: ora #BIT_5: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_217: skip:.):
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_218: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_219: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_220: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_221: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_222: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_222:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_221:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_220:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_226: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_226:
            jmp _unefonctionDone
lbl_219:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_228: skip:.):
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_228:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_218:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_229: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_230: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_231: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_231:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_230:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0) and (a0 != 0):
                lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_233: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_233:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_229:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_235: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_236: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_237: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_237:
                jmp _unefonctionDone
lbl_236:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_235:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_238: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_238:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_217:
        ; else:
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_240: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_241: skip:.):
              ; r3 = 1, r2 = 1, r1 = 1
              lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_242: skip:.):
                ; if (a0 != 0) and (a1 != 0):
                lda tmp0: and #BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_243: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_243:
              jmp _unefonctionDone
lbl_242:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_241:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_246: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_247: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_247:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_249: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_249:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_246:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_240:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_252: skip:.):
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_253: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_254: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_255: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_255:
                jmp _unefonctionDone
lbl_254:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_253:
            jmp _unefonctionDone
lbl_252:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_257: skip:.):
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_257:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_259: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_260: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_260:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_259:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; r8 = 1
    lda tmp7+1: ora #BIT_8: sta tmp7+1
    ; if (a8 == 0):
    lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_264: skip:.):
      ; if (a7 == 0):
      lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_265: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_266: skip:.):
          ; r6 = 1
          lda tmp7: ora #BIT_6: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_267: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_268: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_269: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_270: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_271: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_271:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_270:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_273: skip:.):
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_273:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_269:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_275: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_276: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_276:
                jmp _unefonctionDone
lbl_275:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_277: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_277:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_268:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_279: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_280: skip:.):
                  ; r4 = 1, r3 = 1, r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_281: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_281:
                jmp _unefonctionDone
lbl_280:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_283: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_283:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_279:
              ; else:
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_285: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_286: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_286:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_285:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_288: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_288:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
          jmp _unefonctionDone
lbl_267:
          ; else:
            ; r5 = 1
            lda tmp7: ora #BIT_5: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_289: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_290: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_291: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_292: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_292:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_291:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_295: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_295:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_290:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_296: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_297: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_297:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_296:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_298: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_298:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_289:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_299: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_300: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_301: skip:.):
                    ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_301:
                  ; else:
                    ; r4 = 1, r1 = 1
                    lda tmp7: ora #BIT_4+BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_300:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_304: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_304:
              jmp _unefonctionDone
lbl_299:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_306: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_306:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_307: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_307:
                jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_266:
        ; else:
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_309: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_310: skip:.):
              ; r6 = 1, r5 = 1, r4 = 1
              lda tmp7: ora #BIT_6+BIT_5+BIT_4: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_311: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_312: skip:.):
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_313: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_313:
                jmp _unefonctionDone
lbl_312:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_311:
              ; else:
                ; r3 = 1, r2 = 1
                lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_315: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_316: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_316:
                jmp _unefonctionDone
lbl_315:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_317: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_317:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_310:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_319: skip:.):
                ; r6 = 1, r5 = 1, r4 = 1, r3 = 1
                lda tmp7: ora #BIT_6+BIT_5+BIT_4+BIT_3: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_320: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_321: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_321:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_320:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_322: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_322:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_319:
              ; else:
                ; r7 = 1
                lda tmp7: ora #BIT_7: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_325: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_326: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_326:
                jmp _unefonctionDone
lbl_325:
                ; else:
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_327: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_327:
                jmp _unefonctionDone
          jmp _unefonctionDone
lbl_309:
          ; else:
            ; r7 = 1
            lda tmp7: ora #BIT_7: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_329: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_330: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_331: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_331:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_333: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_333:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_330:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_334: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_335: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_335:
                jmp _unefonctionDone
lbl_334:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_329:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_336: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_337: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_338: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_338:
                jmp _unefonctionDone
lbl_337:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_336:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_339: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_340: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_340:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_339:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_343: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_343:
              jmp _unefonctionDone
            jmp _unefonctionDone
      jmp _unefonctionDone
lbl_265:
      ; else:
        ; r7 = 1
        lda tmp7: ora #BIT_7: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_345: skip:.):
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a1 == 0):
          lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_346: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_347: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_348: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_349: skip:.):
                  ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_349:
                ; else:
                  ; r4 = 1, r2 = 1
                  lda tmp7: ora #BIT_4+BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_351: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_351:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_348:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_353: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_353:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_354: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_354:
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_347:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_356: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_357: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_358: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_358:
                jmp _unefonctionDone
lbl_357:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_356:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_359: skip:.):
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_359:
                ; else:
                  ; r3 = 1, r1 = 1
                  lda tmp7: ora #BIT_3+BIT_1: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_346:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_361: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_362: skip:.):
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_363: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_363:
              jmp _unefonctionDone
lbl_362:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_364: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_365: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_365:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_364:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_367: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_367:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_361:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_368: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_369: skip:.):
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_369:
                ; else:
                  ; r3 = 1, r0 = 1
                  lda tmp7: ora #BIT_3+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_368:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_372: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_372:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_345:
        ; else:
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_373: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_374: skip:.):
              ; r5 = 1, r4 = 1, r3 = 1
              lda tmp7: ora #BIT_5+BIT_4+BIT_3: sta tmp7
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_375: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_376: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_377: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_377:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_376:
                ; else:
                  ; r2 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_375:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_380: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_381: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_381:
                jmp _unefonctionDone
lbl_380:
                ; else:
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_382: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_382:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_374:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_384: skip:.):
                ; r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1
                lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_385: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_386: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_386:
                jmp _unefonctionDone
lbl_385:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_384:
              ; else:
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; if (a1 != 0) and (a0 != 0):
                lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_388: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_388:
          jmp _unefonctionDone
lbl_373:
          ; else:
            ; r6 = 1
            lda tmp7: ora #BIT_6: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_391: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_392: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_393: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_393:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_395: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_395:
              jmp _unefonctionDone
lbl_392:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_396: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_396:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_391:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_397: skip:.):
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_398: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_398:
              jmp _unefonctionDone
lbl_397:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_399: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_400: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_400:
                jmp _unefonctionDone
lbl_399:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
        jmp _unefonctionDone
    jmp _unefonctionDone
lbl_264:
    ; else:
      ; r7 = 1, r6 = 1
      lda tmp7: ora #BIT_7+BIT_6: sta tmp7
      ; if (a7 == 0):
      lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_402: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_403: skip:.):
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_404: skip:.):
            ; r4 = 1, r3 = 1
            lda tmp7: ora #BIT_4+BIT_3: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_405: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_406: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_406:
              ; else:
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_405:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_407: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_408: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_409: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_409:
                jmp _unefonctionDone
lbl_408:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_407:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_410: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_411: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_411:
                jmp _unefonctionDone
lbl_410:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_404:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_413: skip:.):
              ; r4 = 1, r3 = 1
              lda tmp7: ora #BIT_4+BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_414: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_414:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_413:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_416: skip:.):
                ; r4 = 1, r3 = 1, r2 = 1
                lda tmp7: ora #BIT_4+BIT_3+BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_417: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_418: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_418:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_417:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_416:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_421: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_422: skip:.):
                    ; r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_422:
                  ; else:
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                jmp _unefonctionDone
lbl_421:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
        jmp _unefonctionDone
lbl_403:
        ; else:
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_426: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_427: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_428: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_429: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_430: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_430:
                jmp _unefonctionDone
lbl_429:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_428:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_431: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_431:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_427:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_433: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_434: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_434:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_433:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_436: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_436:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_426:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_438: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_439: skip:.):
                ; if (a1 != 0) and (a0 != 0):
                lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_440: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_440:
              jmp _unefonctionDone
lbl_439:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_438:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_442: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_442:
            jmp _unefonctionDone
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_402:
      ; else:
        ; r5 = 1, r4 = 1
        lda tmp7: ora #BIT_5+BIT_4: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_443: skip:.):
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_444: skip:.):
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_445: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_446: skip:.):
                ; if (a0 != 0) and (a1 != 0):
                lda tmp0: and #BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_447: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_447:
              jmp _unefonctionDone
lbl_446:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_445:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a1 != 0) and (a2 != 0):
              lda tmp0: and #BIT_1+BIT_2: cmp #BIT_1+BIT_2: .(:beq skip: jmp lbl_449: skip:.)
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_449:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_444:
          ; else:
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_452: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_453: skip:.):
                ; r2 = 1, r1 = 1, r0 = 1
                lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_453:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_455: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_456: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_456:
                jmp _unefonctionDone
lbl_455:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_452:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_458: skip:.):
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_459: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_459:
              jmp _unefonctionDone
lbl_458:
              ; else:
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_460: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_461: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_461:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_460:
              jmp _unefonctionDone
        jmp _unefonctionDone
lbl_443:
        ; else:
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_463: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_464: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_465: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_466: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_467: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_467:
                jmp _unefonctionDone
lbl_466:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_465:
            jmp _unefonctionDone
lbl_464:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_470: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_471: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_471:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_473: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_473:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_470:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_463:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_476: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_477: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_478: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_479: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_479:
                jmp _unefonctionDone
lbl_478:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_477:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_481: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_481:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_483: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_483:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_476:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_485: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_486: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_487: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_487:
                jmp _unefonctionDone
lbl_486:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_485:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone