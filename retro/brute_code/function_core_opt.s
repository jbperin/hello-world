  ; if (a8 == 0):
  lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a6 == 0):
    lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a7 == 0):
      lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_4: skip:.):
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_5: skip:.):
            ; r9 = 1
            lda tmp7+1: ora #BIT_9: sta tmp7+1
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_6: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_7: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_8: skip:.):
                  ; r8 = 1
                  lda tmp7+1: ora #BIT_8: sta tmp7+1
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_9: skip:.):
                    ; r7 = 1
                    lda tmp7: ora #BIT_7: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_10: skip:.):
                      ; r6 = 1, r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_6+BIT_5+BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_10:
                    ; else:
                      ; r4 = 1, r3 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_3+BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_9:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_11: skip:.):
                      ; r7 = 1, r6 = 1, r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_7+BIT_6+BIT_5+BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_11:
                    ; else:
                      ; r6 = 1, r4 = 1, r3 = 1, r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_6+BIT_4+BIT_3+BIT_2+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_8:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_14: skip:.):
                    ; r8 = 1
                    lda tmp7+1: ora #BIT_8: sta tmp7+1
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_15: skip:.):
                      ; r5 = 1, r4 = 1, r1 = 1
                      lda tmp7: ora #BIT_5+BIT_4+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_15:
                    ; else:
                      ; r4 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_14:
                  ; else:
                    ; r7 = 1, r6 = 1, r5 = 1
                    lda tmp7: ora #BIT_7+BIT_6+BIT_5: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_17: skip:.):
                      ; r4 = 1, r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_2+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_17:
              jmp _unefonctionDone
lbl_7:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_19: skip:.):
                  ; r6 = 1
                  lda tmp7: ora #BIT_6: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_20: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_21: skip:.):
                      ; r5 = 1, r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_5+BIT_2+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_21:
                    ; else:
                      ; r4 = 1, r2 = 1
                      lda tmp7: ora #BIT_4+BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_20:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_23: skip:.):
                      ; r4 = 1, r3 = 1, r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_23:
                    ; else:
                      ; r3 = 1, r2 = 1
                      lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_19:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_24: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_25: skip:.):
                      ; r6 = 1, r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_6+BIT_2+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_25:
                    ; else:
                      ; r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_24:
                  ; else:
                    ; r5 = 1, r4 = 1
                    lda tmp7: ora #BIT_5+BIT_4: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_28: skip:.):
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_28:
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_6:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_29: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_30: skip:.):
                  ; r7 = 1
                  lda tmp7: ora #BIT_7: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_31: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_32: skip:.):
                      ; r6 = 1, r3 = 1, r2 = 1
                      lda tmp7: ora #BIT_6+BIT_3+BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_32:
                    ; else:
                      ; r4 = 1
                      lda tmp7: ora #BIT_4: sta tmp7
                  jmp _unefonctionDone
lbl_31:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_34: skip:.):
                      ; r5 = 1, r4 = 1, r3 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_34:
                    ; else:
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_30:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_36: skip:.):
                    ; r7 = 1
                    lda tmp7: ora #BIT_7: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_37: skip:.):
                      ; r5 = 1, r3 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_5+BIT_3+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_37:
                    ; else:
                      ; r4 = 1, r3 = 1, r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_36:
                  ; else:
                    ; r6 = 1, r5 = 1
                    lda tmp7: ora #BIT_6+BIT_5: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_39: skip:.):
                      ; r4 = 1, r3 = 1, r1 = 1
                      lda tmp7: ora #BIT_4+BIT_3+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_39:
                    ; else:
                      ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
              jmp _unefonctionDone
lbl_29:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_40: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_41: skip:.):
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_42: skip:.):
                      ; r3 = 1, r1 = 1
                      lda tmp7: ora #BIT_3+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_42:
                    ; else:
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_41:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_44: skip:.):
                      ; r4 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_44:
                    ; else:
                      ; r3 = 1, r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
                    jmp _unefonctionDone
                jmp _unefonctionDone
lbl_40:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_45: skip:.):
                    ; r4 = 1, r3 = 1
                    lda tmp7: ora #BIT_4+BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_46: skip:.):
                      ; r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_46:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_45:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_47: skip:.):
                      ; r3 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_47:
                    ; else:
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_5:
          ; else:
            ; r6 = 1
            lda tmp7: ora #BIT_6: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_49: skip:.):
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_50: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_51: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_52: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_52:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_54: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_54:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_51:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_56: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_56:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_57: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_57:
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_50:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_58: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_59: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_60: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_60:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_59:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_63: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_63:
                jmp _unefonctionDone
lbl_58:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_64: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_64:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_49:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_65: skip:.):
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_66: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_67: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_67:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_66:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_69: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_69:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_65:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_71: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_72: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_73: skip:.):
                      ; r5 = 1
                      lda tmp7: ora #BIT_5: sta tmp7
                    jmp _unefonctionDone
lbl_73:
                    ; else:
                      ; r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_72:
                  ; else:
                    ; r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_71:
                ; else:
                  ; r4 = 1, r3 = 1, r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_4:
        ; else:
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_78: skip:.):
            ; r8 = 1, r7 = 1
            lda tmp7+1: ora #BIT_8: sta tmp7+1
            lda tmp7: ora #BIT_7: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_79: skip:.):
              ; r6 = 1
              lda tmp7: ora #BIT_6: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_80: skip:.):
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_81: skip:.):
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_82: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_83: skip:.):
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_83:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_82:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_84: skip:.):
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_84:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_81:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_85: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_86: skip:.):
                      ; r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_86:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_85:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_87: skip:.):
                      ; r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_87:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_80:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_88: skip:.):
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_89: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_90: skip:.):
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_90:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_89:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_91: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_91:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_88:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_92: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_93: skip:.):
                      ; r4 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_93:
                    ; else:
                      ; r3 = 1, r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_2+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_92:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_96: skip:.):
                      ; r3 = 1, r1 = 1
                      lda tmp7: ora #BIT_3+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_96:
                    ; else:
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_79:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_97: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_98: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_99: skip:.):
                    ; r6 = 1
                    lda tmp7: ora #BIT_6: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_100: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_100:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_99:
                  ; else:
                    ; r5 = 1, r4 = 1, r3 = 1
                    lda tmp7: ora #BIT_5+BIT_4+BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_102: skip:.):
                      ; r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_102:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
                jmp _unefonctionDone
lbl_98:
                ; else:
                  ; r5 = 1, r4 = 1
                  lda tmp7: ora #BIT_5+BIT_4: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_104: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_105: skip:.):
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_105:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_104:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_107: skip:.):
                      ; r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_107:
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_97:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_109: skip:.):
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_110: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_111: skip:.):
                      ; r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_111:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_110:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_112: skip:.):
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_112:
                    ; else:
                      ; r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_109:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_114: skip:.):
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_115: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_115:
                  jmp _unefonctionDone
lbl_114:
                  ; else:
                    ; r4 = 1, r3 = 1, r2 = 1
                    lda tmp7: ora #BIT_4+BIT_3+BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_117: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_117:
                jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_78:
          ; else:
            ; r6 = 1, r4 = 1
            lda tmp7: ora #BIT_6+BIT_4: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_118: skip:.):
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_119: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_120: skip:.):
                  ; r2 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_120:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_122: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_122:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_124: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_124:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_119:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_126: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_127: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_127:
                jmp _unefonctionDone
lbl_126:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_128: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_129: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_129:
                  jmp _unefonctionDone
lbl_128:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_131: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_131:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_118:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_133: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_134: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_135: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_135:
                jmp _unefonctionDone
lbl_134:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_137: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_138: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_138:
                  jmp _unefonctionDone
lbl_137:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_140: skip:.):
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_140:
                    ; else:
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_133:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_143: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_144: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_144:
                jmp _unefonctionDone
lbl_143:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_145: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_145:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; if (a9 == 0):
        lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_148: skip:.):
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_149: skip:.):
            ; r8 = 1
            lda tmp7+1: ora #BIT_8: sta tmp7+1
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_150: skip:.):
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_151: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_152: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_153: skip:.):
                    ; r4 = 1, r1 = 1
                    lda tmp7: ora #BIT_4+BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_154: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_154:
                  jmp _unefonctionDone
lbl_153:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_156: skip:.):
                      ; r4 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_156:
                    ; else:
                      ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_152:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_159: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_160: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_160:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_159:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_161: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_161:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_151:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_163: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_164: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_165: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_165:
                  jmp _unefonctionDone
lbl_164:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_167: skip:.):
                      ; r3 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_167:
                    ; else:
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_163:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_169: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_170: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_170:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_169:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_171: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_171:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_150:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_173: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_174: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_175: skip:.):
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_176: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_176:
                  jmp _unefonctionDone
lbl_175:
                  ; else:
                    ; r4 = 1, r3 = 1, r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_178: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_178:
                jmp _unefonctionDone
lbl_174:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_180: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_181: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_181:
                  jmp _unefonctionDone
lbl_180:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_182: skip:.):
                      ; r3 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_182:
                    ; else:
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_173:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_185: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_186: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_187: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_187:
                  jmp _unefonctionDone
lbl_186:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_185:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_188: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_189: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_189:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_188:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_190: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_190:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_149:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_193: skip:.):
              ; r8 = 1
              lda tmp7+1: ora #BIT_8: sta tmp7+1
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_194: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_195: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_196: skip:.):
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_197: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_197:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_196:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_199: skip:.):
                      ; r4 = 1
                      lda tmp7: ora #BIT_4: sta tmp7
                    jmp _unefonctionDone
lbl_199:
                    ; else:
                      ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_195:
                ; else:
                  ; r3 = 1, r2 = 1
                  lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_202: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_203: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_203:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_202:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_205: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_205:
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_194:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_206: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_207: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_208: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_208:
                  jmp _unefonctionDone
lbl_207:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_209: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_209:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_206:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_210: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_211: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_211:
                  jmp _unefonctionDone
lbl_210:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_212: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_212:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_193:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_215: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_216: skip:.):
                  ; r8 = 1
                  lda tmp7+1: ora #BIT_8: sta tmp7+1
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_217: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_218: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_218:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_217:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_220: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_220:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_216:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_222: skip:.):
                    ; r8 = 1
                    lda tmp7+1: ora #BIT_8: sta tmp7+1
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_223: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_223:
                  jmp _unefonctionDone
lbl_222:
                  ; else:
                    ; r7 = 1, r6 = 1, r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_7+BIT_6+BIT_5+BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_225: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_225:
              jmp _unefonctionDone
lbl_215:
              ; else:
                ; r7 = 1, r6 = 1, r5 = 1, r4 = 1, r3 = 1
                lda tmp7: ora #BIT_7+BIT_6+BIT_5+BIT_4+BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_227: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_228: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_229: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_229:
                  jmp _unefonctionDone
lbl_228:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_231: skip:.):
                      ; r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_231:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_227:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_233: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_234: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_234:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_233:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_236: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_236:
                  jmp _unefonctionDone
                jmp _unefonctionDone
        jmp _unefonctionDone
lbl_148:
        ; else:
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_237: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_238: skip:.):
              ; r6 = 1
              lda tmp7: ora #BIT_6: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_239: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_240: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_240:
              jmp _unefonctionDone
lbl_239:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_241: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_242: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_243: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_243:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_242:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_246: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_246:
                jmp _unefonctionDone
lbl_241:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_248: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_248:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_238:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_250: skip:.):
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_251: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_252: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_253: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_253:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_252:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_251:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_256: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_256:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_250:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_258: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_259: skip:.):
                    ; r6 = 1
                    lda tmp7: ora #BIT_6: sta tmp7
                  jmp _unefonctionDone
lbl_259:
                  ; else:
                    ; r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_258:
                ; else:
                  ; r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_262: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_262:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_263: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_263:
                  jmp _unefonctionDone
          jmp _unefonctionDone
lbl_237:
          ; else:
            ; r5 = 1, r4 = 1, r3 = 1
            lda tmp7: ora #BIT_5+BIT_4+BIT_3: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_264: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_265: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_266: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_266:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_265:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_268: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_268:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_270: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_271: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_271:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_270:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_264:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_274: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_275: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 == 0) and (a2 == 0):
                  lda tmp0: and #BIT_0+BIT_2: .(:beq skip: jmp lbl_276: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_276:
                jmp _unefonctionDone
lbl_275:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_279: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_279:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_274:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_281: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_282: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_282:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_284: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_284:
                jmp _unefonctionDone
lbl_281:
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; if (a9 == 0):
      lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_286: skip:.):
        ; if (a7 == 0):
        lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_287: skip:.):
          ; r8 = 1
          lda tmp7+1: ora #BIT_8: sta tmp7+1
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_288: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_289: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_290: skip:.):
                ; r7 = 1
                lda tmp7: ora #BIT_7: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_291: skip:.):
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_292: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_293: skip:.):
                      ; r3 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_293:
                    ; else:
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_292:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_295: skip:.):
                      ; r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_295:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_291:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_296: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_297: skip:.):
                      ; r4 = 1
                      lda tmp7: ora #BIT_4: sta tmp7
                    jmp _unefonctionDone
lbl_297:
                    ; else:
                      ; r3 = 1, r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_296:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_300: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_300:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_290:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_302: skip:.):
                  ; r7 = 1
                  lda tmp7: ora #BIT_7: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_303: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_304: skip:.):
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_304:
                    ; else:
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_303:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_306: skip:.):
                      ; r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_306:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_302:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_308: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_309: skip:.):
                      ; r7 = 1
                      lda tmp7: ora #BIT_7: sta tmp7
                    jmp _unefonctionDone
lbl_309:
                    ; else:
                      ; r6 = 1, r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_6+BIT_5+BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_308:
                  ; else:
                    ; r6 = 1, r5 = 1, r4 = 1, r3 = 1
                    lda tmp7: ora #BIT_6+BIT_5+BIT_4+BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_312: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_312:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
            jmp _unefonctionDone
lbl_289:
            ; else:
              ; r6 = 1
              lda tmp7: ora #BIT_6: sta tmp7
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_314: skip:.):
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_315: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_316: skip:.):
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_317: skip:.):
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_317:
                    ; else:
                      ; r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_316:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_319: skip:.):
                      ; r4 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_319:
                    ; else:
                      ; r3 = 1, r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_315:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_321: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_322: skip:.):
                      ; r3 = 1, r1 = 1
                      lda tmp7: ora #BIT_3+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_322:
                    ; else:
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_321:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_324: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_324:
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_314:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_325: skip:.):
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_326: skip:.):
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_327: skip:.):
                      ; r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_327:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_326:
                  ; else:
                    ; r3 = 1, r2 = 1
                    lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_328: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_328:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_325:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_330: skip:.):
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_331: skip:.):
                      ; r3 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_331:
                    ; else:
                      ; r2 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_330:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_333: skip:.):
                      ; r5 = 1, r1 = 1
                      lda tmp7: ora #BIT_5+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_333:
                    ; else:
                      ; r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_288:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_335: skip:.):
              ; r6 = 1
              lda tmp7: ora #BIT_6: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_336: skip:.):
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_337: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_338: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_339: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_339:
                  jmp _unefonctionDone
lbl_338:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_340: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_340:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_337:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_341: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_342: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_342:
                  jmp _unefonctionDone
lbl_341:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_343: skip:.):
                      ; r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_343:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_336:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_345: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_346: skip:.):
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_347: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_347:
                  jmp _unefonctionDone
lbl_346:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_349: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_349:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
                jmp _unefonctionDone
lbl_345:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_351: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_352: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_352:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_351:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_353: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_353:
                  jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_335:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_354: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_355: skip:.):
                  ; r6 = 1
                  lda tmp7: ora #BIT_6: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_356: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_357: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_357:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_356:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_358: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_358:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_355:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_361: skip:.):
                    ; r6 = 1
                    lda tmp7: ora #BIT_6: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_362: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_362:
                  jmp _unefonctionDone
lbl_361:
                  ; else:
                    ; r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_364: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_364:
              jmp _unefonctionDone
lbl_354:
              ; else:
                ; r5 = 1, r4 = 1
                lda tmp7: ora #BIT_5+BIT_4: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_366: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_367: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_368: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_368:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_367:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_370: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_370:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_366:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_371: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_372: skip:.):
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_372:
                    ; else:
                      ; r2 = 1, r1 = 1
                      lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_371:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_375: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_375:
                jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_287:
        ; else:
          ; r7 = 1, r6 = 1
          lda tmp7: ora #BIT_7+BIT_6: sta tmp7
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_377: skip:.):
            ; r5 = 1
            lda tmp7: ora #BIT_5: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_378: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_379: skip:.):
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_380: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_381: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_382: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_382:
                  jmp _unefonctionDone
lbl_381:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_383: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_383:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_380:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_385: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_386: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_386:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_385:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_389: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_389:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_379:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_391: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_392: skip:.):
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_393: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_393:
                  jmp _unefonctionDone
lbl_392:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_395: skip:.):
                      ; r4 = 1
                      lda tmp7: ora #BIT_4: sta tmp7
                    jmp _unefonctionDone
lbl_395:
                    ; else:
                      ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_391:
                ; else:
                  ; r3 = 1, r2 = 1
                  lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_398: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_399: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_399:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_398:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_401: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_401:
                  jmp _unefonctionDone
            jmp _unefonctionDone
lbl_378:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_402: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_403: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_404: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_404:
                jmp _unefonctionDone
lbl_403:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_406: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_407: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_407:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_406:
                  ; else:
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_409: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_409:
              jmp _unefonctionDone
lbl_402:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_410: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_411: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_412: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_412:
                  jmp _unefonctionDone
lbl_411:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_413: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_413:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_410:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_414: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_415: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_415:
                  jmp _unefonctionDone
lbl_414:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_416: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_416:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_377:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_418: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_419: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_420: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_421: skip:.):
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                  jmp _unefonctionDone
lbl_421:
                  ; else:
                    ; r4 = 1, r3 = 1, r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_423: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_423:
                jmp _unefonctionDone
lbl_420:
                ; else:
                  ; r4 = 1, r3 = 1, r2 = 1
                  lda tmp7: ora #BIT_4+BIT_3+BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_425: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_426: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_426:
                  jmp _unefonctionDone
lbl_425:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_427: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_427:
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_419:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_429: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_430: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_431: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_431:
                  jmp _unefonctionDone
lbl_430:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_432: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_432:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_429:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_433: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_434: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_434:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_433:
                  ; else:
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_418:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_437: skip:.):
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_438: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_439: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_439:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_440: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_440:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_438:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_441: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_442: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_442:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_441:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_437:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_445: skip:.):
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_446: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_446:
                jmp _unefonctionDone
lbl_445:
                ; else:
                  ; r3 = 1, r2 = 1
                  lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_448: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_449: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_449:
                  jmp _unefonctionDone
lbl_448:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_450: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_450:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_286:
      ; else:
        ; if (a7 == 0):
        lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_452: skip:.):
          ; r6 = 1
          lda tmp7: ora #BIT_6: sta tmp7
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_453: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_454: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_455: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_456: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_457: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_457:
                jmp _unefonctionDone
lbl_456:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_459: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_459:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_455:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_461: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_462: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_462:
                jmp _unefonctionDone
lbl_461:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_463: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_463:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_454:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_466: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_467: skip:.):
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_468: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_468:
                jmp _unefonctionDone
lbl_467:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_470: skip:.):
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                  jmp _unefonctionDone
lbl_470:
                  ; else:
                    ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_466:
              ; else:
                ; r3 = 1, r2 = 1
                lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_473: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_474: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_474:
                jmp _unefonctionDone
lbl_473:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_475: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_475:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
          jmp _unefonctionDone
lbl_453:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_477: skip:.):
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_478: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_479: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_480: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_480:
                jmp _unefonctionDone
lbl_479:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_482: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_482:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_478:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_484: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_485: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_485:
                jmp _unefonctionDone
lbl_484:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_486: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_487: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_487:
                  jmp _unefonctionDone
lbl_486:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_489: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_489:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_477:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_491: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_492: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_493: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_493:
                jmp _unefonctionDone
lbl_492:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_495: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_496: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_496:
                  jmp _unefonctionDone
lbl_495:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_498: skip:.):
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_498:
                    ; else:
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_491:
              ; else:
                ; r2 = 1, r1 = 1
                lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_501: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_501:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_452:
        ; else:
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_502: skip:.):
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_503: skip:.):
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_504: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_505: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_505:
              jmp _unefonctionDone
lbl_504:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_506: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_507: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_508: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_508:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_507:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_506:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_512: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_512:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_503:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_513: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_514: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_515: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_515:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_517: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_517:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_514:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_513:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_521: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_521:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_522: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_523: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_523:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_522:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_502:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_526: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_527: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_528: skip:.):
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_529: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_529:
                jmp _unefonctionDone
lbl_528:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_531: skip:.):
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                  jmp _unefonctionDone
lbl_531:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_533: skip:.):
                      ; r4 = 1
                      lda tmp7: ora #BIT_4: sta tmp7
                    jmp _unefonctionDone
lbl_533:
                    ; else:
                      ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_527:
              ; else:
                ; r3 = 1, r2 = 1, r1 = 1
                lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_536: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_536:
            jmp _unefonctionDone
lbl_526:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_538: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_539: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_540: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_541: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_541:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_540:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_539:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_544: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_544:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_538:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_545: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_546: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_546:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_548: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_548:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_545:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; if (a9 == 0):
    lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_552: skip:.):
      ; if (a7 == 0):
      lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_553: skip:.):
        ; r7 = 1
        lda tmp7: ora #BIT_7: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_554: skip:.):
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_555: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_556: skip:.):
              ; r6 = 1
              lda tmp7: ora #BIT_6: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_557: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_558: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_559: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_560: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_560:
                  jmp _unefonctionDone
lbl_559:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_558:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_562: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_562:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_557:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_563: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_564: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_565: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_565:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_564:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_568: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_568:
                jmp _unefonctionDone
lbl_563:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_569: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_569:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_556:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_571: skip:.):
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_572: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_573: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                  jmp _unefonctionDone
lbl_573:
                  ; else:
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_575: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_575:
                jmp _unefonctionDone
lbl_572:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_576: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_577: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_577:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_576:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_579: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_579:
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_571:
              ; else:
                ; r5 = 1, r4 = 1, r3 = 1, r2 = 1
                lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_581: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_582: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_582:
                jmp _unefonctionDone
lbl_581:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_583: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_583:
                jmp _unefonctionDone
          jmp _unefonctionDone
lbl_555:
          ; else:
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_585: skip:.):
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_586: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_587: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_588: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_589: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_589:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_588:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_591: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_591:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_587:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_593: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                  jmp _unefonctionDone
lbl_593:
                  ; else:
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_586:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_595: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_596: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_596:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_598: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_598:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_595:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_600: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_600:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_585:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_601: skip:.):
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_602: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_603: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_604: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_604:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_603:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_606: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_606:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_602:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_607: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_607:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_601:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_609: skip:.):
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_610: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_611: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_611:
                  jmp _unefonctionDone
lbl_610:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_612: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_612:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_609:
                ; else:
                  ; r4 = 1, r3 = 1, r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_615: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_615:
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_554:
        ; else:
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_616: skip:.):
            ; r5 = 1
            lda tmp7: ora #BIT_5: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_617: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_618: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_619: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_620: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_620:
                jmp _unefonctionDone
lbl_619:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_621: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_621:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_618:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_622: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_623: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_623:
                jmp _unefonctionDone
lbl_622:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_624: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_624:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_617:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_625: skip:.):
                ; r4 = 1, r2 = 1
                lda tmp7: ora #BIT_4+BIT_2: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_626: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_627: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_627:
                jmp _unefonctionDone
lbl_626:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_628: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_628:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_625:
              ; else:
                ; r3 = 1, r2 = 1
                lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_630: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_631: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_631:
                jmp _unefonctionDone
lbl_630:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_632: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_633: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_633:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_632:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_636: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_636:
                jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_616:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_637: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_638: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_639: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_640: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_641: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_641:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_640:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_643: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_643:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_639:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_645: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_646: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_646:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_645:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_648: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_648:
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_638:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_650: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_651: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_652: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_652:
                  jmp _unefonctionDone
lbl_651:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_653: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_653:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_650:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_655: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_656: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_656:
                  jmp _unefonctionDone
lbl_655:
                  ; else:
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_658: skip:.):
                      ; r3 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_3+BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_658:
                    ; else:
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_637:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_660: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_661: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_662: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_662:
                jmp _unefonctionDone
lbl_661:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_663: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_663:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_664: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_664:
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_660:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_665: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_666: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_667: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_667:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_666:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_665:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_671: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_671:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_672: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_672:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_553:
      ; else:
        ; if (a6 == 0):
        lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_675: skip:.):
          ; if (a4 == 0):
          lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_676: skip:.):
            ; r7 = 1
            lda tmp7: ora #BIT_7: sta tmp7
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_677: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_678: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_679: skip:.):
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
                  ; if (a0 == 0) and (a1 == 0):
                  lda tmp0: and #BIT_0+BIT_1: .(:beq skip: jmp lbl_680: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_680:
                jmp _unefonctionDone
lbl_679:
                ; else:
                  ; r3 = 1, r2 = 1
                  lda tmp7: ora #BIT_3+BIT_2: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_683: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_684: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_684:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_683:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_678:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_687: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_688: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_688:
                jmp _unefonctionDone
lbl_687:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_689: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_689:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_677:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_690: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_691: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_692: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_692:
                jmp _unefonctionDone
lbl_691:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_693: skip:.):
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_693:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_690:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_695: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_696: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_697: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_697:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_696:
                  ; else:
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_700: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_700:
                jmp _unefonctionDone
lbl_695:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_701: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_702: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_702:
                  jmp _unefonctionDone
lbl_701:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_676:
          ; else:
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_704: skip:.):
              ; r7 = 1
              lda tmp7: ora #BIT_7: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_705: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_706: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0) and (a0 == 0):
                  lda tmp0: and #BIT_1+BIT_0: .(:beq skip: jmp lbl_707: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_707:
                jmp _unefonctionDone
lbl_706:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_709: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_709:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_710: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_710:
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_705:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_711: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_712: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_713: skip:.):
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_713:
                    ; else:
                      ; r2 = 1, r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_712:
                  ; else:
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_711:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_717: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_718: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_718:
                  jmp _unefonctionDone
lbl_717:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_719: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_719:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_704:
            ; else:
              ; r6 = 1, r5 = 1, r4 = 1, r3 = 1
              lda tmp7: ora #BIT_6+BIT_5+BIT_4+BIT_3: sta tmp7
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_722: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_723: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_724: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_724:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_725: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_725:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_723:
                ; else:
                  ; if (a0 == 0) and (a1 == 0):
                  lda tmp0: and #BIT_0+BIT_1: .(:beq skip: jmp lbl_726: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_726:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_722:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_728: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_729: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_729:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_728:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_731: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_731:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_732: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_732:
                  jmp _unefonctionDone
              jmp _unefonctionDone
        jmp _unefonctionDone
lbl_675:
        ; else:
          ; r6 = 1, r5 = 1
          lda tmp7: ora #BIT_6+BIT_5: sta tmp7
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_734: skip:.):
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_735: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_736: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_737: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_738: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_738:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_737:
                ; else:
                  ; if (a0 == 0) and (a1 == 0):
                  lda tmp0: and #BIT_0+BIT_1: .(:beq skip: jmp lbl_740: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_740:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_736:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_743: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_744: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_744:
                jmp _unefonctionDone
lbl_743:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_745: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_746: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_746:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_745:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_735:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_749: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_750: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_751: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_751:
                jmp _unefonctionDone
lbl_750:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_752: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_753: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_753:
                  jmp _unefonctionDone
lbl_752:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_749:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_755: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_756: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_756:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_758: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_758:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_755:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_760: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_760:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_734:
          ; else:
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_761: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_762: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_763: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_764: skip:.):
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                  jmp _unefonctionDone
lbl_764:
                  ; else:
                    ; r3 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_763:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_767: skip:.):
                    ; r2 = 1, r1 = 1
                    lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_768: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_768:
                  jmp _unefonctionDone
lbl_767:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_762:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_770: skip:.):
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_771: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_771:
                jmp _unefonctionDone
lbl_770:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_772: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_772:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
            jmp _unefonctionDone
lbl_761:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_774: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_775: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_776: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_776:
                jmp _unefonctionDone
lbl_775:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_777: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_778: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_778:
                  jmp _unefonctionDone
lbl_777:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_780: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_780:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_774:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_782: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a1 == 0) and (a0 == 0):
                  lda tmp0: and #BIT_1+BIT_0: .(:beq skip: jmp lbl_783: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_783:
                jmp _unefonctionDone
lbl_782:
                ; else:
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
    jmp _unefonctionDone
lbl_552:
    ; else:
      ; if (a7 == 0):
      lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_786: skip:.):
        ; if (a6 == 0):
        lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_787: skip:.):
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_788: skip:.):
            ; r5 = 1
            lda tmp7: ora #BIT_5: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_789: skip:.):
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_790: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_791: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_791:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_793: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_793:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_790:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_795: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_796: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_796:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_798: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_798:
                jmp _unefonctionDone
lbl_795:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_789:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_799: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_800: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_800:
                ; else:
                  ; if (a1 == 0) and (a0 == 0):
                  lda tmp0: and #BIT_1+BIT_0: .(:beq skip: jmp lbl_801: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_801:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_799:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_803: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_804: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_804:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_806: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_806:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_803:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_788:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_810: skip:.):
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_811: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_812: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_812:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_814: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_814:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_811:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_816: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_817: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_817:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_819: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_819:
                jmp _unefonctionDone
lbl_816:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_810:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_821: skip:.):
                ; r5 = 1
                lda tmp7: ora #BIT_5: sta tmp7
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_822: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_823: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_824: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_824:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_823:
                jmp _unefonctionDone
lbl_822:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_826: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_826:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_821:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_828: skip:.):
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_829: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_829:
                jmp _unefonctionDone
lbl_828:
                ; else:
                  ; r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
        jmp _unefonctionDone
lbl_787:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_832: skip:.):
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_833: skip:.):
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_834: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_835: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0) and (a0 == 0):
                  lda tmp0: and #BIT_1+BIT_0: .(:beq skip: jmp lbl_836: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_836:
                jmp _unefonctionDone
lbl_835:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_839: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_839:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_841: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_841:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_834:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_843: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_843:
                ; else:
                  ; if (a0 == 0) and (a1 == 0):
                  lda tmp0: and #BIT_0+BIT_1: .(:beq skip: jmp lbl_844: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_844:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_833:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_846: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_847: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_848: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_848:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_847:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_851: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_851:
              jmp _unefonctionDone
lbl_846:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_853: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_854: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_854:
                jmp _unefonctionDone
lbl_853:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_855: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_855:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_832:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_857: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_858: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_859: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_859:
              jmp _unefonctionDone
lbl_858:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_861: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_862: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                  jmp _unefonctionDone
lbl_862:
                  ; else:
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_861:
                ; else:
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_857:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_866: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_867: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_867:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_869: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_869:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_866:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_871: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_871:
              jmp _unefonctionDone
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_786:
      ; else:
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_872: skip:.):
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_873: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_874: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_875: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_876: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_877: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_877:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_876:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_875:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_880: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_880:
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_874:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_882: skip:.):
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_883: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_883:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_884: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_884:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_882:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_887: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_888: skip:.):
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                  jmp _unefonctionDone
lbl_888:
                  ; else:
                    ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_887:
                ; else:
                  ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_873:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_892: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_893: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_894: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_895: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_896: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_896:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_895:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_894:
              jmp _unefonctionDone
lbl_893:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_900: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_901: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_901:
                jmp _unefonctionDone
lbl_900:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_903: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_904: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_904:
                  jmp _unefonctionDone
lbl_903:
                  ; else:
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_892:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_906: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_907: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_907:
              jmp _unefonctionDone
lbl_906:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_908: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_909: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_909:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_911: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_911:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_908:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_872:
        ; else:
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_914: skip:.):
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_915: skip:.):
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_916: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_917: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0) and (a0 == 0):
                  lda tmp0: and #BIT_1+BIT_0: .(:beq skip: jmp lbl_918: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_918:
                jmp _unefonctionDone
lbl_917:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_921: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_921:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_923: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_923:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_916:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_925: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_925:
                ; else:
                  ; if (a0 == 0) and (a1 == 0):
                  lda tmp0: and #BIT_0+BIT_1: .(:beq skip: jmp lbl_926: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_926:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_915:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_928: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_929: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_929:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_928:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a2 == 0) and (a1 == 0):
                lda tmp0: and #BIT_2+BIT_1: .(:beq skip: jmp lbl_932: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_932:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_914:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_934: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_935: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a1 == 0) and (a2 == 0):
                lda tmp0: and #BIT_1+BIT_2: .(:beq skip: jmp lbl_936: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_936:
              jmp _unefonctionDone
lbl_935:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_939: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_940: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_941: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_941:
                    ; else:
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_940:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_939:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_945: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_945:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_946: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_946:
                  jmp _unefonctionDone
            jmp _unefonctionDone
lbl_934:
            ; else:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_947: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_948: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_948:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_950: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_950:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_947:
              ; else:
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_952: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_952:
                ; else:
                  ; if (a0 == 0) and (a1 == 0):
                  lda tmp0: and #BIT_0+BIT_1: .(:beq skip: jmp lbl_953: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_953:
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone