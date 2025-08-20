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
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_8: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_9: skip:.):
                    ; r5 = 1, r4 = 1, r3 = 1, r0 = 1
                    lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_9:
                jmp _unefonctionDone
lbl_8:
                ; else:
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_10: skip:.):
                    ; r6 = 1, r4 = 1, r3 = 1, r1 = 1
                    lda tmp7: ora #BIT_6+BIT_4+BIT_3+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_10:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_7:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_12: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_13: skip:.):
                    ; r6 = 1, r5 = 1, r4 = 1, r1 = 1
                    lda tmp7: ora #BIT_6+BIT_5+BIT_4+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_13:
                  ; else:
                    ; r7 = 1, r2 = 1
                    lda tmp7: ora #BIT_7+BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_12:
                ; else:
                  ; r7 = 1, r4 = 1
                  lda tmp7: ora #BIT_7+BIT_4: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_16: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_16:
                  ; else:
                    ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
            jmp _unefonctionDone
lbl_6:
            ; else:
              ; r7 = 1
              lda tmp7: ora #BIT_7: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_17: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_18: skip:.):
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_19: skip:.):
                    ; r3 = 1, r1 = 1
                    lda tmp7: ora #BIT_3+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_19:
                  ; else:
                    ; r4 = 1, r3 = 1, r2 = 1, r0 = 1
                    lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_18:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_21: skip:.):
                    ; r5 = 1, r4 = 1, r2 = 1
                    lda tmp7: ora #BIT_5+BIT_4+BIT_2: sta tmp7
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
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_52: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_53: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_54: skip:.):
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
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_57:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_53:
              ; else:
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_59: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_60: skip:.):
                    ; r3 = 1, r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_60:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                jmp _unefonctionDone
lbl_59:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_62: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_62:
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
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_63: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_64: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_65: skip:.):
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_65:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_64:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
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
              jmp _unefonctionDone
lbl_63:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_68: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_69: skip:.):
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_69:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_68:
                ; else:
                  ; r3 = 1, r1 = 1
                  lda tmp7: ora #BIT_3+BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_71: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_71:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_51:
          ; else:
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_72: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_73: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_74: skip:.):
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
                  ; r6 = 1, r2 = 1
                  lda tmp7: ora #BIT_6+BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_77: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_77:
              jmp _unefonctionDone
lbl_73:
              ; else:
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_79: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_80: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_80:
                jmp _unefonctionDone
lbl_79:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_81: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_81:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_72:
            ; else:
              ; r6 = 1
              lda tmp7: ora #BIT_6: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_84: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_85: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_86: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_86:
                jmp _unefonctionDone
lbl_85:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_87: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_87:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_84:
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
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_98: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_99: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_99:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_98:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_97:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_102: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_103: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_103:
                jmp _unefonctionDone
lbl_102:
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
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_105: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_106: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_107: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_107:
                jmp _unefonctionDone
lbl_106:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_108: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_108:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_105:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_110: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_110:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_111: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_111:
                jmp _unefonctionDone
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_95:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a1 == 0):
            lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_112: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_113: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_114: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_115: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_115:
                  ; else:
                    ; r3 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_114:
                ; else:
                  ; r3 = 1, r2 = 1
                  lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_118: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_118:
              jmp _unefonctionDone
lbl_113:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_120: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_121: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_121:
                jmp _unefonctionDone
lbl_120:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_122: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_122:
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_112:
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
                ; if (a0 != 0) and (a1 != 0):
                lda tmp0: and #BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_138: skip:.)
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
          ; if (a1 == 0):
          lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_156: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_157: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_158: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_159: skip:.):
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
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_157:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_166: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_167: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_167:
                ; else:
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_166:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_169: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_170: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_170:
                jmp _unefonctionDone
lbl_169:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_156:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_172: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_173: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_174: skip:.):
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_174:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_173:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_176: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_177: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_177:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_176:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_179: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_179:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_172:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_181: skip:.):
                ; r3 = 1, r2 = 1
                lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_182: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_182:
              jmp _unefonctionDone
lbl_181:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_184: skip:.):
                  ; r3 = 1, r2 = 1
                  lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_185: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_185:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_184:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_187: skip:.):
                    ; r3 = 1, r2 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_187:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
        jmp _unefonctionDone
lbl_155:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_189: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_190: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_191: skip:.):
                ; if (a1 != 0) and (a0 != 0):
                lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_192: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_192:
              jmp _unefonctionDone
lbl_191:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_194: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_194:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_190:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_195: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_196: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_196:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_195:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_198: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_198:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_189:
          ; else:
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_200: skip:.):
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_201: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_202: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_203: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_203:
                jmp _unefonctionDone
lbl_202:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_201:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_204: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_205: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_205:
                jmp _unefonctionDone
lbl_204:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_200:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_207: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_208: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_209: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_209:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_208:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_207:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_212: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_213: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_213:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_212:
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
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_216: skip:.):
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_217: skip:.):
            ; if (a1 == 0):
            lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_218: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_219: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_220: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_221: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_221:
                  ; else:
                    ; r3 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_220:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_224: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_224:
              jmp _unefonctionDone
lbl_219:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_226: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_226:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_227: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_227:
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_218:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_229: skip:.):
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_230: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_230:
              jmp _unefonctionDone
lbl_229:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_231: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_231:
                ; else:
                  ; r2 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_0: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_217:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_233: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_234: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_235: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_235:
              jmp _unefonctionDone
lbl_234:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0) and (a0 != 0):
                lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_236: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_236:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_233:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 != 0):
              lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_238: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_239: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_239:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_238:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_216:
        ; else:
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_241: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_242: skip:.):
              ; r3 = 1, r2 = 1, r1 = 1
              lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_243: skip:.):
                ; if (a1 != 0) and (a0 != 0):
                lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_244: skip:.)
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
            jmp _unefonctionDone
lbl_242:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_247: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_248: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_248:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_250: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_250:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_247:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_241:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_253: skip:.):
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_254: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_255: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_256: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_256:
                jmp _unefonctionDone
lbl_255:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_254:
            jmp _unefonctionDone
lbl_253:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_258: skip:.):
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_258:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_260: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_261: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_261:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_260:
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
    ; if (a7 == 0):
    lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_265: skip:.):
      ; if (a8 == 0):
      lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_266: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_267: skip:.):
          ; r6 = 1
          lda tmp7: ora #BIT_6: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_268: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_269: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_270: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_271: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_272: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_272:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_271:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_274: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_274:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_270:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_276: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_277: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_277:
                jmp _unefonctionDone
lbl_276:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_278: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_278:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_269:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_280: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_281: skip:.):
                  ; r4 = 1, r3 = 1, r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_282: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_282:
                jmp _unefonctionDone
lbl_281:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_284: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_284:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_280:
              ; else:
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_286: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_287: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_287:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_286:
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
lbl_268:
          ; else:
            ; r5 = 1
            lda tmp7: ora #BIT_5: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_289: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_290: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_291: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_292: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_292:
                  ; else:
                    ; r3 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_291:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_295: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_295:
                  ; else:
                    ; r2 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_290:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_296: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_297: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_297:
                jmp _unefonctionDone
lbl_296:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_298: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_298:
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
lbl_267:
        ; else:
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_309: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_310: skip:.):
              ; r6 = 1, r5 = 1, r4 = 1
              lda tmp7: ora #BIT_6+BIT_5+BIT_4: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_311: skip:.):
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
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_315: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_316: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_316:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_315:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_317: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_317:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_310:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_320: skip:.):
                ; r6 = 1, r5 = 1, r4 = 1, r3 = 1, r2 = 1
                lda tmp7: ora #BIT_6+BIT_5+BIT_4+BIT_3+BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_321: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_322: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_322:
                jmp _unefonctionDone
lbl_321:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_323: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_323:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_320:
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
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_330: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_331: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_331:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_333: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_333:
              jmp _unefonctionDone
lbl_330:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_334: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_335: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_335:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
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
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_337: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_338: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_339: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_339:
                jmp _unefonctionDone
lbl_338:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_337:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_340: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_341: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_341:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_340:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_344: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_344:
              jmp _unefonctionDone
            jmp _unefonctionDone
      jmp _unefonctionDone
lbl_266:
      ; else:
        ; r7 = 1, r6 = 1
        lda tmp7: ora #BIT_7+BIT_6: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_346: skip:.):
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_347: skip:.):
            ; r4 = 1, r3 = 1
            lda tmp7: ora #BIT_4+BIT_3: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_348: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_349: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_349:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_348:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_350: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_351: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_352: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
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
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_353: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_354: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_354:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_353:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_347:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_358: skip:.):
              ; r4 = 1, r3 = 1
              lda tmp7: ora #BIT_4+BIT_3: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_359: skip:.):
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_359:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_358:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_361: skip:.):
                ; r4 = 1, r3 = 1, r2 = 1, r1 = 1
                lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_362: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_363: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_363:
                jmp _unefonctionDone
lbl_362:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_361:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_365: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_366: skip:.):
                    ; r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_366:
                  ; else:
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                jmp _unefonctionDone
lbl_365:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
        jmp _unefonctionDone
lbl_346:
        ; else:
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_369: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_370: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_371: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_372: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_373: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_373:
                jmp _unefonctionDone
lbl_372:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_371:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_374: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_374:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_370:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_376: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_377: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_377:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_376:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_379: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_379:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_369:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_381: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_382: skip:.):
                ; if (a0 != 0) and (a1 != 0):
                lda tmp0: and #BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_383: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_383:
              jmp _unefonctionDone
lbl_382:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_381:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_385: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_385:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
    jmp _unefonctionDone
lbl_265:
    ; else:
      ; r7 = 1
      lda tmp7: ora #BIT_7: sta tmp7
      ; if (a8 == 0):
      lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_386: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_387: skip:.):
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_388: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_389: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_390: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_391: skip:.):
                  ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_391:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
              jmp _unefonctionDone
lbl_390:
              ; else:
                ; r4 = 1, r2 = 1
                lda tmp7: ora #BIT_4+BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_394: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_395: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_395:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_394:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_389:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_398: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_399: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_400: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_400:
                jmp _unefonctionDone
lbl_399:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_401: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_401:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_398:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_403: skip:.):
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_403:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_388:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_405: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_406: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_407: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_407:
              jmp _unefonctionDone
lbl_406:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a0 != 0) and (a1 != 0):
                lda tmp0: and #BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_408: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_408:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_405:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_410: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_411: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_412: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_412:
                jmp _unefonctionDone
lbl_411:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_410:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_413: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_413:
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_387:
        ; else:
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_415: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_416: skip:.):
              ; r5 = 1, r4 = 1, r3 = 1
              lda tmp7: ora #BIT_5+BIT_4+BIT_3: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_417: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_418: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_419: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_419:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_418:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_417:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_422: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_422:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_423: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_423:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_416:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_426: skip:.):
                ; r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1
                lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_427: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_428: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_428:
                jmp _unefonctionDone
lbl_427:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_426:
              ; else:
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; if (a1 != 0) and (a0 != 0):
                lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_430: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_430:
          jmp _unefonctionDone
lbl_415:
          ; else:
            ; r6 = 1
            lda tmp7: ora #BIT_6: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_433: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_434: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_435: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_435:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_437: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_437:
              jmp _unefonctionDone
lbl_434:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_438: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_438:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_433:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_439: skip:.):
                ; if (a0 != 0) and (a1 != 0):
                lda tmp0: and #BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_440: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_440:
              jmp _unefonctionDone
lbl_439:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_442: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_442:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
      jmp _unefonctionDone
lbl_386:
      ; else:
        ; r6 = 1, r5 = 1, r4 = 1
        lda tmp7: ora #BIT_6+BIT_5+BIT_4: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_444: skip:.):
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_445: skip:.):
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_446: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_447: skip:.):
                ; if (a1 != 0) and (a0 != 0):
                lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_448: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_448:
              jmp _unefonctionDone
lbl_447:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_446:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a1 != 0) and (a2 != 0):
              lda tmp0: and #BIT_1+BIT_2: cmp #BIT_1+BIT_2: .(:beq skip: jmp lbl_450: skip:.)
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_450:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_445:
          ; else:
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_453: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_454: skip:.):
                ; r2 = 1, r1 = 1, r0 = 1
                lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_454:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_456: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_457: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_457:
                jmp _unefonctionDone
lbl_456:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_453:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_459: skip:.):
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_460: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_460:
              jmp _unefonctionDone
lbl_459:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_461: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_462: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_462:
                jmp _unefonctionDone
lbl_461:
                ; else:
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_464: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_464:
              jmp _unefonctionDone
        jmp _unefonctionDone
lbl_444:
        ; else:
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_465: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_466: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_467: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_468: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_469: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_469:
                jmp _unefonctionDone
lbl_468:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_467:
            jmp _unefonctionDone
lbl_466:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_472: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_473: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_473:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_475: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_475:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_472:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_465:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_478: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_479: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_480: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_481: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_481:
                jmp _unefonctionDone
lbl_480:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_479:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_483: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_483:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_485: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_485:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_478:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_487: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_488: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_489: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_489:
                jmp _unefonctionDone
lbl_488:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_487:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone