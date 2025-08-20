  lda tmp0: and #BIT_1+BIT_3+BIT_5+BIT_0+BIT_7+BIT_4+BIT_6+BIT_2: .(:beq skip: jmp lbl_1: skip:.)
  lda tmp0+1: and #BIT_15+BIT_10+BIT_13+BIT_8+BIT_12+BIT_9+BIT_11+BIT_14: cmp #BIT_9: .(:beq skip: jmp lbl_1: skip:.)
  lda tmp1: and #BIT_16+BIT_17: cmp #BIT_16: .(:beq skip: jmp lbl_1: skip:.)
                                      ; r6 = 1, r4 = 1
                                      lda tmp7: ora #BIT_6+BIT_4: sta tmp7
lbl_1:
