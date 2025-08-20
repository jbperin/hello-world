  ; if (a8 == 0):
  lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a7 == 0):
    lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a6 == 0):
      lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_3: skip:.):
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
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_9:
                  ; else:
                    ; r6 = 1
                    lda tmp7: ora #BIT_6: sta tmp7
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_8:
              jmp _unefonctionDone
lbl_7:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_12: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_13: skip:.):
                    ; r6 = 1
                    lda tmp7: ora #BIT_6: sta tmp7
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_13:
                  ; else:
                    ; r7 = 1
                    lda tmp7: ora #BIT_7: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_12:
                ; else:
                  ; r7 = 1
                  lda tmp7: ora #BIT_7: sta tmp7
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_16: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_16:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
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
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_19:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_18:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_21: skip:.):
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_21:
                  ; else:
                    ; r6 = 1
                    lda tmp7: ora #BIT_6: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_17:
              ; else:
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_23: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_24: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_24:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_23:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_26: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_26:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_5:
          ; else:
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_28: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_29: skip:.):
                ; r7 = 1
                lda tmp7: ora #BIT_7: sta tmp7
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_30: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_31: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_31:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_30:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_32: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_32:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_29:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_34: skip:.):
                  ; r7 = 1
                  lda tmp7: ora #BIT_7: sta tmp7
                  ; r6 = 1
                  lda tmp7: ora #BIT_6: sta tmp7
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_35: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                  jmp _unefonctionDone
lbl_35:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_34:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_37: skip:.):
                    ; r7 = 1
                    lda tmp7: ora #BIT_7: sta tmp7
                    ; r6 = 1
                    lda tmp7: ora #BIT_6: sta tmp7
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_37:
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
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_40: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_41: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_42: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_42:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_41:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_44: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_44:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_40:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_45: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_46: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_46:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_45:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_47: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_47:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
        jmp _unefonctionDone
lbl_4:
        ; else:
          ; r8 = 1
          lda tmp7+1: ora #BIT_8: sta tmp7+1
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_50: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_51: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_52: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_53: skip:.):
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_54: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_54:
                jmp _unefonctionDone
lbl_53:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_56: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_56:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_52:
              ; else:
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_58: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_59: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_59:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_58:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_60: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_60:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_51:
            ; else:
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_61: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_62: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_63: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_63:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                jmp _unefonctionDone
lbl_62:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_66: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_66:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_61:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_67: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_68: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_68:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_67:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_69: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_69:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_50:
          ; else:
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_70: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_71: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_72: skip:.):
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_73: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_73:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_72:
                ; else:
                  ; r6 = 1
                  lda tmp7: ora #BIT_6: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_75: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_75:
              jmp _unefonctionDone
lbl_71:
              ; else:
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_77: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_78: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_78:
                jmp _unefonctionDone
lbl_77:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_79: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_79:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_70:
            ; else:
              ; r6 = 1
              lda tmp7: ora #BIT_6: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_82: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_83: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_84: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_84:
                jmp _unefonctionDone
lbl_83:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_85: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_85:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_82:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_86: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_87: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_87:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_86:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_90: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_90:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; r8 = 1
        lda tmp7+1: ora #BIT_8: sta tmp7+1
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_92: skip:.):
          ; r6 = 1
          lda tmp7: ora #BIT_6: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_93: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_94: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_95: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_96: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_97: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_97:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_96:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_99: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_99:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_95:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_101: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_102: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_102:
                jmp _unefonctionDone
lbl_101:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_103: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_103:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_94:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_105: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_106: skip:.):
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_107: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_107:
                jmp _unefonctionDone
lbl_106:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_109: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_109:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_105:
              ; else:
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_111: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_112: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_112:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_111:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_114: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_114:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
          jmp _unefonctionDone
lbl_93:
          ; else:
            ; r5 = 1
            lda tmp7: ora #BIT_5: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_115: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_116: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_117: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_118: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_118:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_117:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_121: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_121:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_116:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_122: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_123: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_123:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_122:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_124: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_124:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_115:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_125: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_126: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_127: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_127:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                jmp _unefonctionDone
lbl_126:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_125:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_131: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_132: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_132:
                jmp _unefonctionDone
lbl_131:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_133: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_133:
                jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_92:
        ; else:
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_134: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_135: skip:.):
              ; r6 = 1
              lda tmp7: ora #BIT_6: sta tmp7
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_136: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_137: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_138: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_138:
                jmp _unefonctionDone
lbl_137:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_136:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_140: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_141: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_141:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_140:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_142: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_142:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_135:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_145: skip:.):
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_146: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_147: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_147:
                jmp _unefonctionDone
lbl_146:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_148: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_148:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_145:
              ; else:
                ; r7 = 1
                lda tmp7: ora #BIT_7: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_150: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_151: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_151:
                jmp _unefonctionDone
lbl_150:
                ; else:
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_152: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_152:
                jmp _unefonctionDone
          jmp _unefonctionDone
lbl_134:
          ; else:
            ; r7 = 1
            lda tmp7: ora #BIT_7: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_154: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_155: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_156: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_156:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_158: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_158:
              jmp _unefonctionDone
lbl_155:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_159: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_160: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_160:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_159:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_154:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_162: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_163: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_164: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_164:
                jmp _unefonctionDone
lbl_163:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_162:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_165: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_166: skip:.):
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
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_169: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_169:
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
      ; if (a6 == 0):
      lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_171: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_172: skip:.):
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_173: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_174: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_175: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_176: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_177: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_177:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_176:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_175:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_180: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_181: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_181:
                jmp _unefonctionDone
lbl_180:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_182: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_182:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_174:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_185: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_186: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_187: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_187:
                jmp _unefonctionDone
lbl_186:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_185:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_189: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_190: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_190:
                jmp _unefonctionDone
lbl_189:
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_173:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_191: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_192: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_193: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_194: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_194:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_193:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_197: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_197:
              jmp _unefonctionDone
lbl_192:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_199: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_200: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_200:
                jmp _unefonctionDone
lbl_199:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_201: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_201:
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_191:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_202: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_203: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_204: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_204:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_203:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_206: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_206:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_202:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_207: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_207:
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_172:
        ; else:
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_208: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_209: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_210: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_211: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_211:
              jmp _unefonctionDone
lbl_210:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_212: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_212:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_209:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_213: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_214: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_214:
              jmp _unefonctionDone
lbl_213:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_215: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_215:
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_208:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_216: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_217: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_218: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_219: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_219:
                jmp _unefonctionDone
lbl_218:
              jmp _unefonctionDone
lbl_217:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_220: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_221: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_221:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_220:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_224: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_224:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_216:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_225: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_226: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_227: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_227:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_226:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_225:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
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
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_171:
      ; else:
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_232: skip:.):
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_233: skip:.):
            ; if (a1 == 0):
            lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_234: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_235: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_236: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_236:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_235:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_239: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_240: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_240:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_239:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_241: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_241:
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_234:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_243: skip:.):
                ; if (a4 != 0):
                lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_244: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_244:
              jmp _unefonctionDone
lbl_243:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_245: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_245:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_233:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_247: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_248: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_249: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_250: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_250:
                jmp _unefonctionDone
lbl_249:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_251: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_251:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_248:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_253: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_254: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_254:
                jmp _unefonctionDone
lbl_253:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_247:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_255: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_256: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_256:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_255:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_259: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_259:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_232:
        ; else:
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_261: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_262: skip:.):
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_263: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_264: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_265: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_265:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_264:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_268: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_268:
              jmp _unefonctionDone
lbl_263:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_269: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_270: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_270:
                jmp _unefonctionDone
lbl_269:
                ; else:
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_271: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_271:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_262:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_273: skip:.):
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
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_274: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_275: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_275:
                jmp _unefonctionDone
lbl_274:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_273:
              ; else:
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_277: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_278: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_278:
                jmp _unefonctionDone
lbl_277:
          jmp _unefonctionDone
lbl_261:
          ; else:
            ; r6 = 1
            lda tmp7: ora #BIT_6: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_280: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_281: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_282: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_282:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_284: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_284:
              jmp _unefonctionDone
lbl_281:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_285: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_285:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_280:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_286: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_287: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_288: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_288:
                jmp _unefonctionDone
lbl_287:
              jmp _unefonctionDone
lbl_286:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_289: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_289:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
      jmp _unefonctionDone
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; r8 = 1
    lda tmp7+1: ora #BIT_8: sta tmp7+1
    ; r7 = 1
    lda tmp7: ora #BIT_7: sta tmp7
    ; r6 = 1
    lda tmp7: ora #BIT_6: sta tmp7
    ; if (a7 == 0):
    lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_292: skip:.):
      ; if (a6 == 0):
      lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_293: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_294: skip:.):
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_295: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_296: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_297: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_298: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_299: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_299:
                jmp _unefonctionDone
lbl_298:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_301: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_301:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_297:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_304: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_304:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_305: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_305:
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_296:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_306: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_307: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_308: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_308:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_307:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_306:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_311: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_312: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_312:
                jmp _unefonctionDone
lbl_311:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_295:
          ; else:
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_314: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_315: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_316: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_316:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_315:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_318: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_319: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_319:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_318:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_314:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_322: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_323: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_324: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_324:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_323:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_325: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_325:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_322:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_327: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_328: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_328:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_327:
                ; else:
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_330: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_330:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
        jmp _unefonctionDone
lbl_294:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_332: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_333: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_334: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_335: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_336: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_336:
                jmp _unefonctionDone
lbl_335:
              jmp _unefonctionDone
lbl_334:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_337: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_337:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_333:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_338: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_339: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_340: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_340:
                jmp _unefonctionDone
lbl_339:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_338:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_341: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_342: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_342:
                jmp _unefonctionDone
lbl_341:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_332:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_343: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_344: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_345: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_345:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_344:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_346: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_346:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_343:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_349: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_350: skip:.):
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
lbl_350:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_349:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_354: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_355: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_355:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_354:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_293:
      ; else:
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_359: skip:.):
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_360: skip:.):
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_361: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_362: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_362:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_361:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_363: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_363:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_360:
          ; else:
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_366: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_367: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_368: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_369: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_369:
                jmp _unefonctionDone
lbl_368:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_367:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_370: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_371: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_371:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_370:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_366:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_375: skip:.):
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_376: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_377: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_377:
                jmp _unefonctionDone
lbl_376:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_375:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_379: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_380: skip:.):
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
lbl_380:
                  ; else:
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                jmp _unefonctionDone
lbl_379:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
        jmp _unefonctionDone
lbl_359:
        ; else:
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_384: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_385: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_386: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_387: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_388: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_388:
                jmp _unefonctionDone
lbl_387:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_386:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_389: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_389:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_385:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_392: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_393: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_393:
              jmp _unefonctionDone
lbl_392:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_395: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_395:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_384:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_397: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_398: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_399: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_400: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_400:
                jmp _unefonctionDone
lbl_399:
              jmp _unefonctionDone
lbl_398:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_397:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_401: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_401:
            jmp _unefonctionDone
          jmp _unefonctionDone
    jmp _unefonctionDone
lbl_292:
    ; else:
      ; r5 = 1
      lda tmp7: ora #BIT_5: sta tmp7
      ; if (a6 == 0):
      lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_402: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_403: skip:.):
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_404: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_405: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_406: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_407: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_408: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_408:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_407:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_411: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_411:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_406:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_413: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_414: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_414:
                jmp _unefonctionDone
lbl_413:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_415: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_415:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_405:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_418: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_419: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_420: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_420:
                jmp _unefonctionDone
lbl_419:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_418:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_421: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_422: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_422:
                jmp _unefonctionDone
lbl_421:
                ; else:
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_423: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_423:
                jmp _unefonctionDone
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_404:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_424: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_425: skip:.):
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_426: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_427: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_427:
                jmp _unefonctionDone
lbl_426:
              jmp _unefonctionDone
lbl_425:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_428: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_429: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_429:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_428:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_432: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_432:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_424:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_433: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_434: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_434:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_433:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_437: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_437:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_438: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_438:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_403:
        ; else:
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_441: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_442: skip:.):
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_443: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_444: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_445: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_445:
                jmp _unefonctionDone
lbl_444:
              jmp _unefonctionDone
lbl_443:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_442:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_447: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_448: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_449: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_449:
                jmp _unefonctionDone
lbl_448:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_447:
          jmp _unefonctionDone
lbl_441:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_452: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_453: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_454: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_454:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_456: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_456:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_453:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_452:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_458: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_458:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_460: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_461: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_461:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_460:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
      jmp _unefonctionDone
lbl_402:
      ; else:
        ; r4 = 1
        lda tmp7: ora #BIT_4: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_464: skip:.):
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_465: skip:.):
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_466: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_467: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_468: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_469: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_469:
                jmp _unefonctionDone
lbl_468:
              jmp _unefonctionDone
lbl_467:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_466:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a1 != 0):
              lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_470: skip:.):
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_471: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_471:
              jmp _unefonctionDone
lbl_470:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_465:
          ; else:
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_473: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_474: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_474:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_473:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_477: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_478: skip:.):
                  ; if (a1 != 0):
                  lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_479: skip:.):
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
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_480: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_480:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_482: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_482:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
        jmp _unefonctionDone
lbl_464:
        ; else:
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_484: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_485: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_486: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_487: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_488: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_488:
                jmp _unefonctionDone
lbl_487:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_486:
            jmp _unefonctionDone
lbl_485:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_491: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_492: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_492:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_494: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_494:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_491:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_484:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_497: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_498: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_499: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_500: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_500:
                jmp _unefonctionDone
lbl_499:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_498:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_502: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_502:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_504: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_504:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_497:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_506: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_507: skip:.):
                  ; if (a0 != 0):
                  lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_508: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_508:
                jmp _unefonctionDone
lbl_507:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_506:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone
