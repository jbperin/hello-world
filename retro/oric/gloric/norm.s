

; _DeltaX:		.dsb 2
; _DeltaY:		.dsb 2

; _DeltaXSquare:	.dsb 4
; _DeltaYSquare:	.dsb 4

; _Norm:          .dsb 1

; _Numberl  .byte $FF            ; number to square low byte
; _Numberh  .byte $FF ; number to square high byte

; _Squarel             ; square low byte
; _Squareh	= _Squarel+1 ; square high byte

Tmp .dsb 2

norm:
.(

    ; DeltaXSquare = DeltaX * DeltaX
    lda _DeltaX
    sta _Numberl
    lda _DeltaX+1
    sta _Numberh
    
    jsr _Square8
    
    lda _Squarel
    sta _DeltaXSquare
    lda _Squareh
    sta _DeltaXSquare+1
    
    ; DeltaYSquare = DeltaY * DeltaY
    lda _DeltaY
    sta _Numberl
    lda _DeltaY+1
    sta _Numberh
    
    jsr _Square8
    
    lda _Squarel
    sta _DeltaYSquare
    lda _Squareh
    sta _DeltaYSquare+1
   
    ; Tmp = _DeltaXSquare + _DeltaYSquare
    clc				        ; clear carry
	lda _DeltaXSquare
	adc _DeltaYSquare
	sta Tmp			        ; store sum of LSBs
	lda _DeltaXSquare+1
	adc _DeltaYSquare+1		; add the MSBs using carry from
	sta Tmp+1			    ; the previous calculation

    ; Norm = SQRT (Tmp)
    lda Tmp
    sta NUM
    lda Tmp+1
    sta NUM+1
    jsr _sqrt_16
    lda ROOT
    sta _Norm
    
.)
  rts
