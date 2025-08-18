  ; if (a10 == 0):
  lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a11 == 0):
    lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a9 == 0):
      lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a8 == 0):
        lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_4: skip:.):
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_5: skip:.):
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_6: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_7: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_8: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_9: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_10: skip:.):
                      ; if (a1 == 0) and (a0 != 0):
                      lda tmp0: and #BIT_1+BIT_0: cmp #BIT_0: .(:beq skip: jmp lbl_11: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_11:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_14: skip:.):
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
                      ; if (a1 != 0) and (a0 != 0):
                      lda tmp0: and #BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_16: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_16:
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_9:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_19: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_19:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_21: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_22: skip:.):
                          ; r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_22:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_21:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_8:
                ; else:
                  ; r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_2+BIT_1: sta tmp7
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_25: skip:.):
                    ; if (a2 == 0) and (a1 != 0) and (a0 != 0):
                    lda tmp0: and #BIT_2+BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_26: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_26:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_25:
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_7:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_31: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_32: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_33: skip:.):
                      ; if (a0 == 0) and (a1 != 0):
                      lda tmp0: and #BIT_0+BIT_1: cmp #BIT_1: .(:beq skip: jmp lbl_34: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_34:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_33:
                  jmp _unefonctionDone
lbl_32:
                  ; else:
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_31:
                ; else:
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_38: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_39: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_39:
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_40: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_40:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_42: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_42:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_38:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_45: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_46: skip:.):
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_47: skip:.):
                          ; r2 = 1, r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_47:
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
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
lbl_6:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_51: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_52: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_53: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_54: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_54:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_56: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_57: skip:.):
                          ; r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_57:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_56:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_53:
                  ; else:
                    ; r2 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_52:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; if (a5 != 0):
                  lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_62: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_62:
              jmp _unefonctionDone
lbl_51:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_63: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_64: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_65: skip:.):
                      ; if (a0 == 0) and (a1 != 0):
                      lda tmp0: and #BIT_0+BIT_1: cmp #BIT_1: .(:beq skip: jmp lbl_66: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_66:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_65:
                  jmp _unefonctionDone
lbl_64:
                jmp _unefonctionDone
lbl_63:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_69: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_70: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_70:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_72: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_72:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_74: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_74:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_69:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_5:
          ; else:
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_78: skip:.):
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_79: skip:.):
                ; if (a3 == 0) and (a4 != 0):
                lda tmp0: and #BIT_3+BIT_4: cmp #BIT_4: .(:beq skip: jmp lbl_80: skip:.)
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_80:
                ; else:
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_83: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_84: skip:.):
                      ; if (a0 == 0) and (a1 != 0):
                      lda tmp0: and #BIT_0+BIT_1: cmp #BIT_1: .(:beq skip: jmp lbl_85: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_85:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_84:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_83:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_89: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_90: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_90:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_92: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_92:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_89:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_79:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a4 == 0) and (a3 != 0) and (a2 != 0) and (a0 != 0) and (a1 != 0):
                lda tmp0: and #BIT_4+BIT_3+BIT_2+BIT_0+BIT_1: cmp #BIT_3+BIT_2+BIT_0+BIT_1: .(:beq skip: jmp lbl_95: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_95:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_78:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_101: skip:.):
                ; r3 = 1, r2 = 1, r1 = 1
                lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
                ; if (a5 != 0):
                lda tmp0: and #BIT_5: cmp #BIT_5: .(:beq skip: jmp lbl_102: skip:.)
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_102:
              ; else:
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_104: skip:.):
                  ; r3 = 1, r2 = 1, r1 = 1
                  lda tmp7: ora #BIT_3+BIT_2+BIT_1: sta tmp7
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_105: skip:.):
                    ; if (a2 == 0) and (a0 != 0) and (a1 != 0):
                    lda tmp0: and #BIT_2+BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_106: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_106:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_105:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_104:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_111: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_112: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_113: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_114: skip:.):
                          ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_114:
                        ; else:
                          ; r4 = 1
                          lda tmp7: ora #BIT_4: sta tmp7
                      jmp _unefonctionDone
lbl_113:
                      ; else:
                        ; r4 = 1
                        lda tmp7: ora #BIT_4: sta tmp7
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
lbl_4:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_119: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_120: skip:.):
              ; if (a4 == 0) and (a5 != 0):
              lda tmp0: and #BIT_4+BIT_5: cmp #BIT_5: .(:beq skip: jmp lbl_121: skip:.)
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_121:
              ; else:
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_123: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_124: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_125: skip:.):
                      ; if (a3 == 0) and (a0 != 0):
                      lda tmp0: and #BIT_3+BIT_0: cmp #BIT_0: .(:beq skip: jmp lbl_126: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_126:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_125:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_124:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_123:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_131: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_132: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_133: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_133:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_135: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_135:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_132:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_131:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_120:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_140: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a5 == 0) and (a3 != 0) and (a4 != 0):
                lda tmp0: and #BIT_5+BIT_3+BIT_4: cmp #BIT_3+BIT_4: .(:beq skip: jmp lbl_141: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_141:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_140:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_145: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a5 == 0) and (a4 != 0) and (a1 != 0) and (a0 != 0):
                  lda tmp0: and #BIT_5+BIT_4+BIT_1+BIT_0: cmp #BIT_4+BIT_1+BIT_0: .(:beq skip: jmp lbl_146: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_146:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_145:
                ; else:
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_151: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a5 != 0):
                    lda tmp0: and #BIT_5: cmp #BIT_5: .(:beq skip: jmp lbl_152: skip:.)
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_152:
                  ; else:
                    ; if (a5 == 0):
                    lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_154: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_154:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_156: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_157: skip:.):
                          ; r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_157:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_156:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_119:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_160: skip:.):
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_161: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_162: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_163: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_164: skip:.):
                      ; if (a0 == 0) and (a1 != 0):
                      lda tmp0: and #BIT_0+BIT_1: cmp #BIT_1: .(:beq skip: jmp lbl_165: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_165:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_164:
                  jmp _unefonctionDone
lbl_163:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_162:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_161:
            jmp _unefonctionDone
lbl_160:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_170: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_171: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_172: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_172:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_174: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_174:
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_176: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_176:
                      ; else:
                        ; if (a3 == 0):
                        lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_178: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_178:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_171:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_170:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a5 != 0):
                lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_182: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_183: skip:.):
                    ; if (a2 == 0) and (a0 != 0) and (a1 != 0):
                    lda tmp0: and #BIT_2+BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_184: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_184:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_183:
                jmp _unefonctionDone
lbl_182:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; if (a8 == 0):
        lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_189: skip:.):
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_190: skip:.):
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_191: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_192: skip:.):
                ; r2 = 1, r1 = 1, r0 = 1
                lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_192:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_194: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_195: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_195:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_197: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_198: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_199: skip:.):
                          ; r2 = 1, r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_199:
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_198:
                      ; else:
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_197:
                    ; else:
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_194:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_191:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_205: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_206: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_207: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_207:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_209: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_210: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_210:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_212: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_212:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_209:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_206:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_205:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a1 != 0) and (a0 != 0) and (a3 != 0) and (a5 != 0) and (a2 != 0):
                lda tmp0: and #BIT_1+BIT_0+BIT_3+BIT_5+BIT_2: cmp #BIT_1+BIT_0+BIT_3+BIT_5+BIT_2: .(:beq skip: jmp lbl_216: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_216:
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_190:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_221: skip:.):
              ; if (a7 == 0):
              lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_222: skip:.):
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_223: skip:.):
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_224: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_225: skip:.):
                      ; if (a1 == 0) and (a2 != 0):
                      lda tmp0: and #BIT_1+BIT_2: cmp #BIT_2: .(:beq skip: jmp lbl_226: skip:.)
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
lbl_223:
              jmp _unefonctionDone
lbl_222:
              ; else:
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_221:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_230: skip:.):
                ; if (a7 == 0):
                lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_231: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_231:
                ; else:
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_230:
              ; else:
                ; if (a7 == 0):
                lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_233: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_233:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_235: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_236: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_236:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_238: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_239: skip:.):
                          ; r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_239:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_238:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_235:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_189:
        ; else:
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_244: skip:.):
            ; r4 = 1, r3 = 1, r2 = 1
            lda tmp7: ora #BIT_4+BIT_3+BIT_2: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_245: skip:.):
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_246: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_247: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_248: skip:.):
                    ; if (a3 != 0):
                    lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_249: skip:.):
                      ; if (a0 == 0) and (a1 != 0):
                      lda tmp0: and #BIT_0+BIT_1: cmp #BIT_1: .(:beq skip: jmp lbl_250: skip:.)
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
lbl_248:
                jmp _unefonctionDone
lbl_247:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_246:
            jmp _unefonctionDone
lbl_245:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_254: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_255: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_256: skip:.):
                    ; if (a3 == 0) and (a1 != 0) and (a0 != 0):
                    lda tmp0: and #BIT_3+BIT_1+BIT_0: cmp #BIT_1+BIT_0: .(:beq skip: jmp lbl_257: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_257:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_256:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_255:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_254:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_244:
          ; else:
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_264: skip:.):
              ; r4 = 1, r3 = 1, r2 = 1
              lda tmp7: ora #BIT_4+BIT_3+BIT_2: sta tmp7
              ; if (a7 == 0):
              lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_265: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_265:
              ; else:
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_264:
            ; else:
              ; if (a7 == 0):
              lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_267: skip:.):
                ; r4 = 1, r3 = 1, r2 = 1
                lda tmp7: ora #BIT_4+BIT_3+BIT_2: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_268: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_269: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_270: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_270:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_272: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_272:
                      ; else:
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_274: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_274:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_269:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_268:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_267:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_278: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_279: skip:.):
                    ; if (a4 == 0):
                    lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_280: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_281: skip:.):
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_282: skip:.):
                          ; r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_282:
                        ; else:
                          ; r5 = 1
                          lda tmp7: ora #BIT_5: sta tmp7
                      jmp _unefonctionDone
lbl_281:
                      ; else:
                        ; r5 = 1
                        lda tmp7: ora #BIT_5: sta tmp7
                    jmp _unefonctionDone
lbl_280:
                    ; else:
                      ; r5 = 1
                      lda tmp7: ora #BIT_5: sta tmp7
                  jmp _unefonctionDone
lbl_279:
                  ; else:
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                jmp _unefonctionDone
lbl_278:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; r5 = 1
      lda tmp7: ora #BIT_5: sta tmp7
      ; if (a8 == 0):
      lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_288: skip:.):
        ; if (a9 == 0):
        lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_289: skip:.):
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_290: skip:.):
            ; r3 = 1, r2 = 1
            lda tmp7: ora #BIT_3+BIT_2: sta tmp7
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_291: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_292: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_293: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_293:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_295: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_296: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_296:
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_298: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_298:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_300: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_300:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_295:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_292:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_291:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_304: skip:.):
                ; if (a6 != 0):
                lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_305: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_306: skip:.):
                    ; if (a3 == 0) and (a0 != 0) and (a1 != 0):
                    lda tmp0: and #BIT_3+BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_307: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_307:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_306:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_305:
              jmp _unefonctionDone
lbl_304:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_290:
          ; else:
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_313: skip:.):
              ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
              lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_313:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_315: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_316: skip:.):
                  ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_316:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_318: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_319: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_320: skip:.):
                        ; if (a3 == 0):
                        lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_321: skip:.):
                          ; r3 = 1, r2 = 1, r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_321:
                        ; else:
                          ; r4 = 1
                          lda tmp7: ora #BIT_4: sta tmp7
                      jmp _unefonctionDone
lbl_320:
                      ; else:
                        ; r4 = 1
                        lda tmp7: ora #BIT_4: sta tmp7
                    jmp _unefonctionDone
lbl_319:
                    ; else:
                      ; r4 = 1
                      lda tmp7: ora #BIT_4: sta tmp7
                  jmp _unefonctionDone
lbl_318:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
              jmp _unefonctionDone
lbl_315:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
        jmp _unefonctionDone
lbl_289:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_328: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_329: skip:.):
              ; r1 = 1, r0 = 1
              lda tmp7: ora #BIT_1+BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_329:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_331: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_332: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_332:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_334: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_334:
                  ; else:
                    ; if (a4 == 0):
                    lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_336: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_336:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_338: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_339: skip:.):
                          ; r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_339:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_338:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_331:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_328:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 != 0):
            lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_343: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_344: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_345: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_346: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_347: skip:.):
                      ; if (a1 == 0) and (a0 != 0):
                      lda tmp0: and #BIT_1+BIT_0: cmp #BIT_0: .(:beq skip: jmp lbl_348: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_348:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_347:
                  jmp _unefonctionDone
lbl_346:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_345:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_344:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_343:
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_288:
      ; else:
        ; r4 = 1
        lda tmp7: ora #BIT_4: sta tmp7
        ; if (a9 == 0):
        lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_354: skip:.):
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_355: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_356: skip:.):
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_357: skip:.):
                ; if (a5 != 0):
                lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_358: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_359: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_360: skip:.):
                      ; if (a0 == 0) and (a3 != 0):
                      lda tmp0: and #BIT_0+BIT_3: cmp #BIT_3: .(:beq skip: jmp lbl_361: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_361:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_360:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_359:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_358:
              jmp _unefonctionDone
lbl_357:
            jmp _unefonctionDone
lbl_356:
            ; else:
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_355:
          ; else:
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_366: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_367: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_368: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_368:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_370: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_371: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_372: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_372:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_374: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_374:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
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
lbl_367:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_366:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a6 != 0):
              lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_380: skip:.):
                ; if (a4 != 0):
                lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_381: skip:.):
                  ; if (a3 == 0) and (a2 != 0) and (a1 != 0) and (a0 != 0):
                  lda tmp0: and #BIT_3+BIT_2+BIT_1+BIT_0: cmp #BIT_2+BIT_1+BIT_0: .(:beq skip: jmp lbl_382: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_382:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_381:
              jmp _unefonctionDone
lbl_380:
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_354:
        ; else:
          ; r2 = 1
          lda tmp7: ora #BIT_2: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_387: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_388: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_389: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_389:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_391: skip:.):
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_392: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_392:
                  ; else:
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_394: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_394:
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_396: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_396:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_398: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_398:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_391:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_388:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
          jmp _unefonctionDone
lbl_387:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_402: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_403: skip:.):
                ; if (a4 != 0):
                lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_404: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_405: skip:.):
                    ; if (a2 == 0) and (a0 != 0) and (a1 != 0):
                    lda tmp0: and #BIT_2+BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_406: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_406:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_405:
                jmp _unefonctionDone
lbl_404:
              jmp _unefonctionDone
lbl_403:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_402:
            ; else:
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; if (a8 == 0):
    lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_411: skip:.):
      ; r5 = 1
      lda tmp7: ora #BIT_5: sta tmp7
      ; if (a11 == 0):
      lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_412: skip:.):
        ; if (a9 == 0):
        lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_413: skip:.):
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_414: skip:.):
            ; if (a5 == 0) and (a6 != 0):
            lda tmp0: and #BIT_5+BIT_6: cmp #BIT_6: .(:beq skip: jmp lbl_415: skip:.)
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_415:
            ; else:
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_417: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_418: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_419: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_420: skip:.):
                      ; if (a3 == 0) and (a2 != 0):
                      lda tmp0: and #BIT_3+BIT_2: cmp #BIT_2: .(:beq skip: jmp lbl_421: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_421:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_420:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_419:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_418:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_417:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_427: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_428: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_429: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_430: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_430:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_432: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_432:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
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
                jmp _unefonctionDone
lbl_427:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_414:
          ; else:
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_437: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a6 != 0):
              lda tmp0: and #BIT_6: cmp #BIT_6: .(:beq skip: jmp lbl_438: skip:.)
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_438:
            ; else:
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_440: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_441: skip:.):
                  ; if (a4 == 0) and (a1 != 0) and (a2 != 0) and (a0 != 0):
                  lda tmp0: and #BIT_4+BIT_1+BIT_2+BIT_0: cmp #BIT_1+BIT_2+BIT_0: .(:beq skip: jmp lbl_442: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_442:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_441:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_440:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_448: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_449: skip:.):
                    ; r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_449:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_451: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_451:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_453: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_454: skip:.):
                          ; r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_454:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_453:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_448:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_413:
        ; else:
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_458: skip:.):
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_459: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_460: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_461: skip:.):
                  ; r2 = 1, r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_461:
                ; else:
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_463: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_463:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_465: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_466: skip:.):
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_467: skip:.):
                          ; r2 = 1, r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_467:
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_466:
                      ; else:
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_465:
                    ; else:
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_460:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_459:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_473: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_473:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_458:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_475: skip:.):
              ; if (a6 != 0):
              lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_476: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_477: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_478: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_479: skip:.):
                      ; if (a2 == 0) and (a0 != 0):
                      lda tmp0: and #BIT_2+BIT_0: cmp #BIT_0: .(:beq skip: jmp lbl_480: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_480:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_479:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_478:
                jmp _unefonctionDone
lbl_477:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_476:
            jmp _unefonctionDone
lbl_475:
            ; else:
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_485: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_486: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_486:
                ; else:
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_488: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_488:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_490: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_491: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_491:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_493: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_493:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_490:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_485:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_412:
      ; else:
        ; r4 = 1
        lda tmp7: ora #BIT_4: sta tmp7
        ; if (a7 == 0):
        lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_497: skip:.):
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_498: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_499: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_500: skip:.):
                ; if (a9 == 0):
                lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_501: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_502: skip:.):
                    ; r2 = 1, r1 = 1, r0 = 1
                    lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_502:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_504: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_505: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_506: skip:.):
                          ; r2 = 1, r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_2+BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_506:
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_505:
                      ; else:
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_504:
                    ; else:
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_501:
                ; else:
                  ; r3 = 1, r2 = 1
                  lda tmp7: ora #BIT_3+BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_500:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a9 != 0):
                lda tmp0+1 : and #BIT_9: .(:bne skip: jmp lbl_512: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_512:
            jmp _unefonctionDone
lbl_499:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a9 != 0):
              lda tmp0+1 : and #BIT_9: .(:bne skip: jmp lbl_514: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_515: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_516: skip:.):
                    ; if (a3 != 0):
                    lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_517: skip:.):
                      ; if (a0 == 0) and (a1 != 0):
                      lda tmp0: and #BIT_0+BIT_1: cmp #BIT_1: .(:beq skip: jmp lbl_518: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_518:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_517:
                  jmp _unefonctionDone
lbl_516:
                jmp _unefonctionDone
lbl_515:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_514:
          jmp _unefonctionDone
lbl_498:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a9 == 0):
            lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_522: skip:.):
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_523: skip:.):
                ; if (a6 != 0):
                lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_524: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_525: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_526: skip:.):
                      ; if (a2 == 0) and (a0 != 0):
                      lda tmp0: and #BIT_2+BIT_0: cmp #BIT_0: .(:beq skip: jmp lbl_527: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_527:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_526:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_525:
                jmp _unefonctionDone
lbl_524:
              jmp _unefonctionDone
lbl_523:
            jmp _unefonctionDone
lbl_522:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a6 != 0):
              lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_531: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_531:
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_497:
        ; else:
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_532: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_533: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_533:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_534: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_534:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_536: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_537: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_537:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_539: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_540: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_540:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_542: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_542:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_539:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_536:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_532:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_546: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_546:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_547: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_548: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_549: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_550: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_550:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_552: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_552:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_554: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_554:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_549:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_548:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_547:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone
lbl_411:
    ; else:
      ; if (a6 == 0):
      lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_560: skip:.):
        ; r5 = 1
        lda tmp7: ora #BIT_5: sta tmp7
        ; if (a11 == 0):
        lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_561: skip:.):
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_562: skip:.):
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_563: skip:.):
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_564: skip:.):
                ; if (a4 != 0):
                lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_565: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_566: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_567: skip:.):
                      ; if (a1 == 0) and (a0 != 0):
                      lda tmp0: and #BIT_1+BIT_0: cmp #BIT_0: .(:beq skip: jmp lbl_568: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_568:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_567:
                  jmp _unefonctionDone
lbl_566:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_565:
              jmp _unefonctionDone
lbl_564:
            jmp _unefonctionDone
lbl_563:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_562:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_572: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_573: skip:.):
                ; if (a4 == 0) and (a0 != 0) and (a3 != 0) and (a2 != 0) and (a1 != 0):
                lda tmp0: and #BIT_4+BIT_0+BIT_3+BIT_2+BIT_1: cmp #BIT_0+BIT_3+BIT_2+BIT_1: .(:beq skip: jmp lbl_574: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_574:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_573:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_572:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_580: skip:.):
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_581: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_582: skip:.):
                    ; if (a5 != 0):
                    lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_583: skip:.):
                      ; if (a0 == 0) and (a1 != 0):
                      lda tmp0: and #BIT_0+BIT_1: cmp #BIT_1: .(:beq skip: jmp lbl_584: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_584:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_583:
                  jmp _unefonctionDone
lbl_582:
                jmp _unefonctionDone
lbl_581:
              jmp _unefonctionDone
lbl_580:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_561:
        ; else:
          ; r4 = 1, r3 = 1
          lda tmp7: ora #BIT_4+BIT_3: sta tmp7
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_587: skip:.):
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a7 != 0):
            lda tmp0: and #BIT_7: cmp #BIT_7: .(:beq skip: jmp lbl_588: skip:.)
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_588:
          ; else:
            ; r2 = 1, r1 = 1
            lda tmp7: ora #BIT_2+BIT_1: sta tmp7
            ; if (a7 != 0):
            lda tmp0 : and #BIT_7: .(:bne skip: jmp lbl_589: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_589:
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_560:
      ; else:
        ; if (a11 == 0):
        lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_591: skip:.):
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_592: skip:.):
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_593: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_594: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_594:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_596: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_596:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_598: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_598:
                  ; else:
                    ; if (a5 == 0):
                    lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_600: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_600:
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_602: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_602:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_604: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_604:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_593:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_606: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_607: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_608: skip:.):
                    ; if (a2 == 0) and (a0 != 0) and (a1 != 0):
                    lda tmp0: and #BIT_2+BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_609: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_609:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_608:
                jmp _unefonctionDone
lbl_607:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_606:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_592:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_614: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_615: skip:.):
                ; r1 = 1, r0 = 1
                lda tmp7: ora #BIT_1+BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_615:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_617: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_618: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_619: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_619:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_621: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_622: skip:.):
                          ; r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_622:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_621:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_618:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_617:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
lbl_614:
            ; else:
              ; r2 = 1, r0 = 1
              lda tmp7: ora #BIT_2+BIT_0: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_591:
        ; else:
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_628: skip:.):
            ; r5 = 1, r4 = 1, r3 = 1
            lda tmp7: ora #BIT_5+BIT_4+BIT_3: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_629: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a5 == 0) and (a1 != 0) and (a3 != 0) and (a0 != 0) and (a2 != 0) and (a4 != 0):
              lda tmp0: and #BIT_5+BIT_1+BIT_3+BIT_0+BIT_2+BIT_4: cmp #BIT_1+BIT_3+BIT_0+BIT_2+BIT_4: .(:beq skip: jmp lbl_630: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_630:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_629:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_636: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_637: skip:.):
                  ; r1 = 1, r0 = 1
                  lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_637:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_639: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_640: skip:.):
                      ; r1 = 1, r0 = 1
                      lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_640:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_642: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_643: skip:.):
                          ; r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_643:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_642:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_639:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_636:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_628:
          ; else:
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_649: skip:.):
              ; r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1
              lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2+BIT_1: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_650: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_651: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_652: skip:.):
                    ; if (a4 == 0) and (a0 != 0) and (a1 != 0):
                    lda tmp0: and #BIT_4+BIT_0+BIT_1: cmp #BIT_0+BIT_1: .(:beq skip: jmp lbl_653: skip:.)
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_653:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_652:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_651:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_650:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_649:
            ; else:
              ; if (a2 == 0):
              lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_660: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_661: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_662: skip:.):
                    ; if (a5 == 0):
                    lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_663: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_664: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_665: skip:.):
                          ; r5 = 1, r4 = 1, r3 = 1, r2 = 1, r1 = 1, r0 = 1
                          lda tmp7: ora #BIT_5+BIT_4+BIT_3+BIT_2+BIT_1+BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_665:
                        ; else:
                          ; r6 = 1
                          lda tmp7: ora #BIT_6: sta tmp7
                      jmp _unefonctionDone
lbl_664:
                      ; else:
                        ; r6 = 1
                        lda tmp7: ora #BIT_6: sta tmp7
                    jmp _unefonctionDone
lbl_663:
                    ; else:
                      ; r6 = 1
                      lda tmp7: ora #BIT_6: sta tmp7
                  jmp _unefonctionDone
lbl_662:
                  ; else:
                    ; r6 = 1
                    lda tmp7: ora #BIT_6: sta tmp7
                jmp _unefonctionDone
lbl_661:
                ; else:
                  ; r6 = 1
                  lda tmp7: ora #BIT_6: sta tmp7
              jmp _unefonctionDone
lbl_660:
              ; else:
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
  jmp _unefonctionDone