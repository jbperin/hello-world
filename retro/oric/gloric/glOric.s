; http://nparker.llx.com/a2/mult.html



_project:
.(
	// save context
    pha:txa:pha:tya:pha

	// DeltaX = CamPosX - PointX
	// Divisor = DeltaX
	sec
	lda _PointX
	sbc _CamPosX
	sta _DeltaX
	sta _Divisor
	lda _PointX+1
	sbc _CamPosX+1
	sta _DeltaX+1
	sta _Divisor+1

	// DeltaY = CamPosY - PointY
	// Quotient = DeltaY
	sec
	lda _PointY
	sbc _CamPosY
	sta _DeltaY
	sta _Quotient
	lda _PointY+1
	sbc _CamPosY+1
	sta _DeltaY+1
	sta _Quotient+1

	// Quotient, Remainder = Quotient / Divisor
	lda #0      ;Initialize _Remainder to 0
	sta _Remainder
	sta _Remainder+1
	ldx #16     ;There are 16 bits in _Quotient
L1  asl _Quotient    ;Shift hi bit of _Quotient into _Remainder
	rol _Quotient+1  ;(vacating the lo bit, which will be used for the quotient)
	rol _Remainder
	rol _Remainder+1
	lda _Remainder
	sec         ;Trial subtraction
	sbc _Divisor
	tay
	lda _Remainder+1
	sbc _Divisor+1
	bcc L2      ;Did subtraction succeed?
	sta _Remainder+1   ;If yes, save it
	sty _Remainder
	inc _Quotient    ;and record a 1 in the quotient
L2  dex
	bne L1

	// retreive context
	pla:tay:pla:tax:pla
.)
	rts
;https://codebase64.org/doku.php?id=base:16bit_and_24bit_sqrt	
;-----------------------------------
;   Square Root of a 24bit number
;-----------------------------------
; by Verz - Jul2019
;-----------------------------------
;
;  load the 24bit input in square
;  16bit result in  sqrt & remainder
;-----------------------------------

_square    .byt 0,0,0     ; input number
storage   .byt 0,0,0     ; temporary data
_thesqrt      .byt 0,0       ; result
remainder .byt 0,0       ; result remainder

_sqrt24
        LDY #$01        ; lsby of first odd number = 1
        STY storage
        DEY
        STY storage+1   ; msby of first odd number (_thesqrt = 0)
        sty storage+2
        sty _thesqrt
        sty _thesqrt+1
again
        SEC
        LDA _square     ; save remainder
        sta remainder
        SBC storage    ; subtract odd lo from integer lo
        STA _square
        LDA _square+1
        sta remainder+1
        SBC storage+1   ; subtract odd mid from integer mid
        STA _square+1
        lda _square+2
        sbc storage+2   ; subtract odd hi from integer hi
        sta _square+2
        BCC nomore    ; is subtract result negative?
        INC _thesqrt      ; no. increment _square root
        bne sqnxt
        inc _thesqrt+1
sqnxt   LDA storage     ; calculate next odd number
        ADC #$01        ; +1+C(=1)
        STA storage
        BCC again
        lda storage+1
        adc #$00
        sta storage+1
        bcc again
        INC storage+2
        JMP again
nomore
        RTS

 // Camera Position
_CamPosX:		.dsb 2
_CamPosY:		.dsb 2
_CamPosZ:		.dsb 2

 // Camera Orientation
_CamRotZ:		.dsb 1			// -128 -> -127 unit : 2PI/(2^8 - 1)
_CamRotX:		.dsb 1

 // Point 3D Coordinates
_PointX:		.dsb 2
_PointY:		.dsb 2
_PointZ:		.dsb 2

 // Point 2D Projected Coordinates
_ResX:			.dsb 1			// -128 -> -127
_ResY:			.dsb 1			// -128 -> -127

 // Intermediary Computation
_DeltaX:		.dsb 2
_DeltaY:		.dsb 2

_Quotient:		.dsb 2
_Divisor:		.dsb 2
_Remainder :	.dsb 2
