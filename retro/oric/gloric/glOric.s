

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

  ; http://nparker.llx.com/a2/mult.html
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



;http://www.6502.org/source/integers/ummodfix/ummodfix.htm
; +-----|-----+-----|-----+-----|-----+-----|------+
; |  DIVISOR  |    D I V I D E N D    |SCRAT|      |
; |           |  hi cell     lo cell  |CHPAD| CARRY|
; |  N    N+1 | N+2   N+3 | N+4   N+5 | N+6   N+7  |
; +-----|-----+-----|-----+-----|-----+-----|------+
; |           | REMAINDER | QUOTIENT  |            |
; +-----|-----+-----|-----+-----|-----+-----|------+
; Both divisor and dividend must be positive numbers
; We must have Dividend Hi Cell < Divisor
; If not, QUOTIENT=FF, REMAINDER=FF is returned
_N    .dsb 7
CARRY .dsb 1

_div32by16
.(
  START:  SEC             ; Detect overflow or /0 condition.
          LDA     _N+2     ; Divisor must be more than high cell of dividend.  To
          SBC     _N       ; find out, subtract divisor from high cell of dividend;
          LDA     _N+3     ; if carry flag is still set at the end, the divisor was
          SBC     _N+1     ; not big enough to avoid overflow. This also takes care
          BCS     oflo   ; of any /0 condition.  Branch if overflow or /0 error.
                          ; We will loop 16 times; but since we shift the dividend
          LDX     #$11    ; over at the same time as shifting the answer in, the
                          ; operation must start AND finish with a shift of the
                          ; low cell of the dividend (which ends up holding the
                          ; quotient), so we start with 17 (11H) in X.
loop:  ROL     _N+4     ; Move low cell of dividend left one bit, also shifting
          ROL     _N+5     ; answer in. The 1st rotation brings in a 0, which later
                          ; gets pushed off the other end in the last rotation.
          DEX
          BEQ     end    ; Branch to the end if finished.

          ROL     _N+2     ; Shift high cell of dividend left one bit, also
          ROL     _N+3     ; shifting next bit in from high bit of low cell.
          LDA #0
          STA CARRY
          ;STZ     CARRY   ; Zero old bits of CARRY so subtraction works right.
          ROL     CARRY   ; Store old high bit of dividend in CARRY.  (For STZ
                          ; one line up, NMOS 6502 will need LDA #0, STA CARRY.)
          SEC             ; See if divisor will fit into high 17 bits of dividend
          LDA     _N+2     ; by subtracting and then looking at carry flag.
          SBC     _N       ; First do low byte.
          STA     _N+6     ; Save difference low byte until we know if we need it.
          LDA     _N+3     ;
          SBC     _N+1     ; Then do high byte.
          TAY             ; Save difference high byte until we know if we need it.
          LDA     CARRY   ; Bit 0 of CARRY serves as 17th bit.
          SBC     #0      ; Complete the subtraction by doing the 17th bit before
          BCC     loop    ; determining if the divisor fit into the high 17 bits
                          ; of the dividend.  If so, the carry flag remains set.
          LDA     _N+6     ; If divisor fit into dividend high 17 bits, update
          STA     _N+2     ; dividend high cell to what it would be after
          STY     _N+3     ; subtraction.
          BCS     loop    ; Always branch.  NMOS 6502 could use BCS here.

oflo: LDA     #$FF    ; If overflow occurred, put FF
          STA     _N+2     ; in remainder low byte
          STA     _N+3     ; and high byte,
          STA     _N+4     ; and in quotient low byte
          STA     _N+5     ; and high byte.
end:
.)
	RTS

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


; By Jean-Baptiste PERIN (jbperin)
; calculate the atan of a Q0.5 value stored in 
; five least significant bits of _ArcTang
; The result is always in the range 0 to 2^5-1 and is held in
; _Angle
;
; Destroys all registers

_ArcTang .dsb 1
_Angle .dsb 1
_Index .dsb 1

_atan:
.(
    lda _ArcTang
    and #$1F        ; keep only 5 bits
    tax
    sta _Index
    lda atan_table, x
    sta _Angle 
.)
	RTS

atan_table:
    .byt 0
    .byt 1
    .byt 3
    .byt 4
    .byt 5
    .byt 6
    .byt 8
    .byt 9
    .byt 10
    .byt 11
    .byt 12
    .byt 13
    .byt 15
    .byt 16
    .byt 17
    .byt 18
    .byt 19
    .byt 20
    .byt 21
    .byt 22
    .byt 23
    .byt 24
    .byt 25
    .byt 25
    .byt 26
    .byt 27
    .byt 28
    .byt 29
    .byt 29
    .byt 30
    .byt 31
    .byt 31