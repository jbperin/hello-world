  ; if (a7 == 0):
  lda tmp0 : and #BIT_7: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a8 == 0):
    lda tmp0+1 : and #BIT_8: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a1 != 0):
      lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_3: skip:.):
        ; if (a0 != 0):
        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_4: skip:.):
          ; if (a15 == 0):
          lda tmp0+1 : and #BIT_15: .(:beq skip: jmp lbl_5: skip:.):
            ; if (a4 == 0):
            lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_6: skip:.):
              ; if (a2 != 0):
              lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_7: skip:.):
                ; if (a14 == 0):
                lda tmp0+1 : and #BIT_14: .(:beq skip: jmp lbl_8: skip:.):
                  ; if (a12 == 0):
                  lda tmp0+1 : and #BIT_12: .(:beq skip: jmp lbl_9: skip:.):
                    ; if (a13 == 0):
                    lda tmp0+1 : and #BIT_13: .(:beq skip: jmp lbl_10: skip:.):
                      ; if (a6 == 0):
                      lda tmp0 : and #BIT_6: .(:beq skip: jmp lbl_11: skip:.):
                        ; if (a3 != 0):
                        lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_12: skip:.):
                          ; if (a5 == 0):
                          lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_13: skip:.):
                            ; if (a10 == 0):
                            lda tmp0+1 : and #BIT_10: .(:beq skip: jmp lbl_14: skip:.):
                              ; if (a9 == 0):
                              lda tmp0+1 : and #BIT_9: .(:beq skip: jmp lbl_15: skip:.):
                                ; if (a11 == 0):
                                lda tmp0+1 : and #BIT_11: .(:beq skip: jmp lbl_16: skip:.):
                                  ; r0 = 1
                                  lda tmp7: ora #BIT_0: sta tmp7
                                jmp _unefonctionDone
lbl_16:
                              jmp _unefonctionDone
lbl_15:
                            jmp _unefonctionDone
lbl_14:
                          jmp _unefonctionDone
lbl_13:
                        jmp _unefonctionDone
lbl_12:
                      jmp _unefonctionDone
lbl_11:
                    jmp _unefonctionDone
lbl_10:
                  jmp _unefonctionDone
lbl_9:
                jmp _unefonctionDone
lbl_8:
              jmp _unefonctionDone
lbl_7:
            jmp _unefonctionDone
lbl_6:
          jmp _unefonctionDone
lbl_5:
        jmp _unefonctionDone
lbl_4:
      jmp _unefonctionDone
lbl_3:
    jmp _unefonctionDone
lbl_2:
  jmp _unefonctionDone
lbl_1:
