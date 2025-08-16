  ; if (a9 == 0):
  lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a10 == 0):
    lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a11 == 0):
      lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a8 == 0):
        lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_4: skip:.):
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_5: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_6: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_7: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_8: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_9: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_10: skip:.):
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
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_9:
                  ; else:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_21: skip:.):
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
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_27: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
                    jmp _unefonctionDone
lbl_27:
                    ; else:
                      ; if (a3 == 0):
                      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_31: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_31:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_33: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_33:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_7:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_36: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_37: skip:.):
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_37:
                jmp _unefonctionDone
lbl_36:
                ; else:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_45: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_46: skip:.):
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
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_51: skip:.):
                ; else:
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_55: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_56: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_56:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_55:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_61: skip:.):
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_64: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_64:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_61:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_51:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
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
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_73: skip:.):
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_74: skip:.):
                ; if (a6 == 0):
                lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_75: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_76: skip:.):
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_79: skip:.):
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_79:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_76:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_75:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_74:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a6 == 0):
                lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_85: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_86: skip:.):
                    ; if (a3 != 0):
                    lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_87: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_87:
                  jmp _unefonctionDone
lbl_86:
                jmp _unefonctionDone
lbl_85:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_91: skip:.):
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_91:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_73:
            ; else:
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_97: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_98: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_98:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_99: skip:.):
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_102: skip:.):
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
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_99:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_97:
              ; else:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_110: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_111: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_112: skip:.):
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
lbl_110:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
        jmp _unefonctionDone
lbl_4:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_118: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_119: skip:.):
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_119:
            ; else:
                ; if (a5 != 0):
                lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_122: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_122:
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_124: skip:.):
                ; if (a6 == 0):
                lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_125: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_126: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_127: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_127:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_126:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_132: skip:.):
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_135: skip:.):
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
lbl_125:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_124:
              ; else:
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_143: skip:.):
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_143:
                ; else:
                  ; if (a6 == 0):
                  lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_146: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_146:
                  ; else:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_150: skip:.):
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_150:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_118:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_154: skip:.):
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_155: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_156: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_157: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_158: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_158:
                  jmp _unefonctionDone
lbl_157:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_156:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_155:
            jmp _unefonctionDone
lbl_154:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_164: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_165: skip:.):
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_168: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_168:
                    ; else:
                      ; if (a3 == 0):
                      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_170: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_170:
                      ; else:
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_172: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_172:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_165:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_164:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_176: skip:.):
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_177: skip:.):
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_177:
                jmp _unefonctionDone
lbl_176:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; r5 = 1
        lda tmp7: ora #BIT_5: sta tmp7
        ; if (a8 == 0):
        lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_183: skip:.):
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_184: skip:.):
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_185: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_186: skip:.):
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_189: skip:.):
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_192: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_192:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_194: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_194:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_189:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_186:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_185:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_198: skip:.):
                ; if (a5 != 0):
                lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_199: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_200: skip:.):
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_200:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_199:
              jmp _unefonctionDone
lbl_198:
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_184:
          ; else:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_209: skip:.):
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_212: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_213: skip:.):
                      ; if (a3 == 0):
                      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_214: skip:.):
                        ; else:
                          ; r4 = 1
                          lda tmp7: ora #BIT_4: sta tmp7
                      jmp _unefonctionDone
lbl_214:
                      ; else:
                        ; r4 = 1
                        lda tmp7: ora #BIT_4: sta tmp7
                    jmp _unefonctionDone
lbl_213:
                    ; else:
                      ; r4 = 1
                      lda tmp7: ora #BIT_4: sta tmp7
                  jmp _unefonctionDone
lbl_212:
                  ; else:
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
              jmp _unefonctionDone
lbl_209:
              ; else:
                ; r4 = 1
                lda tmp7: ora #BIT_4: sta tmp7
        jmp _unefonctionDone
lbl_183:
        ; else:
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_221: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_222: skip:.):
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_223: skip:.):
                ; if (a5 != 0):
                lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_224: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_225: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_226: skip:.):
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
lbl_223:
            jmp _unefonctionDone
lbl_222:
            ; else:
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_221:
          ; else:
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_232: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_233: skip:.):
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_236: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_237: skip:.):
                      ; else:
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
lbl_237:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_236:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_233:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_232:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_246: skip:.):
                ; if (a6 != 0):
                lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_247: skip:.):
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_247:
              jmp _unefonctionDone
lbl_246:
          jmp _unefonctionDone
        jmp _unefonctionDone
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; r5 = 1
      lda tmp7: ora #BIT_5: sta tmp7
      ; if (a11 == 0):
      lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_253: skip:.):
        ; if (a8 == 0):
        lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_254: skip:.):
          ; if (a5 == 0):
          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_255: skip:.):
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_255:
          ; else:
              ; if (a6 != 0):
              lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_258: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_258:
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_260: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_261: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_262: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_263: skip:.):
                    ; if (a4 == 0):
                    lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_264: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_264:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_263:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_262:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_261:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_270: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_271: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_272: skip:.):
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_275: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_275:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_272:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_271:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_270:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_260:
            ; else:
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_281: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_282: skip:.):
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_282:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_281:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_289: skip:.):
                  ; else:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_294: skip:.):
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_294:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_289:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
        jmp _unefonctionDone
lbl_254:
        ; else:
          ; r2 = 1
          lda tmp7: ora #BIT_2: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_299: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_300: skip:.):
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_301: skip:.):
                ; if (a4 != 0):
                lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_302: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_303: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_304: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_304:
                  jmp _unefonctionDone
lbl_303:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_302:
              jmp _unefonctionDone
lbl_301:
            jmp _unefonctionDone
lbl_300:
            ; else:
              ; if (a1 == 0):
              lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_310: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_310:
              ; else:
                ; if (a0 == 0):
                lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_312: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_312:
                ; else:
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_314: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_314:
                  ; else:
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_316: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_316:
                    ; else:
                      ; if (a4 == 0):
                      lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_318: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_318:
                      ; else:
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_320: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_320:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
          jmp _unefonctionDone
lbl_299:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a6 != 0):
            lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_322: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_323: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_324: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_325: skip:.):
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_325:
                jmp _unefonctionDone
lbl_324:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_323:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_322:
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_253:
      ; else:
        ; r4 = 1
        lda tmp7: ora #BIT_4: sta tmp7
        ; if (a8 == 0):
        lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_332: skip:.):
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_333: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_334: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_335: skip:.):
                ; if (a6 == 0):
                lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_336: skip:.):
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_339: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_340: skip:.):
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_340:
                      ; else:
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_339:
                    ; else:
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_336:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_335:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_334:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a6 != 0):
              lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_348: skip:.):
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_349: skip:.):
                  ; if (a5 != 0):
                  lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_350: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_351: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_351:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_350:
                jmp _unefonctionDone
lbl_349:
              jmp _unefonctionDone
lbl_348:
          jmp _unefonctionDone
lbl_333:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_357: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_357:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_358: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_358:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_360: skip:.):
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_363: skip:.):
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_366: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_366:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_363:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_360:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_332:
        ; else:
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_370: skip:.):
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
          ; else:
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_372: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_372:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_380: skip:.):
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_383: skip:.):
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_386: skip:.):
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_386:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_383:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_380:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; if (a7 == 0):
    lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_392: skip:.):
      ; if (a11 == 0):
      lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_393: skip:.):
        ; if (a10 == 0):
        lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_394: skip:.):
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_395: skip:.):
            ; if (a8 == 0):
            lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_396: skip:.):
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_399: skip:.):
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_402: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_403: skip:.):
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_403:
                      ; else:
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_402:
                    ; else:
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_399:
                ; else:
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_396:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_410: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_411: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_412: skip:.):
                    ; if (a3 != 0):
                    lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_413: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_413:
                  jmp _unefonctionDone
lbl_412:
                jmp _unefonctionDone
lbl_411:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_410:
          jmp _unefonctionDone
lbl_395:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a8 == 0):
            lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_418: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_419: skip:.):
                ; if (a3 != 0):
                lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_420: skip:.):
                  ; if (a4 != 0):
                  lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_421: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_422: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_422:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_421:
                jmp _unefonctionDone
lbl_420:
              jmp _unefonctionDone
lbl_419:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_418:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_427: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_427:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_428: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_429: skip:.):
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_432: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_432:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_434: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_434:
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
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_394:
        ; else:
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; if (a6 == 0):
          lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_439: skip:.):
            ; if (a8 == 0):
            lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_440: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_441: skip:.):
                ; else:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_446: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_447: skip:.):
                        ; else:
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_447:
                      ; else:
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_446:
                    ; else:
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_441:
              ; else:
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
            jmp _unefonctionDone
lbl_440:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_454: skip:.):
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_454:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
          jmp _unefonctionDone
lbl_439:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a8 == 0):
            lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_461: skip:.):
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_462: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_463: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_464: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_465: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_465:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_464:
                jmp _unefonctionDone
lbl_463:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_462:
            jmp _unefonctionDone
lbl_461:
            ; else:
              ; else:
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_473: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_474: skip:.):
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_477: skip:.):
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_477:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_474:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_473:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_393:
      ; else:
        ; r5 = 1
        lda tmp7: ora #BIT_5: sta tmp7
        ; r4 = 1
        lda tmp7: ora #BIT_4: sta tmp7
        ; if (a10 == 0):
        lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_483: skip:.):
          ; if (a8 == 0):
          lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_484: skip:.):
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_487: skip:.):
                ; else:
                  ; else:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_494: skip:.):
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_494:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
              jmp _unefonctionDone
lbl_487:
              ; else:
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_484:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_499: skip:.):
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_502: skip:.):
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_505: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_505:
                    ; else:
                      ; if (a3 == 0):
                      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_507: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_507:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_509: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_509:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_502:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_499:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_483:
        ; else:
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; r2 = 1
          lda tmp7: ora #BIT_2: sta tmp7
          ; if (a8 == 0):
          lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_512: skip:.):
            ; if (a6 != 0):
            lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_513: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_514: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_515: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_516: skip:.):
                    ; if (a3 != 0):
                    lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_517: skip:.):
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
lbl_514:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_513:
          jmp _unefonctionDone
lbl_512:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a6 != 0):
            lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_523: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_524: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_525: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_526: skip:.):
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
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_524:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_523:
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
    jmp _unefonctionDone
lbl_392:
    ; else:
      ; if (a8 == 0):
      lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_535: skip:.):
        ; if (a11 == 0):
        lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_536: skip:.):
          ; if (a10 == 0):
          lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_537: skip:.):
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_538: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_539: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_540: skip:.):
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_543: skip:.):
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_546: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_546:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_543:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_540:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_539:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_538:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_550: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
              ; else:
                ; if (a6 == 0):
                lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_553: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_559: skip:.):
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_562: skip:.):
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_562:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_559:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_537:
          ; else:
            ; r5 = 1
            lda tmp7: ora #BIT_5: sta tmp7
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_568: skip:.):
              ; else:
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_571: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_571:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_573: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_573:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_575: skip:.):
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_578: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_578:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_575:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_568:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_536:
        ; else:
          ; r5 = 1
          lda tmp7: ora #BIT_5: sta tmp7
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a10 == 0):
          lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_581: skip:.):
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 != 0):
            lda tmp0 : and #BIT_6: .(:bne skip: jmp lbl_582: skip:.):
              ; if (a3 == 0):
              lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_583: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_584: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_585: skip:.):
                    ; if (a2 != 0):
                    lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_586: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_586:
                  jmp _unefonctionDone
lbl_585:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_584:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_583:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_582:
          jmp _unefonctionDone
lbl_581:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_593: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_593:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_594: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_595: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_596: skip:.):
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_599: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_599:
                      ; else:
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_601: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_601:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_596:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_595:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
              jmp _unefonctionDone
lbl_594:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_535:
      ; else:
        ; if (a6 == 0):
        lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_607: skip:.):
          ; if (a11 == 0):
          lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_608: skip:.):
            ; if (a10 == 0):
            lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_609: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a5 != 0):
              lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_610: skip:.):
                ; if (a2 == 0):
                lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_611: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_612: skip:.):
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
            jmp _unefonctionDone
lbl_609:
            ; else:
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a4 != 0):
              lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_620: skip:.):
                ; if (a2 != 0):
                lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_621: skip:.):
                  ; if (a5 != 0):
                  lda tmp0 : and #BIT_5: .(:bne skip: jmp lbl_622: skip:.):
                    ; if (a3 != 0):
                    lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_623: skip:.):
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_623:
                  jmp _unefonctionDone
lbl_622:
                jmp _unefonctionDone
lbl_621:
              jmp _unefonctionDone
lbl_620:
          jmp _unefonctionDone
lbl_608:
          ; else:
            ; r5 = 1
            lda tmp7: ora #BIT_5: sta tmp7
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a10 == 0):
            lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_627: skip:.):
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_628: skip:.):
                ; if (a4 != 0):
                lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_629: skip:.):
                  ; if (a3 != 0):
                  lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_630: skip:.):
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_630:
                jmp _unefonctionDone
lbl_629:
              jmp _unefonctionDone
lbl_628:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_627:
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
        jmp _unefonctionDone
lbl_607:
        ; else:
          ; if (a10 == 0):
          lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_636: skip:.):
            ; if (a11 == 0):
            lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_637: skip:.):
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_640: skip:.):
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_641: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_642: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_643: skip:.):
                        ; else:
                          ; r5 = 1
                          lda tmp7: ora #BIT_5: sta tmp7
                      jmp _unefonctionDone
lbl_643:
                      ; else:
                        ; r5 = 1
                        lda tmp7: ora #BIT_5: sta tmp7
                    jmp _unefonctionDone
lbl_642:
                    ; else:
                      ; r5 = 1
                      lda tmp7: ora #BIT_5: sta tmp7
                  jmp _unefonctionDone
lbl_641:
                  ; else:
                    ; r5 = 1
                    lda tmp7: ora #BIT_5: sta tmp7
                jmp _unefonctionDone
lbl_640:
                ; else:
                  ; r5 = 1
                  lda tmp7: ora #BIT_5: sta tmp7
            jmp _unefonctionDone
lbl_637:
            ; else:
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
          jmp _unefonctionDone
lbl_636:
          ; else:
            ; else:
              ; if (a0 == 0):
              lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_653: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_654: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_655: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_656: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_657: skip:.):
                        ; else:
                          ; r6 = 1
                          lda tmp7: ora #BIT_6: sta tmp7
                      jmp _unefonctionDone
lbl_657:
                      ; else:
                        ; r6 = 1
                        lda tmp7: ora #BIT_6: sta tmp7
                    jmp _unefonctionDone
lbl_656:
                    ; else:
                      ; r6 = 1
                      lda tmp7: ora #BIT_6: sta tmp7
                  jmp _unefonctionDone
lbl_655:
                  ; else:
                    ; r6 = 1
                    lda tmp7: ora #BIT_6: sta tmp7
                jmp _unefonctionDone
lbl_654:
                ; else:
                  ; r6 = 1
                  lda tmp7: ora #BIT_6: sta tmp7
              jmp _unefonctionDone
lbl_653:
              ; else:
                ; r6 = 1
                lda tmp7: ora #BIT_6: sta tmp7
  jmp _unefonctionDone