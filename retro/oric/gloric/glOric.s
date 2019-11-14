; http://nparker.llx.com/a2/mult.html

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

_DeltaXSquare:	.dsb 4
_DeltaYSquare:	.dsb 4

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

_sqrt24:
.(
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
.)
        RTS



; By Jean-Baptiste PERIN (jbperin)
; extension of routine by Lee Davison at http://www.6502.org/source/integers/square.htm
; Calculates the 32 bits unsigned integer square of the signed 16 bit integer in
; Numberl/Numberh.  The result is always in the range 0 to ‭4294836225‬ and is held in
; Square1/Square2/Square3/Square4
;
; Destroys all registers

_Numberl             ; number to square low byte
_Numberh	= _Numberl+1 ; number to square high byte
    .word $FFFF


_Square1  .byte $00 ; square low bytes
_Square2  .byte $00
_Square3  .byte $00 ; square high bytes
_Square4  .byte $00


TempForRoot1:                     ; temp byte for intermediate result
    .byte $00
TempForRoot2:
    .byte $00

Accu1:
    .byte $00
Accu2:
    .byte $00

_Square16:
.(
	////    S = 0
	LDA     #$00        ; clear A
	STA     _Square1     ; clear square low byte
						; (no need to clear the high byte, it gets shifted out)

	////   A = N
	LDA	_Numberl     ; get number low byte
	LDX	_Numberh     ; get number high  byte

	////    If  N<0
	BPL	NoNneg      ; if +ve don t negate it
                            ; else do a two s complement
	////		T = -N
	EOR	#$FF        ; invert
    SEC	            ; +1
	ADC	#$00        ; and add it
	STA TempForRoot1
	STA Accu1

	TXA				; A <- HiPart (Number)
	EOR	#$FF        ; invert
	ADC #$00		; Propagate carry
	STA TempForRoot2
	STA Accu2
	JMP startloop

	////    Else
NoNneg:
	////		T = N
	STA	TempForRoot1      ; save ABS(number)
	STA Accu1
	STX	TempForRoot2
	STX Accu2
	////    EndIf

startloop:

	////    For X = 16 -> 0
	LDX	#$10        ; 16 bits operands

Nextr2bit:
	//// 		S = S * 2
	ASL	_Square1     ; low byte *2
	ROL	_Square2     ; high byte *2+carry from low
	ROL	_Square3     ; propagate
	ROL	_Square4     ; propagate

	//// 		A = A * 2
	ASL	 Accu1          ; shift number byte
	ROL	 Accu2

	////    	If  Carry != 0
	BCC	NoSqadd     ; don t do add if C = 0
	TAY                 ; save A
	CLC                 ; clear carry for add
	////    		S = S + T
	LDA	TempForRoot1      ; get number
	ADC	_Square1     ; add number^2 low byte
	STA	_Square1     ; save number^2 low byte
	LDA	TempForRoot2
	ADC	_Square2     ; add number^2 high bytes
	STA	_Square2     ; save number^2 high bytes
	LDA #$00
	ADC	_Square3
	STA	_Square3
	LDA #$00
	ADC	_Square4
	STA	_Square4
	TYA                 ; get A back
	////    	EndIf

NoSqadd:
	////    Next X
	DEX                 ; decrement bit count
	BNE	Nextr2bit   ; go do next bit
.)
	RTS
