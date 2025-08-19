  ; if (a4 == 0):
  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a7 == 0):
    lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a6 == 0):
      lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_4: skip:.):
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_5: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_6: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_7: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_8: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_8:
              jmp _unefonctionDone
lbl_7:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_10: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_10:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_6:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a0 != 0) and (a1 != 0):
              lda tmp0: and #BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_12: skip:.)
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_12:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_5:
          ; else:
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_15: skip:.):
              ; r1 = 1, r0 = 1
              lda tmp7: ora #BIT_1+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_15:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_17: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_18: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_18:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_17:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
        jmp _unefonctionDone
lbl_4:
        ; else:
          ; r2 = 1, r1 = 1
          lda tmp7: ora #BIT_2+BIT_1: sta tmp7
          ; if (a3 != 0):
          lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_21: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_22: skip:.):
              ; if (a1 != 0) and (a0 != 0):
              lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_23: skip:.)
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_23:
            jmp _unefonctionDone
lbl_22:
            ; else:
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_21:
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; r3 = 1
        lda tmp7: ora #BIT_3: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_27: skip:.):
          ; if (a3 != 0):
          lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_28: skip:.):
            ; if (a0 == 0):
            lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_29: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_30: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_31: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_31:
              jmp _unefonctionDone
lbl_30:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_29:
            ; else:
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_28:
        jmp _unefonctionDone
lbl_27:
        ; else:
          ; r1 = 1
          lda tmp7: ora #BIT_1: sta tmp7
          ; if (a3 != 0) and (a2 != 0) and (a0 != 0) and (a1 != 0):
          lda tmp0: and #BIT_3+BIT_2+BIT_0+BIT_1: cmp #BIT_3+BIT_2+BIT_0+BIT_1: .(:beq skip: jmp lbl_34: skip:.)
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_36:
            jmp _unefonctionDone
lbl_35:
          jmp _unefonctionDone
lbl_34:
        jmp _unefonctionDone
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; r3 = 1
      lda tmp7: ora #BIT_3: sta tmp7
      ; if (a5 == 0):
      lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_38: skip:.):
        ; if (a6 == 0):
        lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_39: skip:.):
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_40: skip:.):
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_41: skip:.):
              ; r1 = 1, r0 = 1
              lda tmp7: ora #BIT_1+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_41:
            ; else:
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_43: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_44: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_44:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_43:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_40:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
        jmp _unefonctionDone
lbl_39:
        ; else:
          ; r2 = 1, r1 = 1
          lda tmp7: ora #BIT_2+BIT_1: sta tmp7
      jmp _unefonctionDone
lbl_38:
      ; else:
        ; r2 = 1
        lda tmp7: ora #BIT_2: sta tmp7
        ; if (a6 == 0):
        lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_49: skip:.):
          ; r0 = 1
          lda tmp7: ora #BIT_0: sta tmp7
        jmp _unefonctionDone
lbl_49:
        ; else:
          ; r1 = 1, r0 = 1
          lda tmp7: ora #BIT_1+BIT_0: sta tmp7
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; if (a6 == 0):
    lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_50: skip:.):
      ; if (a7 == 0):
      lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_51: skip:.):
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_52: skip:.):
          ; r2 = 1
          lda tmp7: ora #BIT_2: sta tmp7
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_53: skip:.):
            ; if (a2 != 0):
            lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_54: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_55: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_56: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_56:
              jmp _unefonctionDone
lbl_55:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_54:
          jmp _unefonctionDone
lbl_53:
          ; else:
            ; if (a1 == 0):
            lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_58: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_58:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_60: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_60:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_62: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_62:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_52:
        ; else:
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_65: skip:.):
            ; r2 = 1, r1 = 1, r0 = 1
            lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_65:
          ; else:
            ; if (a0 == 0):
            lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_67: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_68: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_69: skip:.):
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_69:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_68:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_67:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
      jmp _unefonctionDone
lbl_51:
      ; else:
        ; r3 = 1, r2 = 1
        lda tmp7: ora #BIT_3+BIT_2: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_73: skip:.):
          ; if (a3 != 0):
          lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_74: skip:.):
            ; if (a2 != 0):
            lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_75: skip:.):
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_76: skip:.):
                ; if (a0 != 0):
                lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_77: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_77:
              jmp _unefonctionDone
lbl_76:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_75:
          jmp _unefonctionDone
lbl_74:
        jmp _unefonctionDone
lbl_73:
        ; else:
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_79: skip:.):
            ; if (a0 == 0):
            lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_80: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_80:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_82: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_82:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_84: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_84:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
          jmp _unefonctionDone
lbl_79:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone
lbl_50:
    ; else:
      ; if (a7 == 0):
      lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_88: skip:.):
        ; r3 = 1
        lda tmp7: ora #BIT_3: sta tmp7
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_89: skip:.):
          ; if (a3 == 0):
          lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_90: skip:.):
            ; r0 = 1
            lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_90:
          ; else:
            ; if (a2 == 0):
            lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_92: skip:.):
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_93: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_93:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_95: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_95:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_92:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
        jmp _unefonctionDone
lbl_89:
        ; else:
          ; r1 = 1, r0 = 1
          lda tmp7: ora #BIT_1+BIT_0: sta tmp7
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_88:
      ; else:
        ; if (a5 == 0):
        lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_99: skip:.):
          ; r3 = 1, r2 = 1, r1 = 1
          lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_100: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_101: skip:.):
              ; if (a1 != 0) and (a0 != 0):
              lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_102: skip:.)
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_102:
            jmp _unefonctionDone
lbl_101:
            ; else:
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_100:
          ; else:
            ; r0 = 1
            lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_99:
        ; else:
          ; if (a1 == 0):
          lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_106: skip:.):
            ; if (a3 == 0):
            lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_107: skip:.):
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_108: skip:.):
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_109: skip:.):
                  ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_109:
                ; else:
                  ; r4 = 1
                  lda tmp7: ora #BIT_4: sta tmp7
              jmp _unefonctionDone
lbl_108:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
            jmp _unefonctionDone
lbl_107:
            ; else:
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
          jmp _unefonctionDone
lbl_106:
          ; else:
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
  jmp _unefonctionDone