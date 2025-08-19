  lda tmp0: and #BIT_7+BIT_1+BIT_0+BIT_4+BIT_2+BIT_6+BIT_3+BIT_5: cmp #BIT_1+BIT_0+BIT_2+BIT_3: .(:beq skip: jmp lbl_1: skip:.)
  lda tmp0+1: and #BIT_8+BIT_15+BIT_14+BIT_12+BIT_13+BIT_10+BIT_9+BIT_11: .(:beq skip: jmp lbl_1: skip:.)
                                  ; r0 = 1
                                  lda tmp7: ora #BIT_0: sta tmp7
lbl_1:
