  ; if (a3 == 0):
  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a2 == 0):
    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a1 == 0):
      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a0 != 0):
        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_4: skip:.):
          ; r0 = 1
          lda tmp7: ora #BIT_0: sta tmp7
        jmp _unefonctionDone
lbl_4:
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; if (a0 == 0):
        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_6: skip:.):
          ; r0 = 1
          lda tmp7: ora #BIT_0: sta tmp7
        jmp _unefonctionDone
lbl_6:
        ; else:
          ; r1 = 1
          lda tmp7: ora #BIT_1: sta tmp7
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; r1 = 1
      lda tmp7: ora #BIT_1: sta tmp7
      ; if (a1 != 0):
      lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_8: skip:.):
        ; if (a0 != 0):
        lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_9: skip:.):
          ; r0 = 1
          lda tmp7: ora #BIT_0: sta tmp7
        jmp _unefonctionDone
lbl_9:
      jmp _unefonctionDone
lbl_8:
    jmp _unefonctionDone
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; if (a2 == 0):
    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_10: skip:.):
      ; r1 = 1
      lda tmp7: ora #BIT_1: sta tmp7
      ; r0 = 1
      lda tmp7: ora #BIT_0: sta tmp7
    jmp _unefonctionDone
lbl_10:
    ; else:
      ; if (a0 == 0):
      lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_12: skip:.):
        ; if (a1 == 0):
        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_13: skip:.):
          ; r1 = 1
          lda tmp7: ora #BIT_1: sta tmp7
          ; r0 = 1
          lda tmp7: ora #BIT_0: sta tmp7
        jmp _unefonctionDone
lbl_13:
        ; else:
          ; r2 = 1
          lda tmp7: ora #BIT_2: sta tmp7
      jmp _unefonctionDone
lbl_12:
      ; else:
        ; r2 = 1
        lda tmp7: ora #BIT_2: sta tmp7
  jmp _unefonctionDone
