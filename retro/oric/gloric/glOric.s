
 // Camera Position
_CamPosX:		.word $1234
_CamPosY:		.word $0000
_CamPosZ:		.word $0000

 // Camera Orientation
_CamRotZ:		.byt 0			// -128 -> -127 unit : 2PI/(2^8 - 1)
_CamRotX:		.byt 0

 // Point 3D Coordinates  
_PointX:		.word $0000
_PointY:		.word $0000
_PointZ:		.word $0000

 // Point 2D Projected Coordinates 
_ResX:			.byt 0			// -128 -> -127
_ResY:			.byt 0			// -128 -> -127


_project:
.(
	lda #56
	sta _CamPosX
.)
	rts

; 16 bits multiplication by 8 bits multiplier 
; from https://github.com/oric-software/CBM-Editor/blob/master/Generic.s
;
;
;
; Exemple d usage: Result(16 b) = Operand (16 b) * Multiplier(8b)
;	lda Multiplier
;	ldx OperandLo
;	ldy #00 ; OperandHi
;	jsr Mult16Bit
;	stx ResultLo
;	sty ResultHi

;Input
;   A multiplier
;   X Value Low
;   Y Value High
;Output
;   X Value Low
;   Y Value High
;Corrupts
;   AXY


Mult16Bit:
.(

	stx vector1+1
	sty vector2+1
	ldx #00
	stx vector3+1
	stx vector4+1
	
	tax
	beq skip1
	clc
	
vector3:	lda #00
vector1:	adc #00
	sta vector3+1
vector4:	lda #00
vector2:	adc #00
	sta vector4+1
	
	dex
	bne vector3
	
skip1:	ldx vector3+1
	ldy vector4+1
.)
	rts
