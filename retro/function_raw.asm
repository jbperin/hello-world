  ; if (a4 == 0):
  lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a2 == 0):
    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a3 == 0):
      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a0 == 0):
        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_4: skip:.):
          ; if (a1 != 0):
          lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_5: skip:.):
            ; r0 = 1
            lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_5:
        jmp _unefonctionDone
lbl_4:
        ; else:
          ; if (a1 == 0):
          lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_7: skip:.):
            ; r0 = 1
            lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_7:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; r1 = 1
        lda tmp7: ora #BIT_1: sta tmp7
        ; r0 = 1
        lda tmp7: ora #BIT_0: sta tmp7
      jmp _unefonctionDone
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; if (a3 == 0):
      lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_10: skip:.):
        ; r1 = 1
        lda tmp7: ora #BIT_1: sta tmp7
        ; if (a1 != 0):
        lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_11: skip:.):
          ; if (a0 != 0):
          lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_12: skip:.):
            ; r0 = 1
            lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_12:
        jmp _unefonctionDone
lbl_11:
      jmp _unefonctionDone
lbl_10:
      ; else:
        ; if (a0 == 0):
        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_14: skip:.):
          ; if (a1 == 0):
          lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_15: skip:.):
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
            ; r0 = 1
            lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_15:
          ; else:
            ; r2 = 1
            lda tmp7: ora #BIT_2: sta tmp7
        jmp _unefonctionDone
lbl_14:
        ; else:
          ; r2 = 1
          lda tmp7: ora #BIT_2: sta tmp7
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; r2 = 1
    lda tmp7: ora #BIT_2: sta tmp7
    ; if (a2 == 0):
    lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_18: skip:.):
      ; if (a3 != 0):
      lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_19: skip:.):
        ; r0 = 1
        lda tmp7: ora #BIT_0: sta tmp7
      jmp _unefonctionDone
lbl_19:
    jmp _unefonctionDone
lbl_18:
    ; else:
      ; if (a1 == 0):
      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_20: skip:.):
        ; if (a3 == 0):
        lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_21: skip:.):
          ; if (a0 != 0):
          lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_22: skip:.):
            ; r0 = 1
            lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_22:
        jmp _unefonctionDone
lbl_21:
        ; else:
          ; r0 = 1
          lda tmp7: ora #BIT_0: sta tmp7
        jmp _unefonctionDone
      jmp _unefonctionDone
lbl_20:
      ; else:
        ; if (a3 == 0):
        lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_24: skip:.):
          ; r0 = 1
          lda tmp7: ora #BIT_0: sta tmp7
        jmp _unefonctionDone
lbl_24:
        ; else:
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_26: skip:.):
            ; r0 = 1
            lda tmp7: ora #BIT_0: sta tmp7
          jmp _unefonctionDone
lbl_26:
          ; else:
            ; r1 = 1
            lda tmp7: ora #BIT_1: sta tmp7
    jmp _unefonctionDone
  jmp _unefonctionDone
