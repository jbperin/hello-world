


#include "config.h"
#include "glOric.h"


.text


 // Camera Position
_CamPosX:		.dsb 2
_CamPosY:		.dsb 2
_CamPosZ:		.dsb 2

 // Camera Orientation
_CamRotZ:		.dsb 1			// -128 -> -127 unit : 2PI/(2^8 - 1)
_CamRotX:		.dsb 1


//char points3d[NB_MAX_POINTS*SIZEOF_3DPOINT];
//unsigned char nbPoints=0;
_nbPoints       .dsb 1
_points3d       .dsb NB_MAX_POINTS*SIZEOF_3DPOINT

//char segments[NB_MAX_SEGMENTS*SIZEOF_SEGMENT];
//unsigned char nbSegments=0;
_nbSegments     .dsb 1
_segments       .dsb NB_MAX_SEGMENTS*SIZEOF_SEGMENT

//char points2d [NB_MAX_POINTS*SIZEOF_2DPOINT];
_points2d       .dsb NB_MAX_POINTS*SIZEOF_2DPOINT

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
_DeltaZ:		.dsb 2

_DeltaXSquare:	.dsb 4
_DeltaYSquare:	.dsb 4

_Norm:          .dsb 1
_AngleH:        .dsb 1
_AngleV:        .dsb 1


//_Quotient:		.dsb 2
//_Divisor:		.dsb 2
//_Remainder :	.dsb 2
//
AnglePH .dsb 1 ; horizontal angle of point from player pov
AnglePV .dsb 1 ; vertical angle of point from player pov


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
	lda _PointX+1
	sbc _CamPosX+1
	sta _DeltaX+1

	// DeltaY = CamPosY - PointY
	sec
	lda _PointY
	sbc _CamPosY
	sta _DeltaY
	lda _PointY+1
	sbc _CamPosY+1
	sta _DeltaY+1

    // AngleH = atan2 (DeltaY, DeltaX)
    lda _DeltaY
    sta _ty
    lda _DeltaX
    sta _tx
    jsr _atan2_8
    lda _res
    sta _AngleH
    
    // Norm = norm (DeltaX, DeltaY)
    jsr norm
    
   	// DeltaZ = CamPosZ - PointZ
	sec
	lda _PointZ
	sbc _CamPosZ
	sta _DeltaZ
	lda _PointZ+1
	sbc _CamPosZ+1
	sta _DeltaZ+1

    // AngleV = atan2 (DeltaZ, Norm)
    lda _DeltaZ
    sta _ty
    lda _Norm
    sta _tx
    jsr _atan2_8
    lda _res
    sta _AngleV
    
    // AnglePH = AngleH - CamRotZ
    sec
    lda _AngleH
    sbc _CamRotZ
    sta AnglePH
    
    // AnglePV = AngleV - CamRotX
    sec
    lda _AngleV
    sbc _CamRotX
    sta AnglePV

    
	// Quick Disgusting Hack 
	lda AnglePH
	eor #$FF
	sec
	adc #$00
	cmp #$80
	ror
	clc
    adc SCREEN_WIDTH/2
	sta _ResX
	
	lda AnglePV
	eor #$FF
	sec
	adc #$00
	cmp #$80
	ror
	clc
    adc SCREEN_HEIGHT/2
	sta _ResY

    
//  ; http://nparker.llx.com/a2/mult.html
//	// Quotient, Remainder = Quotient / Divisor
//	lda #0      ;Initialize _Remainder to 0
//	sta _Remainder
//	sta _Remainder+1
//	ldx #16     ;There are 16 bits in _Quotient
//L1  asl _Quotient    ;Shift hi bit of _Quotient into _Remainder
//	rol _Quotient+1  ;(vacating the lo bit, which will be used for the quotient)
//	rol _Remainder
//	rol _Remainder+1
//	lda _Remainder
//	sec         ;Trial subtraction
//	sbc _Divisor
//	tay
//	lda _Remainder+1
//	sbc _Divisor+1
//	bcc L2      ;Did subtraction succeed?
//	sta _Remainder+1   ;If yes, save it
//	sty _Remainder
//	inc _Quotient    ;and record a 1 in the quotient
//L2  dex
//	bne L1

	// retreive context
	pla:tay:pla:tax:pla
prodone:    
.)
	rts
