  ; if (a8 == 0):
  lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a6 == 0):
    lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a10 == 0):
      lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a11 == 0):
        lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_4: skip:.):
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_5: skip:.):
            ; if (a9 == 0):
            lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_6: skip:.):
              ; r5 = 1
              lda tmp7: ora #BIT_5: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_7: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_8: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_9: skip:.):
                    ; r4 = 1
                    lda tmp7: ora #BIT_4: sta tmp7
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_10: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_11: skip:.):
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_11:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_13: skip:.):
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                        jmp _unefonctionDone
lbl_13:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_10:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_15: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_16: skip:.):
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_16:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_15:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_18: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                        jmp _unefonctionDone
lbl_18:
                        ; else:
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
                      jmp _unefonctionDone
                    jmp _unefonctionDone
                  jmp _unefonctionDone
lbl_9:
                  ; else:
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_20: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_21: skip:.):
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_21:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_22: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                        jmp _unefonctionDone
lbl_22:
                        ; else:
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
                    jmp _unefonctionDone
lbl_20:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_24: skip:.):
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_24:
                      ; else:
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                jmp _unefonctionDone
lbl_8:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_27: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_28: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_29: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_29:
                    jmp _unefonctionDone
lbl_28:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_31: skip:.):
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_31:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_33: skip:.):
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                        jmp _unefonctionDone
lbl_33:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_27:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_35: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_35:
                  jmp _unefonctionDone
              jmp _unefonctionDone
lbl_7:
              ; else:
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_36: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_37: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_38: skip:.):
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_39: skip:.):
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                      jmp _unefonctionDone
lbl_39:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
                    jmp _unefonctionDone
lbl_38:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_41: skip:.):
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_41:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_43: skip:.):
                          ; r3 = 1
                          lda tmp7: ora #BIT_3: sta tmp7
                        jmp _unefonctionDone
lbl_43:
                        ; else:
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_37:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_46: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_47: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_47:
                    jmp _unefonctionDone
lbl_46:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_48: skip:.):
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                      jmp _unefonctionDone
lbl_48:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
                jmp _unefonctionDone
lbl_36:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_50: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_51: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_52: skip:.):
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                      jmp _unefonctionDone
lbl_52:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_51:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_50:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_55: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_56: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_57: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_57:
                      jmp _unefonctionDone
lbl_56:
                    jmp _unefonctionDone
lbl_55:
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_6:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_59: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_60: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_61: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_62: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_63: skip:.):
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_64: skip:.):
                          ; r4 = 1
                          lda tmp7: ora #BIT_4: sta tmp7
                        jmp _unefonctionDone
lbl_64:
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
lbl_63:
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
lbl_62:
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
lbl_61:
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
lbl_60:
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
lbl_59:
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
lbl_5:
          ; else:
            ; if (a9 == 0):
            lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_71: skip:.):
              ; r4 = 1
              lda tmp7: ora #BIT_4: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_72: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_73: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_74: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_74:
                  ; else:
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_76: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_76:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_73:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_78: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_78:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_79: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_79:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_81: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_81:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_83: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_83:
                  jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_72:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_84: skip:.):
                  ; r3 = 1
                  lda tmp7: ora #BIT_3: sta tmp7
                jmp _unefonctionDone
lbl_84:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_86: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_87: skip:.):
                      ; r3 = 1
                      lda tmp7: ora #BIT_3: sta tmp7
                    jmp _unefonctionDone
lbl_87:
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_89: skip:.):
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_89:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_86:
                  ; else:
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_71:
            ; else:
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_92: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_93: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_93:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_95: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_95:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_97: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_98: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_99: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                        jmp _unefonctionDone
lbl_99:
                        ; else:
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_98:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_97:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_92:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_4:
        ; else:
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_104: skip:.):
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_105: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_105:
          jmp _unefonctionDone
lbl_104:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; r0 = 1
            lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; if (a9 == 0):
        lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_107: skip:.):
          ; if (a11 == 0):
          lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_108: skip:.):
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_109: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_109:
            ; else:
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_108:
          ; else:
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_111: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_111:
            ; else:
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_107:
        ; else:
          ; if (a11 == 0):
          lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_112: skip:.):
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_113: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_113:
          jmp _unefonctionDone
lbl_112:
          ; else:
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_114: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_115: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_116: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_116:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_118: skip:.):
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_119: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_120: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_121: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_121:
                      jmp _unefonctionDone
lbl_120:
                    jmp _unefonctionDone
lbl_119:
                  jmp _unefonctionDone
lbl_118:
              jmp _unefonctionDone
lbl_115:
            jmp _unefonctionDone
lbl_114:
          jmp _unefonctionDone
        jmp _unefonctionDone
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; if (a11 == 0):
      lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_123: skip:.):
        ; if (a10 == 0):
        lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_124: skip:.):
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_125: skip:.):
            ; r4 = 1
            lda tmp7: ora #BIT_4: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_126: skip:.):
              ; r3 = 1
              lda tmp7: ora #BIT_3: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_127: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_128: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_129: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_129:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_130: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_131: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_132: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_132:
                      jmp _unefonctionDone
lbl_131:
                    jmp _unefonctionDone
lbl_130:
                  jmp _unefonctionDone
                jmp _unefonctionDone
lbl_128:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_133: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_134: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_134:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_133:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_137: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_137:
                    ; else:
                      ; if (a3 == 0):
                      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_138: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_138:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_140: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_140:
                    jmp _unefonctionDone
                jmp _unefonctionDone
              jmp _unefonctionDone
lbl_127:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_141: skip:.):
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_142: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_142:
                  ; else:
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_144: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_144:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_141:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_147: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_147:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_148: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_149: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_149:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_151: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_151:
                    jmp _unefonctionDone
lbl_148:
                  jmp _unefonctionDone
              jmp _unefonctionDone
            jmp _unefonctionDone
lbl_126:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_152: skip:.):
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_153: skip:.):
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_154: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_154:
                  ; else:
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_156: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_156:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_158: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_158:
                      ; else:
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_160: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_160:
                jmp _unefonctionDone
lbl_153:
              jmp _unefonctionDone
lbl_152:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_161: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_162: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_162:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_164: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_165: skip:.):
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                      jmp _unefonctionDone
lbl_165:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_167: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                        jmp _unefonctionDone
lbl_167:
                        ; else:
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_164:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_161:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_125:
          ; else:
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_172: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_173: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_174: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_175: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_175:
                jmp _unefonctionDone
lbl_174:
              jmp _unefonctionDone
lbl_173:
            jmp _unefonctionDone
lbl_172:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_176: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_176:
              ; else:
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_177: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_177:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_179: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_180: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_180:
                    ; else:
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_182: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_183: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_183:
                      jmp _unefonctionDone
lbl_182:
                  jmp _unefonctionDone
lbl_179:
              jmp _unefonctionDone
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_124:
        ; else:
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_185: skip:.):
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_186: skip:.):
              ; if (a7 == 0):
              lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_187: skip:.):
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_188: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_188:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_190: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_190:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_192: skip:.):
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                    jmp _unefonctionDone
lbl_192:
                    ; else:
                      ; if (a4 == 0):
                      lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_194: skip:.):
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                      jmp _unefonctionDone
lbl_194:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_187:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_186:
            ; else:
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_197: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_197:
              ; else:
                ; if (a7 == 0):
                lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_198: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_198:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_200: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_200:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_202: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_203: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_204: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_204:
                      jmp _unefonctionDone
lbl_203:
                    jmp _unefonctionDone
lbl_202:
              jmp _unefonctionDone
            jmp _unefonctionDone
          jmp _unefonctionDone
lbl_185:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_205: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_206: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_206:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_208: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_208:
                ; else:
                  ; if (a2 == 0):
                  lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_210: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_211: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_212: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_212:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_214: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_214:
                    jmp _unefonctionDone
lbl_211:
                  jmp _unefonctionDone
lbl_210:
            jmp _unefonctionDone
lbl_205:
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_123:
      ; else:
        ; if (a10 == 0):
        lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_215: skip:.):
          ; if (a9 == 0):
          lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_216: skip:.):
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_217: skip:.):
              ; if (a7 == 0):
              lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_218: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_219: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_219:
                ; else:
                  ; if (a4 == 0):
                  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_221: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_221:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_223: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_223:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_225: skip:.):
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_226: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_226:
                      jmp _unefonctionDone
lbl_225:
              jmp _unefonctionDone
lbl_218:
            jmp _unefonctionDone
lbl_217:
          jmp _unefonctionDone
lbl_216:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a7 == 0):
            lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_228: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_228:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_229: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_230: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_230:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_232: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_232:
                  ; else:
                    ; if (a0 == 0):
                    lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_234: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_235: skip:.):
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_236: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_236:
                      jmp _unefonctionDone
lbl_235:
                    jmp _unefonctionDone
lbl_234:
              jmp _unefonctionDone
lbl_229:
            jmp _unefonctionDone
        jmp _unefonctionDone
lbl_215:
        ; else:
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_237: skip:.):
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_238: skip:.):
              ; if (a9 == 0):
              lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_239: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_240: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_240:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_242: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_242:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_244: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_245: skip:.):
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                      jmp _unefonctionDone
lbl_245:
                      ; else:
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_244:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_239:
            jmp _unefonctionDone
lbl_238:
            ; else:
              ; if (a9 == 0):
              lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_249: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_249:
          jmp _unefonctionDone
lbl_237:
          ; else:
            ; if (a9 == 0):
            lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_250: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_250:
          jmp _unefonctionDone
        jmp _unefonctionDone
      jmp _unefonctionDone
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; if (a9 == 0):
    lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_252: skip:.):
      ; if (a11 == 0):
      lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_253: skip:.):
        ; if (a10 == 0):
        lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_254: skip:.):
          ; r4 = 1
          lda tmp7: ora #BIT_4: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_255: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_256: skip:.):
              ; if (a4 == 0):
              lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_257: skip:.):
                ; r2 = 1
                lda tmp7: ora #BIT_2: sta tmp7
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_258: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_259: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_259:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_261: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_261:
                jmp _unefonctionDone
lbl_258:
              jmp _unefonctionDone
lbl_257:
              ; else:
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_263: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_263:
                ; else:
                  ; if (a0 == 0):
                  lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_265: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_266: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_267: skip:.):
                        ; if (a2 == 0):
                        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_268: skip:.):
                          ; r2 = 1
                          lda tmp7: ora #BIT_2: sta tmp7
                        jmp _unefonctionDone
lbl_268:
                        ; else:
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_267:
                      ; else:
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_266:
                    ; else:
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_265:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_256:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_274: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_275: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_275:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_277: skip:.):
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_277:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_279: skip:.):
                      ; if (a0 == 0):
                      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_280: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_280:
                      ; else:
                        ; if (a1 == 0):
                        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_282: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_282:
                    jmp _unefonctionDone
lbl_279:
              jmp _unefonctionDone
lbl_274:
          jmp _unefonctionDone
lbl_255:
          ; else:
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_283: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_284: skip:.):
                ; if (a5 == 0):
                lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_285: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_286: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_286:
                  ; else:
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_288: skip:.):
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_289: skip:.):
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                      jmp _unefonctionDone
lbl_289:
                      ; else:
                        ; if (a0 == 0):
                        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_291: skip:.):
                          ; r1 = 1
                          lda tmp7: ora #BIT_1: sta tmp7
                        jmp _unefonctionDone
lbl_291:
                        ; else:
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_288:
                    ; else:
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_285:
                ; else:
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_284:
              ; else:
                ; if (a1 == 0):
                lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_296: skip:.):
                  ; if (a5 == 0):
                  lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_297: skip:.):
                    ; if (a3 == 0):
                    lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_298: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_299: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_299:
                    jmp _unefonctionDone
lbl_298:
                  jmp _unefonctionDone
lbl_297:
                jmp _unefonctionDone
lbl_296:
            jmp _unefonctionDone
lbl_283:
            ; else:
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_300: skip:.):
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_300:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_254:
        ; else:
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_302: skip:.):
            ; r3 = 1
            lda tmp7: ora #BIT_3: sta tmp7
          jmp _unefonctionDone
lbl_302:
          ; else:
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_303: skip:.):
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_304: skip:.):
                ; r3 = 1
                lda tmp7: ora #BIT_3: sta tmp7
              jmp _unefonctionDone
lbl_304:
              ; else:
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_306: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_307: skip:.):
                    ; r3 = 1
                    lda tmp7: ora #BIT_3: sta tmp7
                  jmp _unefonctionDone
lbl_307:
                  ; else:
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_309: skip:.):
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_310: skip:.):
                        ; r3 = 1
                        lda tmp7: ora #BIT_3: sta tmp7
                      jmp _unefonctionDone
lbl_310:
                      ; else:
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_309:
                    ; else:
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                      ; r1 = 1
                      lda tmp7: ora #BIT_1: sta tmp7
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_306:
                ; else:
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_303:
            ; else:
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
      jmp _unefonctionDone
lbl_253:
      ; else:
        ; if (a10 == 0):
        lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_316: skip:.):
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_317: skip:.):
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
          jmp _unefonctionDone
lbl_317:
          ; else:
            ; if (a5 == 0):
            lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_319: skip:.):
              ; if (a6 == 0):
              lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_320: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_321: skip:.):
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_322: skip:.):
                    ; if (a1 == 0):
                    lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_323: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_323:
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_325: skip:.):
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_325:
                      ; else:
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                  jmp _unefonctionDone
lbl_322:
                  ; else:
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_321:
                ; else:
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_320:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_319:
            ; else:
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
        jmp _unefonctionDone
lbl_316:
        ; else:
          ; r0 = 1
          lda tmp7: ora #BIT_0: sta tmp7
        jmp _unefonctionDone
    jmp _unefonctionDone
lbl_252:
    ; else:
      ; if (a10 == 0):
      lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_331: skip:.):
        ; if (a11 == 0):
        lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_332: skip:.):
          ; r3 = 1
          lda tmp7: ora #BIT_3: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_333: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_334: skip:.):
              ; r2 = 1
              lda tmp7: ora #BIT_2: sta tmp7
            jmp _unefonctionDone
lbl_334:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_336: skip:.):
                ; if (a3 == 0):
                lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_337: skip:.):
                  ; r2 = 1
                  lda tmp7: ora #BIT_2: sta tmp7
                jmp _unefonctionDone
lbl_337:
                ; else:
                  ; if (a1 == 0):
                  lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_339: skip:.):
                    ; r2 = 1
                    lda tmp7: ora #BIT_2: sta tmp7
                  jmp _unefonctionDone
lbl_339:
                  ; else:
                    ; if (a4 == 0):
                    lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_341: skip:.):
                      ; r2 = 1
                      lda tmp7: ora #BIT_2: sta tmp7
                    jmp _unefonctionDone
lbl_341:
                    ; else:
                      ; if (a2 == 0):
                      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_343: skip:.):
                        ; r2 = 1
                        lda tmp7: ora #BIT_2: sta tmp7
                      jmp _unefonctionDone
lbl_343:
                      ; else:
                        ; r1 = 1
                        lda tmp7: ora #BIT_1: sta tmp7
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_336:
              ; else:
                ; r1 = 1
                lda tmp7: ora #BIT_1: sta tmp7
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_333:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_346: skip:.):
              ; r0 = 1
              lda tmp7: ora #BIT_0: sta tmp7
            jmp _unefonctionDone
lbl_346:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_347: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_348: skip:.):
                  ; r0 = 1
                  lda tmp7: ora #BIT_0: sta tmp7
                jmp _unefonctionDone
lbl_348:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_350: skip:.):
                    ; if (a2 == 0):
                    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_351: skip:.):
                      ; r0 = 1
                      lda tmp7: ora #BIT_0: sta tmp7
                    jmp _unefonctionDone
lbl_351:
                    ; else:
                      ; if (a1 == 0):
                      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_353: skip:.):
                        ; r0 = 1
                        lda tmp7: ora #BIT_0: sta tmp7
                      jmp _unefonctionDone
lbl_353:
                  jmp _unefonctionDone
lbl_350:
              jmp _unefonctionDone
lbl_347:
            jmp _unefonctionDone
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_332:
        ; else:
          ; r1 = 1
          lda tmp7: ora #BIT_1: sta tmp7
      jmp _unefonctionDone
lbl_331:
      ; else:
        ; if (a11 == 0):
        lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_355: skip:.):
          ; r2 = 1
          lda tmp7: ora #BIT_2: sta tmp7
          ; if (a7 == 0):
          lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_356: skip:.):
            ; if (a6 == 0):
            lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_357: skip:.):
              ; r1 = 1
              lda tmp7: ora #BIT_1: sta tmp7
            jmp _unefonctionDone
lbl_357:
            ; else:
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_359: skip:.):
                ; if (a4 == 0):
                lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_360: skip:.):
                  ; r1 = 1
                  lda tmp7: ora #BIT_1: sta tmp7
                jmp _unefonctionDone
lbl_360:
                ; else:
                  ; if (a3 == 0):
                  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_362: skip:.):
                    ; r1 = 1
                    lda tmp7: ora #BIT_1: sta tmp7
                  jmp _unefonctionDone
lbl_362:
                  ; else:
                    ; r0 = 1
                    lda tmp7: ora #BIT_0: sta tmp7
              jmp _unefonctionDone
lbl_359:
              ; else:
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_356:
          ; else:
            ; r0 = 1
            lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
        jmp _unefonctionDone
lbl_355:
      jmp _unefonctionDone
    jmp _unefonctionDone
