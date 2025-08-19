  ; if (a7 == 0):
  lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a5 == 0):
    lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a6 == 0):
      lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a4 == 0):
        lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_4: skip:.):
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_5: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_6: skip:.):
              ; if (a1 != 0):
              lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_7: skip:.):
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_8: skip:.):
                  ; r4 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_4+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_8:
              jmp _unefonctionDone
lbl_7:
            jmp _unefonctionDone
lbl_6:
            ; else:
              ; r6 = 1, r5 = 1
              lda tmp7: ora #BIT_6+BIT_5: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_10: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_11: skip:.):
                  ; r2 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_11:
              jmp _unefonctionDone
lbl_10:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_12: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_12:
                ; else:
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_5:
          ; else:
            ; r6 = 1
            lda tmp7: ora #BIT_6: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_13: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_14: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_15: skip:.):
                  ; r3 = 1, r1 = 1
                  lda tmp7: ora #BIT_3+BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_15:
              jmp _unefonctionDone
lbl_14:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_16: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_16:
                ; else:
                  ; r3 = 1, r1 = 1
                  lda tmp7: ora #BIT_3+BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_13:
            ; else:
              ; r5 = 1, r4 = 1
              lda tmp7: ora #BIT_5+BIT_4: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_17: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_18: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_18:
                ; else:
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_17:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_19: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_19:
                ; else:
                  ; r2 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_4:
        ; else:
          ; r7 = 1
          lda tmp7: ora #BIT_7: sta tmp7
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_21: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_22: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_23: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_24: skip:.):
                  ; r2 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_24:
              jmp _unefonctionDone
lbl_23:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_25: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_25:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_22:
            ; else:
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_28: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_29: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_29:
                ; else:
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_28:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_31: skip:.):
                  ; r3 = 1, r2 = 1, r0 = 1
                  lda tmp7: ora #BIT_3+BIT_2+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_31:
                ; else:
                  ; r4 = 1, r0 = 1
                  lda tmp7: ora #BIT_4+BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_21:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_33: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_34: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_35: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_35:
                ; else:
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_34:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_37: skip:.):
                  ; r2 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_37:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_33:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_39: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_40: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_40:
              jmp _unefonctionDone
lbl_39:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_41: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_41:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; r7 = 1, r6 = 1
        lda tmp7: ora #BIT_7+BIT_6: sta tmp7
        ; if (a4 == 0):
        lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_43: skip:.):
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_44: skip:.):
            ; if (a1 == 0):
            lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_45: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_46: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_47: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_47:
              jmp _unefonctionDone
lbl_46:
              ; else:
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_45:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_48: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_49: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_49:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_48:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_51: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_51:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_44:
          ; else:
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_52: skip:.):
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_53: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_54: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_54:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_53:
              ; else:
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_52:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_57: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_58: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_58:
              jmp _unefonctionDone
lbl_57:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_59: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_59:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_43:
        ; else:
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_61: skip:.):
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_62: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_63: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_64: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_64:
              jmp _unefonctionDone
lbl_63:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_66: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_66:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
lbl_62:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_68: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_68:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_61:
          ; else:
            ; if (a1 == 0):
            lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_70: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_71: skip:.):
                ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_71:
              ; else:
                ; r4 = 1, r0 = 1
                lda tmp7: ora #BIT_4+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_70:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_74: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_74:
        jmp _unefonctionDone
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; r7 = 1
      lda tmp7: ora #BIT_7: sta tmp7
      ; if (a6 == 0):
      lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_76: skip:.):
        ; r5 = 1
        lda tmp7: ora #BIT_5: sta tmp7
        ; if (a4 == 0):
        lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_77: skip:.):
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_78: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_79: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_80: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_81: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_81:
              jmp _unefonctionDone
lbl_80:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_82: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_82:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_79:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_84: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_85: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_85:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_84:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_87: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_87:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_78:
          ; else:
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_89: skip:.):
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_90: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_91: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_91:
              jmp _unefonctionDone
lbl_90:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_92: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_92:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_89:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_94: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_95: skip:.):
                  ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_95:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
              jmp _unefonctionDone
lbl_94:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_98: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_98:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
        jmp _unefonctionDone
lbl_77:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_99: skip:.):
            ; if (a1 == 0):
            lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_100: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_101: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_102: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_102:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_101:
              ; else:
                ; r2 = 1, r1 = 1
                lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_104: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_104:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_100:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_106: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_107: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_107:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_106:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_109: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_109:
          jmp _unefonctionDone
lbl_99:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_110: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_111: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_112: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_112:
              jmp _unefonctionDone
lbl_111:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_114: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_114:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
lbl_110:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_116: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_117: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_117:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_116:
              ; else:
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_76:
      ; else:
        ; r6 = 1
        lda tmp7: ora #BIT_6: sta tmp7
        ; if (a3 == 0):
        lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_119: skip:.):
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_120: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_121: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_122: skip:.):
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_122:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
lbl_121:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_124: skip:.):
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
lbl_120:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_125: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a1 != 0):
              lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_126: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_126:
            jmp _unefonctionDone
lbl_125:
            ; else:
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_127: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_128: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_128:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_127:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_131: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_131:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_119:
        ; else:
          ; if (a1 == 0):
          lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_132: skip:.):
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_133: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_134: skip:.):
                ; r2 = 1, r1 = 1
                lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_135: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_135:
              jmp _unefonctionDone
lbl_134:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_137: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_137:
            jmp _unefonctionDone
lbl_133:
            ; else:
              ; r3 = 1, r2 = 1
              lda tmp7: ora #BIT_3+BIT_2: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_138: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_138:
              ; else:
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_132:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_140: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_141: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_142: skip:.):
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_142:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_141:
              ; else:
                ; r3 = 1, r0 = 1
                lda tmp7: ora #BIT_3+BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_140:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_145: skip:.):
                ; r4 = 1, r3 = 1, r2 = 1, r1 = 1
                lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_145:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_147: skip:.):
                  ; r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_147:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
        jmp _unefonctionDone
      jmp _unefonctionDone
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; r7 = 1, r6 = 1, r5 = 1
    lda tmp7: ora #BIT_7+BIT_6+BIT_5: sta tmp7
    ; if (a6 == 0):
    lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_150: skip:.):
      ; if (a4 == 0):
      lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_151: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_152: skip:.):
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_153: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_154: skip:.):
              ; if (a1 != 0):
              lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_155: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_155:
            jmp _unefonctionDone
lbl_154:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_156: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_157: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_157:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_156:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_153:
          ; else:
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_160: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_161: skip:.):
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_161:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_163: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_163:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
lbl_160:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a1 != 0):
              lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_166: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_166:
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_152:
        ; else:
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_167: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_168: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_169: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_170: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_170:
              jmp _unefonctionDone
lbl_169:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_168:
            ; else:
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_172: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_173: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_173:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_172:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_167:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_176: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_176:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_151:
      ; else:
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_178: skip:.):
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_179: skip:.):
            ; if (a0 == 0):
            lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_180: skip:.):
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_181: skip:.):
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
lbl_181:
              ; else:
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_180:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_185: skip:.):
                ; r2 = 1, r1 = 1
                lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_186: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_186:
              jmp _unefonctionDone
lbl_185:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_188: skip:.):
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_188:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
          jmp _unefonctionDone
lbl_179:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_190: skip:.):
              ; if (a1 != 0):
              lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_191: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_191:
            jmp _unefonctionDone
lbl_190:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_192: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_192:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_178:
        ; else:
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_195: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_196: skip:.):
              ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
              lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_196:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_198: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_198:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_199: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_199:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_195:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_202: skip:.):
              ; if (a0 != 0) and (a1 != 0):
              lda tmp0: and #BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_203: skip:.)
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_203:
            jmp _unefonctionDone
lbl_202:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
    jmp _unefonctionDone
lbl_150:
    ; else:
      ; r4 = 1
      lda tmp7: ora #BIT_4: sta tmp7
      ; if (a5 == 0):
      lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_205: skip:.):
        ; if (a4 == 0):
        lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_206: skip:.):
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_207: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_208: skip:.):
              ; r1 = 1, r0 = 1
              lda tmp7: ora #BIT_1+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_208:
            ; else:
              ; r2 = 1, r0 = 1
              lda tmp7: ora #BIT_2+BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_207:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a3 != 0):
            lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_210: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_210:
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_206:
        ; else:
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_212: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_213: skip:.):
              ; r2 = 1, r1 = 1
              lda tmp7: ora #BIT_2+BIT_1: sta tmp7
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_214: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_215: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_215:
              jmp _unefonctionDone
lbl_214:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_213:
            ; else:
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_217: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_218: skip:.):
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_218:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_217:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
          jmp _unefonctionDone
lbl_212:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a1 == 0):
            lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_222: skip:.):
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_223: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_223:
            jmp _unefonctionDone
lbl_222:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_224: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_224:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_226: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_226:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
      jmp _unefonctionDone
lbl_205:
      ; else:
        ; r3 = 1
        lda tmp7: ora #BIT_3: sta tmp7
        ; if (a4 == 0):
        lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_228: skip:.):
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_229: skip:.):
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a2 != 0):
            lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_230: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_230:
          jmp _unefonctionDone
lbl_229:
          ; else:
            ; if (a1 == 0):
            lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_232: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_233: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_234: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_234:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_233:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
lbl_232:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_238: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_238:
        jmp _unefonctionDone
lbl_228:
        ; else:
          ; r2 = 1
          lda tmp7: ora #BIT_2: sta tmp7
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_239: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_240: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_241: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_241:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_243: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_243:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_240:
            ; else:
              ; r1 = 1, r0 = 1
              lda tmp7: ora #BIT_1+BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_239:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a3 != 0):
            lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_246: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_246:
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone