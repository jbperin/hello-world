  ; if (a3 == 0):
  lda tmp0 : and #BIT_3: .(:beq skip: jmp lbl_1: skip:.):
    ; if (a4 == 0):
    lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_2: skip:.):
      ; if (a2 == 0):
      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_3: skip:.):
        ; if (a1 == 0):
        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_4: skip:.):
        jmp _unefonctionDone
lbl_4:
        ; else:
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_6: skip:.):
          jmp _unefonctionDone
lbl_6:
          ; else:
      jmp _unefonctionDone
lbl_3:
      ; else:
        ; if (a1 == 0):
        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_9: skip:.):
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_10: skip:.):
          jmp _unefonctionDone
lbl_10:
        jmp _unefonctionDone
lbl_9:
        ; else:
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_12: skip:.):
          jmp _unefonctionDone
lbl_12:
          ; else:
    jmp _unefonctionDone
lbl_2:
    ; else:
      ; if (a2 == 0):
      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_15: skip:.):
        ; if (a1 == 0):
        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_16: skip:.):
        jmp _unefonctionDone
lbl_16:
      jmp _unefonctionDone
lbl_15:
      ; else:
        ; if (a1 == 0):
        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_18: skip:.):
        jmp _unefonctionDone
lbl_18:
  jmp _unefonctionDone
lbl_1:
  ; else:
    ; if (a4 == 0):
    lda tmp0 : and #BIT_4: .(:beq skip: jmp lbl_20: skip:.):
      ; if (a2 == 0):
      lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_21: skip:.):
        ; if (a1 == 0):
        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_22: skip:.):
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_23: skip:.):
          jmp _unefonctionDone
lbl_23:
          ; else:
        jmp _unefonctionDone
lbl_22:
        ; else:
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_26: skip:.):
          jmp _unefonctionDone
lbl_26:
          ; else:
      jmp _unefonctionDone
lbl_21:
      ; else:
        ; if (a1 == 0):
        lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_29: skip:.):
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_30: skip:.):
          jmp _unefonctionDone
lbl_30:
          ; else:
        jmp _unefonctionDone
lbl_29:
        ; else:
          ; if (a0 == 0):
          lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_33: skip:.):
          jmp _unefonctionDone
lbl_33:
    jmp _unefonctionDone
lbl_20:
    ; else:
      ; if (a1 == 0):
      lda tmp0 : and #BIT_1: .(:beq skip: jmp lbl_35: skip:.):
        ; if (a0 == 0):
        lda tmp0 : and #BIT_0: .(:beq skip: jmp lbl_36: skip:.):
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_37: skip:.):
          jmp _unefonctionDone
lbl_37:
        jmp _unefonctionDone
lbl_36:
        ; else:
          ; if (a2 == 0):
          lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_39: skip:.):
          jmp _unefonctionDone
lbl_39:
      jmp _unefonctionDone
lbl_35:
      ; else:
        ; if (a2 == 0):
        lda tmp0 : and #BIT_2: .(:beq skip: jmp lbl_41: skip:.):
        jmp _unefonctionDone
lbl_41:
