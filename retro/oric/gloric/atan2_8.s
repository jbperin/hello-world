 
#define A_ZERO        #$00
#define A_PI_OVER_4   #$20
#define A_PI_OVER_2   #$40	
#define A_3_PI_OVER_4 #$60
#define A_PI          #$80
#define A_5_PI_OVER_4 #$A0
#define A_3_PI_OVER_2 #$C0
#define A_7_PI_OVER_4 #$E0

.zero
FC .byt 00    			;
FD .byt 00    			;
FE .byt 00    			;
octant .byt 00          ;

.text
_tx .dsb 1
_ty .dsb 1
_res .dsb 1

.dsb 256-(*&255)

_atan2_8
.(
//  INIT
    lda #$00
    sta _res

//  IF TanX = 0 THEN
    lda _tx
    bne TanXNotNull_01
//      IF TanY = 0 THEN
        lda _ty
        beq atdone
//          RETURN 0
//      ELSE IF TanY > 0 THEN
        bmi TanYNegative_01
//          RETURN PI/2
            lda A_PI_OVER_2
            sta _res
            jmp atdone
//      ELSE
TanYNegative_01:
//          RETURN 3*PI/2
            lda A_3_PI_OVER_2
            sta _res
            jmp atdone
//      END
//  ELSE (TanX != 0)
TanXNotNull_01:
//      IF TanX > 0 THEN
        bmi TanXNegative_01
//          TmpX = TanX
            tax
//          IF TanY = 0 THEN
            lda _ty
            beq atdone
//              RETURN 0
//          ELSE IF TanY > 0 THEN
            bmi TanYNegative_02
//              TmpY = TanY
                tay
//              IF TmpY = TmpX THEN 
                cmp _tx
//                  RETURN PI/4
//              ELSE IF TmpX < TmpY Then
//                  SWAP (TmpY, TmpX)
//                  Octant = 2 ; PI / 2 ; Angle is in [PI/4 .. PI/2]
//                  NegIt = 1
//              ELSE (TmpX > TmpY)
//                  Octant = 1 ; 0 ; Angle is in [0 .. PI/4]
//              END IF
//  
//          ELSE (TanY < 0)
TanYNegative_02:
//              TmpY = -TanY
//              IF TmpY = TmpX THEN 
//                  RETURN 7*PI/4
//              ELSE IF TmpX < TmpY Then
//                  SWAP (TmpY, TmpX)
//                  Octant = 7; 3*PI / 2  Angle is in [3PI/2 .. 7PI/4]
//              ELSE (TmpX > TmpY)
//                  Octant = 8; 2*PI Angle is in [7PI/4 .. 2PI]
//                   NegIt = 1
//             END IF
//  
//          END IF
//      ELSE (TanX < 0)
TanXNegative_01:
//          TmpX = -TanX
//          IF TanY = 0 THEN
//              RETURN PI
//          ELSE IF TanY > 0 THEN
//              TmpY = TanY
//              IF TmpY = TmpX THEN 
//                  RETURN 3*PI/4
//              ELSE IF TmpX < TmpY Then
//                  SWAP (TmpY, TmpX)
//                  Octant = 3 ;  PI / 2 Angle is in [PI/2 .. 3PI/4]
//              ELSE (TmpX > TmpY)
//                  NegIt = 1
//                  Octant = 4 ; PI Angle is in [3PI/4 .. PI]
//              END IF
//  
//          ELSE (TanY < 0)
//              TmpY = -TanY
//              IF TmpY = TmpX THEN 
//                  RETURN 5*PI/4
//              ELSE IF TmpX < TmpY Then
//                  SWAP (TmpY, TmpX)
//                  NegIt = 1
//                  Octant = 6 ; 3_PI_OVER_2 #$C0 Angle is in [5PI/4 .. 3PI/2]
//              ELSE (TmpX > TmpY)
//                  Octant = 5 ; PI #$80 Angle is in [PI .. 5PI/4]
//              END IF
//  
//          END IF
//      END IF
//  END


    lda _tx
    sta FD
    
    lda _ty
    sta FC
    

;6 bits division
    lda FD
    asl
    ldx #$06
loop2
    cmp FC
    bcc *+4
    sbc FC
    rol FE
    asl
    dex
    bne loop2
        
        
        
    lda FE
    and #$3F
    
    tax
    sta _Index
    lda atan_table, x
    
    sta _res
    

atdone
.)
	RTS


;; https://codebase64.org/doku.php?id=base:8bit_atan2_8-bit_angle
;; Calculate the angle, in a 256-degree circle, between two points.
;; The trick is to use logarithmic division to get the y/x ratio and
;; integrate the power function into the atan table. Some branching is
;; avoided by using a table to adjust for the octants.
;; In otherwords nothing new or particularily clever but nevertheless
;; quite useful.
;;
;; by Johan Forslöf (doynax)

;;_octant8 .dsb 1		;; temporary zeropage variable
;;_x1 .dsb 1
;;_x2 .dsb 1
;;_y1 .dsb 1
;;_y2 .dsb 1
;;_atanres .dsb 1
;;
;;_atan2_8
;;    lda #$00	
;;    sta _octant8
;;    
;;    sec
;;    lda _x1
;;    sbc _x2
;;    bcs *+7
;;    eor #$ff
;;    clc
;;    adc #$01
;;    tax
;;    rol _octant8
;;
;;    sec
;;    lda _y1
;;    sbc _y2
;;    bcs *+7
;;    eor #$ff
;;    clc
;;    adc #$01
;;    tay
;;    rol _octant8
;;
;;    sec
;;    lda log2_tab,x
;;    sbc log2_tab,y
;;    bcc *+7
;;    eor #$ff
;;    clc
;;    adc #$01
;;    tax
;;
;;    lda _octant8
;;    rol
;;    and #%111
;;    tay
;;
;;    lda atan_tab,x
;;    eor octant_adjust,y
;;    sta _atanres
;;    rts
;;
;;octant_adjust	.byte %00111111		;; x+,y+,|x|>|y|
;;		.byte %00000000		;; x+,y+,|x|<|y|
;;		.byte %11000000		;; x+,y-,|x|>|y|
;;		.byte %11111111		;; x+,y-,|x|<|y|
;;		.byte %01000000		;; x-,y+,|x|>|y|
;;		.byte %01111111		;; x-,y+,|x|<|y|
;;		.byte %10111111		;; x-,y-,|x|>|y|
;;		.byte %10000000		;; x-,y-,|x|<|y|
;;
;;
;;		;;;;;;;; atan(2^(x/32))*128/pi ;;;;;;;;
;;
;;atan_tab	.byte $00,$00,$00,$00,$00,$00,$00,$00
;;		.byte $00,$00,$00,$00,$00,$00,$00,$00
;;		.byte $00,$00,$00,$00,$00,$00,$00,$00
;;		.byte $00,$00,$00,$00,$00,$00,$00,$00
;;		.byte $00,$00,$00,$00,$00,$00,$00,$00
;;		.byte $00,$00,$00,$00,$00,$00,$00,$00
;;		.byte $00,$00,$00,$00,$00,$00,$00,$00
;;		.byte $00,$00,$00,$00,$00,$00,$00,$00
;;		.byte $00,$00,$00,$00,$00,$00,$00,$00
;;		.byte $00,$00,$00,$00,$00,$00,$00,$00
;;		.byte $00,$00,$00,$00,$00,$01,$01,$01
;;		.byte $01,$01,$01,$01,$01,$01,$01,$01
;;		.byte $01,$01,$01,$01,$01,$01,$01,$01
;;		.byte $01,$01,$01,$01,$01,$01,$01,$01
;;		.byte $01,$01,$01,$01,$01,$02,$02,$02
;;		.byte $02,$02,$02,$02,$02,$02,$02,$02
;;		.byte $02,$02,$02,$02,$02,$02,$02,$02
;;		.byte $03,$03,$03,$03,$03,$03,$03,$03
;;		.byte $03,$03,$03,$03,$03,$04,$04,$04
;;		.byte $04,$04,$04,$04,$04,$04,$04,$04
;;		.byte $05,$05,$05,$05,$05,$05,$05,$05
;;		.byte $06,$06,$06,$06,$06,$06,$06,$06
;;		.byte $07,$07,$07,$07,$07,$07,$08,$08
;;		.byte $08,$08,$08,$08,$09,$09,$09,$09
;;		.byte $09,$0a,$0a,$0a,$0a,$0b,$0b,$0b
;;		.byte $0b,$0c,$0c,$0c,$0c,$0d,$0d,$0d
;;		.byte $0d,$0e,$0e,$0e,$0e,$0f,$0f,$0f
;;		.byte $10,$10,$10,$11,$11,$11,$12,$12
;;		.byte $12,$13,$13,$13,$14,$14,$15,$15
;;		.byte $15,$16,$16,$17,$17,$17,$18,$18
;;		.byte $19,$19,$19,$1a,$1a,$1b,$1b,$1c
;;		.byte $1c,$1c,$1d,$1d,$1e,$1e,$1f,$1f
;;
;;
;;		;;;;;;;; log2(x)*32 ;;;;;;;;
;;
;;log2_tab	.byte $00,$00,$20,$32,$40,$4a,$52,$59
;;		.byte $60,$65,$6a,$6e,$72,$76,$79,$7d
;;		.byte $80,$82,$85,$87,$8a,$8c,$8e,$90
;;		.byte $92,$94,$96,$98,$99,$9b,$9d,$9e
;;		.byte $a0,$a1,$a2,$a4,$a5,$a6,$a7,$a9
;;		.byte $aa,$ab,$ac,$ad,$ae,$af,$b0,$b1
;;		.byte $b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9
;;		.byte $b9,$ba,$bb,$bc,$bd,$bd,$be,$bf
;;		.byte $c0,$c0,$c1,$c2,$c2,$c3,$c4,$c4
;;		.byte $c5,$c6,$c6,$c7,$c7,$c8,$c9,$c9
;;		.byte $ca,$ca,$cb,$cc,$cc,$cd,$cd,$ce
;;		.byte $ce,$cf,$cf,$d0,$d0,$d1,$d1,$d2
;;		.byte $d2,$d3,$d3,$d4,$d4,$d5,$d5,$d5
;;		.byte $d6,$d6,$d7,$d7,$d8,$d8,$d9,$d9
;;		.byte $d9,$da,$da,$db,$db,$db,$dc,$dc
;;		.byte $dd,$dd,$dd,$de,$de,$de,$df,$df
;;		.byte $df,$e0,$e0,$e1,$e1,$e1,$e2,$e2
;;		.byte $e2,$e3,$e3,$e3,$e4,$e4,$e4,$e5
;;		.byte $e5,$e5,$e6,$e6,$e6,$e7,$e7,$e7
;;		.byte $e7,$e8,$e8,$e8,$e9,$e9,$e9,$ea
;;		.byte $ea,$ea,$ea,$eb,$eb,$eb,$ec,$ec
;;		.byte $ec,$ec,$ed,$ed,$ed,$ed,$ee,$ee
;;		.byte $ee,$ee,$ef,$ef,$ef,$ef,$f0,$f0
;;		.byte $f0,$f1,$f1,$f1,$f1,$f1,$f2,$f2
;;		.byte $f2,$f2,$f3,$f3,$f3,$f3,$f4,$f4
;;		.byte $f4,$f4,$f5,$f5,$f5,$f5,$f5,$f6
;;		.byte $f6,$f6,$f6,$f7,$f7,$f7,$f7,$f7
;;		.byte $f8,$f8,$f8,$f8,$f9,$f9,$f9,$f9
;;		.byte $f9,$fa,$fa,$fa,$fa,$fa,$fb,$fb
;;		.byte $fb,$fb,$fb,$fc,$fc,$fc,$fc,$fc
;;		.byte $fd,$fd,$fd,$fd,$fd,$fd,$fe,$fe
;;		.byte $fe,$fe,$fe,$ff,$ff,$ff,$ff,$ff