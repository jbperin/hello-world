;---------------------------------------------------------------------------------
;Fast 3D projection routines by Jean-Baptiste PERIN
;---------------------------------------------------------------------------------


.include "config.inc"

.import popax
.import popa
.importzp ptr1, ptr2, ptr3, ptr4 ; 16 bits
.importzp tmp1, tmp2, tmp3, tmp4; 8 bits

;;    ___                                      
;;   / __\  __ _  _ __ ___    ___  _ __   __ _ 
;;  / /    / _` || '_ ` _ \  / _ \| '__| / _` |
;; / /___ | (_| || | | | | ||  __/| |   | (_| |
;; \____/  \__,_||_| |_| |_| \___||_|    \__,_|
                                            
.export _CamPosX, _CamPosY, _CamPosZ
.export _CamRotZ, _CamRotX
.segment    "DATA" 
;; Camera Position
_CamPosX:		.word 0
_CamPosY:		.word 0
_CamPosZ:		.word 0

;; Camera Orientation
_CamRotZ:		.byte 0			
_CamRotX:		.byte 0


;;  __                            
;; / _\     ___   ___  _ __    ___
;; \ \     / __| / _ \| '_ \  / _ \
;; _\ \   | (__ |  __/| | | ||  __/
;; \__/    \___| \___||_| |_| \___|


.export _nbSegments, _nbParticules, _nbFaces
.export _segmentsPt1, _segmentsPt2, _segmentsChar
.export _particulesPt, _particulesChar
.export _facesPt1, _facesPt2, _facesPt3, _facesChar


_nbSegments:         .res 1
_nbParticules:       .res 1
_nbFaces:            .res 1

_segmentsPt1:        .res NB_MAX_SEGMENTS
_segmentsPt2:        .res NB_MAX_SEGMENTS
_segmentsChar:       .res NB_MAX_SEGMENTS

_particulesPt:       .res NB_MAX_PARTICULES
_particulesChar:     .res NB_MAX_PARTICULES

_facesPt1:           .res NB_MAX_FACES
_facesPt2:           .res NB_MAX_FACES
_facesPt3:           .res NB_MAX_FACES
_facesChar:          .res NB_MAX_FACES

;;    ___                 _              _    _               
;;   / _ \ _ __   ___    (_)  ___   ___ | |_ (_)  ___   _ __  
;;  / /_)/| '__| / _ \   | | / _ \ / __|| __|| | / _ \ | '_ \ 
;; / ___/ | |   | (_) |  | ||  __/| (__ | |_ | || (_) || | | |
;; \/     |_|    \___/  _/ | \___| \___| \__||_| \___/ |_| |_|
;;                     |__/                                   

.export _projOptions, _nbPoints
.export _points3dX, _points3dY, _points3dZ, _points2aH, _points2aV, _points2dH, _points2dL


_projOptions:        .res 1
_nbPoints:           .res 1

_points3dX:          .res NB_MAX_POINTS
_points3dY:          .res NB_MAX_POINTS
_points3dZ:          .res NB_MAX_POINTS

_points2aH:          .res NB_MAX_POINTS
_points2aV:          .res NB_MAX_POINTS
_points2dH:          .res NB_MAX_POINTS
_points2dL:          .res NB_MAX_POINTS


.export _PointX, _PointY, _PointZ


;; Point 3D Coordinates
_PointX:		.word 0
_PointY:		.word 0
_PointZ:		.word 0

.export _ResX, _ResY


;; Point 2D Projected Coordinates
_ResX:			.word 0	
_ResY:			.word 0


;; Intermediary Computation
_DeltaX:		.word 0
_DeltaY:		.word 0
_DeltaZ:		.word 0

_Norm:          .word 0
_AngleH:        .byte 0
_AngleV:        .byte 0

AnglePH: .byte 0 ; horizontal angle of point from player pov
AnglePV: .byte 0 ; vertical angle of point from player pov
HAngleOverflow: .byte 0 
VAngleOverflow: .byte 0 

.export _isFace2BeDrawn;
_isFace2BeDrawn:  .byte 0

.export _idxPt1, _idxPt2, _idxPt3
_idxPt1:         .byte 0
_idxPt2:         .byte 0
_idxPt3:         .byte 0

.export _P1X, _P1Y, _P2X, _P2Y, _P3X, _P3Y

_P1X: .byte 0
_P1Y: .byte 0
_P2X: .byte 0
_P2Y: .byte 0
_P3X: .byte 0
_P3Y: .byte 0

.export _P1AH, _P1AV, _P2AH, _P2AV, _P3AH, _P3AV
_P1AH: .byte 0
_P1AV: .byte 0
_P2AH: .byte 0
_P2AV: .byte 0
_P3AH: .byte 0
_P3AV: .byte 0

.export _dmoy, _distseg, _distface, _distpoint, _ch2disp
_dmoy:         .word 0

_distface: .byte 0
_distseg: .byte 0
_distpoint: .byte 0
_ch2disp: .byte 0

.export _pDepX , _pDepY, _pArr1X, _pArr1Y, _pArr2X, _pArr2Y

_pDepX:  .byte 0
_pDepY:  .byte 0
_pArr1X: .byte 0
_pArr1Y: .byte 0
_pArr2X: .byte 0
_pArr2Y: .byte 0

.export _mDeltaY1, _mDeltaX1, _mDeltaY2, _mDeltaX2

_mDeltaY1: .byte 0
_mDeltaX1: .byte 0
_mDeltaY2: .byte 0
_mDeltaX2: .byte 0

.export _m1, _m2, _m3, _v1, _v2, _v3
; unsigned char m1, m2, m3;
_m1:         .byte 0
_m2:         .byte 0
_m3:         .byte 0
; unsigned char v1, v2, v3;
_v1:         .byte 0
_v2:         .byte 0
_v3:         .byte 0

.export _A1XSatur, _A2XSatur
_A1XSatur: .byte 0
_A2XSatur: .byte 0

.export _A1X, _A1Y, _A1destX, _A1destY, _A1dX, _A1dY, _A1err, _A1sX, _A1sY, _A1arrived
.export _A2X, _A2Y, _A2destX, _A2destY, _A2dX, _A2dY, _A2err, _A2sX, _A2sY, _A2arrived

_A1X: 	.byte 0
_A1Y: 	.byte 0
_A1destX: .byte 0
_A1destY: .byte 0
_A1dX: .byte 0
_A1dY: .byte 0
_A1err: .byte 0
_A1sX: .byte 0
_A1sY: .byte 0
_A1arrived: .byte 0
_A2X: .byte 0
_A2Y: .byte 0
_A2destX: .byte 0
_A2destY: .byte 0
_A2dX: .byte 0
_A2dY: .byte 0
_A2err: .byte 0
_A2sX: .byte 0
_A2sY: .byte 0
_A2arrived: .byte 0

.export _A1Right, _lineIndex, _departX, _finX, _hLineLength

_A1Right: .byte 0

_lineIndex:   .byte 0
_departX:     .byte 0
_finX:        .byte 0
_hLineLength: .byte 0

ptrpt3 		:= ptr3
ptrpt2 		:= ptr2
;;nbPoints 	:= tmp1
;;opts 		:= tmp1
_res		:= tmp2
_tx		:= tmp3
_ty		:= tmp4


.segment "CODE"

;---------------------------------------------------------------------------------
;void glProject (char *tabpoint2D, char *tabpoint3D, unsigned char nbPoints, unsigned char opts);
;---------------------------------------------------------------------------------

.export _glProject

.proc _glProject
	;;sta tmp1		;opts
	jsr popa
	sta _nbPoints		;nbPoints
	jsr popax		;get tabpoint3D
	sta ptrpt3
	stx ptrpt3+1
	jsr popax		;get tabpoint2D
	sta ptrpt2
	stx ptrpt2+1

    ldx _nbPoints		;nbPoints
    dex
    txa ; ii = nbPoints - 1
    asl
    asl ; ii * SIZEOF_3DPOINT (4)
    clc
    adc #$03
    tay
    
    ldx _nbPoints		;nbPoints
    dex
    txa ; ii = nbPoints - 1
    asl
    asl ; ii * SIZEOF_2DPOINT (4)
    clc
    adc #$03
    tax
    
dofastprojloop:
;;          Status = points3d[ii*SIZEOF_3DPOINT + 3]
        dey
;;  		PointZ = points3d[ii*SIZEOF_3DPOINT + 2];
        lda (ptrpt3),y
        sta _PointZ
        dey
;;  		PointY = points3d[ii*SIZEOF_3DPOINT + 1];
        lda (ptrpt3),y
        sta _PointY
        dey
;;  		PointX = points3d[ii*SIZEOF_3DPOINT + 0];
        lda (ptrpt3),y
        sta _PointX
        dey

;;  		project();
        jsr _project
        
        tya
        pha
        txa
        tay
;; #ifdef TEXTDEMO  
.IFDEF TEXTDEMO    
;;  		points2d[ii*SIZEOF_2DPOINT + 1] = ResY;
        
        lda _Norm+1
        sta (ptrpt2), y
        dey 

        lda _Norm
        sta (ptrpt2), y
        dey

        lda _ResY
        sta (ptrpt2), y
;;  		points2d[ii*SIZEOF_2DPOINT + 0] = ResX;
        dey
        lda _ResX
        sta (ptrpt2), y

;; #else
.ELSE
        lda _ResY+1
        sta (ptrpt2), y
        dey 

        lda _ResY
        sta (ptrpt2), y
        dey

        lda _ResX+1
        sta (ptrpt2), y
        dey

        lda _ResX
        sta (ptrpt2), y
.ENDIF

        tya
        tax
        pla
		tay
;;;;  	}
    dex
    txa
    cmp #$FF
    bne dofastprojloop 
dofastprojdone:
	
	
    rts
.endproc

.export _glProjectArrays

.proc _glProjectArrays

    ;; for (ii = 0; ii < nbPoints; ii++){
	ldy		_nbPoints
glProjectArrays_loop:
	dey
	bmi		glProjectArrays_done
		;;     x = points3dX[ii];
		lda 	_points3dX, y
		sta		_PointX
		;;     y = points3dY[ii];
		lda 	_points3dY, y
		sta		_PointY
		;;     z = points3dZ[ii];
		lda 	_points3dZ, y
		sta		_PointZ

    ;;     projectPoint(x, y, z, options, &ah, &av, &dist);
		jsr 	_project 

    ;;     points2aH[ii] = ah;
		lda 	_ResX
		sta		_points2aH, y
    ;;     points2aV[ii] = av;
		lda 	_ResY
		sta		_points2aV, y
    ;;     points2dH[ii] = (signed char)((dist & 0xFF00)>>8) && 0x00FF;
		lda		_Norm+1
		sta		_points2dH, y
    ;;     points2dL[ii] = (signed char) (dist & 0x00FF);
		lda		_Norm
		sta		_points2dL, y

    ;; }
	jmp glProjectArrays_loop
glProjectArrays_done:

	rts
.endproc




;---------------------------------------------------------------------------------
;_project
;---------------------------------------------------------------------------------
.export _project
.proc _project
	;; save context
    pha
	txa
	pha
	tya
	pha

    lda #0
    sta HAngleOverflow
    sta VAngleOverflow

	;; DeltaX = CamPosX - PointX
	;; Divisor = DeltaX
	sec
	lda _PointX
	sbc _CamPosX
	sta _DeltaX
	sta _tx
	;; FOR 16 bits Coords
	;; lda _PointX+1
	;; sbc _CamPosX+1
	;; sta _DeltaX+1

	;; DeltaY = CamPosY - PointY
	sec
	lda _PointY
	sbc _CamPosY
	sta _DeltaY
	sta _ty
	;; FOR 16 bits Coords
	;; lda _PointY+1
	;; sbc _CamPosY+1
	;; sta _DeltaY+1

    ;; AngleH = atan2 (DeltaY, DeltaX)
    ;;lda _DeltaY
    ;;sta _ty
    ;;lda _DeltaX
    ;;sta _tx
    jsr _atan2_8
    lda _res
    sta _AngleH

    ;; Norm = norm (DeltaX, DeltaY)
    jsr _norm_8

   	;; DeltaZ = CamPosZ - PointZ
	sec
	lda _PointZ
	sbc _CamPosZ
	sta _DeltaZ
	;; FOR 16 bits Coords
	;; lda _PointZ+1
	;; sbc _CamPosZ+1
	;; sta _DeltaZ+1

    ;; AngleV = atan2 (DeltaZ, Norm)
    lda _DeltaZ
    sta _ty
    lda _Norm
    sta _tx
    jsr _atan2_8
    lda _res
    sta _AngleV

    ;; AnglePH = AngleH - CamRotZ
    sec
    lda _AngleH
    sbc _CamRotZ
    sta AnglePH
    bvc project_noHAngleOverflow
    lda #$80
    sta HAngleOverflow

project_noHAngleOverflow:
    ;; AnglePV = AngleV - CamRotX
    sec
    lda _AngleV
    sbc _CamRotX
    sta AnglePV
    bvc project_noVAngleOverflow
    lda #$80
    sta VAngleOverflow

project_noVAngleOverflow:   

	lda AnglePH
	sta _ResX
	lda AnglePV
	sta _ResY
	
	;; restore context
	pla
	tay
	pla
	tax
	pla
    rts
.endproc

;---------------------------------------------------------------------------------
;_norm
;---------------------------------------------------------------------------------
.segment    "DATA"

absX: .byt 0
absY: .byt 0
tmpufnX: .byt 0
tmpufnY: .byt 0

.segment    "CODE"

.proc _norm_8


;;  IF DX == 0 THEN
    lda _DeltaX
	bne dxNotNull
;;    IF DY > 0 THEN
		lda _DeltaY
		bmi dyNegativ_01
;;      RETURN DY
		sta _Norm
		jmp hfndone
dyNegativ_01:
;;    ELSE
;;      RETURN -DY
		eor #$FF
		sec
		adc #$00
		sta _Norm
		jmp hfndone
dxNotNull:
;;  ELSE IF DX > 0 THEN
	bmi dxNegativ_01
;;    AX = DX
		sta absX
		jmp computeAbsY
dxNegativ_01:
;;  ELSE (DX < 0)
;;    AX = -DX
		eor #$FF
		sec
		adc #$00
		sta absX
;;  ENDIF
computeAbsY:
;;  IF DY == 0 THEN
	lda _DeltaY
	bne dyNotNull
;;    RETURN AX
		lda absX
		sta _Norm
		jmp hfndone
dyNotNull:
;;  ELSE IF DY > 0 THEN
	bmi dyNegativ_02
;;    AY = DY
		sta absY
		jmp sortAbsVal
dyNegativ_02:
;;  ELSE (DY < 0)
		eor #$FF
		sec
		adc #$00
		sta absY
;;    AY = -DY
;;  ENDIF
sortAbsVal:
;;  IF AX > AY THEN
	cmp absX
	bcs ayOverOrEqualAx
;;    TY = AY
		tay
		sta tmpufnY
;;    TX = AX
		lda absX
		tax
		sta tmpufnX
		jmp approxim
ayOverOrEqualAx:
;;  ELSE
;;    TX = AY
		tax
		sta tmpufnX
;;    TY = AX
		lda absX
		tay
		sta tmpufnY
;;  END
approxim:
;;  IF TY > TX/2 THEN
	lda tmpufnX
	lsr 
	cmp tmpufnY
	bcc tyLowerOrEqualTxDiv2
	beq tyLowerOrEqualTxDiv2	
;;    RETURN TAB_A[TX] + TAB_B[TY]
		lda tabmult_A,X
		clc
		adc tabmult_B,Y
		sta _Norm
		lda #$00
		adc #$00 ; propagate carry
		sta _Norm+1
		jmp hfndone
tyLowerOrEqualTxDiv2:
;;  ELSE (TX/2 <= TY)
;;    RETURN TAB_C[TX] + TAB_D[TY]
		lda tabmult_C,X
		clc
		adc tabmult_D,Y
		sta _Norm
		lda #$00
		adc #$00 ; propagate carry
		sta _Norm+1
;;  END IF 	
	
hfndone:

    rts
.endproc

.segment    "DATA"

octant: .res 1
.segment    "CODE"
;---------------------------------------------------------------------------------
;_atan2 https://codebase64.org/doku.php?id=base:8bit_atan2_8-bit_angle
;---------------------------------------------------------------------------------

.proc _atan2_8
    lda _tx
    clc
    bpl Xpositiv
    eor #$ff
    sec
Xpositiv:
    tax
    rol octant

    lda _ty
    clc
    bpl Ypositiv
    eor #$ff
    sec
Ypositiv:
    tay
    rol octant

    sec
    lda _log2_tab,x
    sbc _log2_tab,y
    bcc *+4
    eor #$ff
    tax

    lda octant
    rol
    and #$07
    tay

    lda atan_tab, x
    eor octant_adjust,y
    sta _res

    rts
.endproc

;---------------------------------------------------------------------------------
;une fonction
;---------------------------------------------------------------------------------

.export _une_fonction
 
.proc _une_fonction
	lda #SCREEN_WIDTH
    rts
.endproc

.export		_fbuffer
.export		_zbuffer

.segment	"DATA"

_fbuffer:
	.res	1040,$00
_zbuffer:
	.res	1040,$00

octant_adjust:	.byt %00111111		;; x+,y+,|x|>|y|
		.byt %00000000		;; x+,y+,|x|<|y|
		.byt %11000000		;; x+,y-,|x|>|y|
		.byt %11111111		;; x+,y-,|x|<|y|
		.byt %01000000		;; x-,y+,|x|>|y|
		.byt %01111111		;; x-,y+,|x|<|y|
		.byt %10111111		;; x-,y-,|x|>|y|
		.byt %10000000		;; x-,y-,|x|<|y|


		;;;;;;;; atan(2^(x/32))*128/pi ;;;;;;;;

atan_tab:	.byt $00,$00,$00,$00,$00,$00,$00,$00
		.byt $00,$00,$00,$00,$00,$00,$00,$00
		.byt $00,$00,$00,$00,$00,$00,$00,$00
		.byt $00,$00,$00,$00,$00,$00,$00,$00
		.byt $00,$00,$00,$00,$00,$00,$00,$00
		.byt $00,$00,$00,$00,$00,$00,$00,$00
		.byt $00,$00,$00,$00,$00,$00,$00,$00
		.byt $00,$00,$00,$00,$00,$00,$00,$00
		.byt $00,$00,$00,$00,$00,$00,$00,$00
		.byt $00,$00,$00,$00,$00,$00,$00,$00
		.byt $00,$00,$00,$00,$00,$01,$01,$01
		.byt $01,$01,$01,$01,$01,$01,$01,$01
		.byt $01,$01,$01,$01,$01,$01,$01,$01
		.byt $01,$01,$01,$01,$01,$01,$01,$01
		.byt $01,$01,$01,$01,$01,$02,$02,$02
		.byt $02,$02,$02,$02,$02,$02,$02,$02
		.byt $02,$02,$02,$02,$02,$02,$02,$02
		.byt $03,$03,$03,$03,$03,$03,$03,$03
		.byt $03,$03,$03,$03,$03,$04,$04,$04
		.byt $04,$04,$04,$04,$04,$04,$04,$04
		.byt $05,$05,$05,$05,$05,$05,$05,$05
		.byt $06,$06,$06,$06,$06,$06,$06,$06
		.byt $07,$07,$07,$07,$07,$07,$08,$08
		.byt $08,$08,$08,$08,$09,$09,$09,$09
		.byt $09,$0a,$0a,$0a,$0a,$0b,$0b,$0b
		.byt $0b,$0c,$0c,$0c,$0c,$0d,$0d,$0d
		.byt $0d,$0e,$0e,$0e,$0e,$0f,$0f,$0f
		.byt $10,$10,$10,$11,$11,$11,$12,$12
		.byt $12,$13,$13,$13,$14,$14,$15,$15
		.byt $15,$16,$16,$17,$17,$17,$18,$18
		.byt $19,$19,$19,$1a,$1a,$1b,$1b,$1c
		.byt $1c,$1c,$1d,$1d,$1e,$1e,$1f,$1f


		;;;;;;;; log2(x)*32 ;;;;;;;;
.export _log2_tab
_log2_tab:	.byt $00,$00,$20,$32,$40,$4a,$52,$59
		.byt $60,$65,$6a,$6e,$72,$76,$79,$7d
		.byt $80,$82,$85,$87,$8a,$8c,$8e,$90
		.byt $92,$94,$96,$98,$99,$9b,$9d,$9e
		.byt $a0,$a1,$a2,$a4,$a5,$a6,$a7,$a9
		.byt $aa,$ab,$ac,$ad,$ae,$af,$b0,$b1
		.byt $b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9
		.byt $b9,$ba,$bb,$bc,$bd,$bd,$be,$bf
		.byt $c0,$c0,$c1,$c2,$c2,$c3,$c4,$c4
		.byt $c5,$c6,$c6,$c7,$c7,$c8,$c9,$c9
		.byt $ca,$ca,$cb,$cc,$cc,$cd,$cd,$ce
		.byt $ce,$cf,$cf,$d0,$d0,$d1,$d1,$d2
		.byt $d2,$d3,$d3,$d4,$d4,$d5,$d5,$d5
		.byt $d6,$d6,$d7,$d7,$d8,$d8,$d9,$d9
		.byt $d9,$da,$da,$db,$db,$db,$dc,$dc
		.byt $dd,$dd,$dd,$de,$de,$de,$df,$df
		.byt $df,$e0,$e0,$e1,$e1,$e1,$e2,$e2
		.byt $e2,$e3,$e3,$e3,$e4,$e4,$e4,$e5
		.byt $e5,$e5,$e6,$e6,$e6,$e7,$e7,$e7
		.byt $e7,$e8,$e8,$e8,$e9,$e9,$e9,$ea
		.byt $ea,$ea,$ea,$eb,$eb,$eb,$ec,$ec
		.byt $ec,$ec,$ed,$ed,$ed,$ed,$ee,$ee
		.byt $ee,$ee,$ef,$ef,$ef,$ef,$f0,$f0
		.byt $f0,$f1,$f1,$f1,$f1,$f1,$f2,$f2
		.byt $f2,$f2,$f3,$f3,$f3,$f3,$f4,$f4
		.byt $f4,$f4,$f5,$f5,$f5,$f5,$f5,$f6
		.byt $f6,$f6,$f6,$f7,$f7,$f7,$f7,$f7
		.byt $f8,$f8,$f8,$f8,$f9,$f9,$f9,$f9
		.byt $f9,$fa,$fa,$fa,$fa,$fa,$fb,$fb
		.byt $fb,$fb,$fb,$fc,$fc,$fc,$fc,$fc
		.byt $fd,$fd,$fd,$fd,$fd,$fd,$fe,$fe
		.byt $fe,$fe,$fe,$ff,$ff,$ff,$ff,$ff

		
		
tabmult_A:
	.byt 0, 1, 2, 3, 4, 5, 6, 7
	.byt 8, 9, 10, 11, 12, 13, 14, 15
	.byt 16, 17, 18, 19, 20, 21, 22, 23
	.byt 24, 25, 26, 27, 28, 29, 30, 31
	.byt 32, 33, 34, 35, 36, 37, 38, 39
	.byt 40, 41, 42, 43, 44, 45, 46, 47
	.byt 48, 49, 50, 51, 52, 53, 54, 55
	.byt 56, 57, 58, 59, 60, 61, 62, 63
	.byt 64, 65, 66, 67, 68, 69, 70, 71
	.byt 72, 73, 74, 75, 76, 77, 78, 79
	.byt 80, 81, 82, 83, 84, 85, 86, 87
	.byt 88, 89, 90, 90, 91, 92, 93, 94
	.byt 95, 96, 97, 98, 99, 100, 101, 102
	.byt 103, 104, 105, 106, 107, 108, 109, 110
	.byt 111, 112, 113, 114, 115, 116, 117, 118
	.byt 119, 119, 120, 121, 122, 123, 124, 125
tabmult_B:
	.byt 0, 0, 0, 0, 0, 1, 1, 1
	.byt 1, 1, 1, 1, 2, 2, 2, 2
	.byt 2, 3, 3, 3, 3, 3, 4, 4
	.byt 4, 4, 4, 5, 5, 5, 6, 6
	.byt 6, 6, 7, 7, 7, 7, 8, 8
	.byt 8, 9, 9, 9, 10, 10, 10, 11
	.byt 11, 11, 12, 12, 13, 13, 13, 14
	.byt 14, 15, 15, 15, 16, 16, 17, 17
	.byt 18, 18, 18, 19, 19, 20, 20, 21
	.byt 21, 22, 22, 23, 23, 24, 24, 25
	.byt 25, 26, 26, 27, 27, 28, 29, 29
	.byt 30, 30, 31, 31, 32, 33, 33, 34
	.byt 34, 35, 36, 36, 37, 38, 38, 39
	.byt 39, 40, 41, 41, 42, 43, 44, 44
	.byt 45, 46, 46, 47, 48, 48, 49, 50
	.byt 51, 51, 52, 53, 54, 54, 55, 56
tabmult_C:
	.byt 0, 0, 2, 3, 4, 5, 5, 6
	.byt 7, 8, 8, 9, 10, 11, 12, 13
	.byt 14, 14, 15, 16, 17, 18, 19, 19
	.byt 20, 21, 22, 23, 24, 24, 25, 26
	.byt 27, 28, 29, 30, 30, 31, 32, 33
	.byt 34, 35, 35, 36, 37, 38, 39, 40
	.byt 40, 41, 42, 43, 44, 44, 45, 46
	.byt 47, 48, 49, 49, 50, 51, 52, 53
	.byt 54, 54, 55, 56, 57, 58, 59, 59
	.byt 60, 61, 62, 63, 63, 64, 65, 66
	.byt 67, 68, 68, 69, 70, 71, 72, 72
	.byt 73, 74, 75, 76, 76, 77, 78, 79
	.byt 80, 80, 81, 82, 83, 84, 85, 85
	.byt 86, 87, 88, 89, 89, 90, 91, 92
	.byt 93, 93, 94, 95, 96, 97, 97, 98
	.byt 99, 100, 101, 101, 102, 103, 104, 105
tabmult_D:
	.byt 0, 1, 1, 1, 2, 2, 3, 4
	.byt 4, 5, 5, 6, 7, 7, 8, 8
	.byt 9, 9, 10, 10, 11, 11, 12, 13
	.byt 13, 14, 14, 15, 15, 16, 17, 17
	.byt 18, 18, 19, 19, 20, 20, 21, 22
	.byt 22, 23, 23, 24, 24, 25, 26, 26
	.byt 27, 27, 28, 28, 29, 30, 30, 31
	.byt 31, 32, 33, 33, 34, 34, 35, 35
	.byt 36, 37, 37, 38, 38, 39, 40, 40
	.byt 41, 41, 42, 43, 43, 44, 44, 45
	.byt 46, 46, 47, 47, 48, 49, 49, 50
	.byt 50, 51, 52, 52, 53, 53, 54, 55
	.byt 55, 56, 56, 57, 58, 58, 59, 59
	.byt 60, 61, 61, 62, 63, 63, 64, 64
	.byt 65, 66, 66, 67, 68, 68, 69, 69
	.byt 70, 71, 71, 72, 73, 73, 74, 74
	
			