 
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
    ldy #0       ;NegIt = False
    
//  IF TanX = 0 THEN
    lda _tx
    bne TanXNotNull_01
//      IF TanY = 0 THEN
        lda _ty
        bne TanYNotNull_02
//          RETURN 0
            jmp atdone 
TanYNotNull_02:
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
            sta FD
//          IF TanY = 0 THEN
            lda _ty
            bne TanYNotNull_03
//              RETURN 0
                jmp atdone
TanYNotNull_03:
//          ELSE IF TanY > 0 THEN
            bmi TanYNegative_02
//              TmpY = TanY
                sta FC
//              IF TmpY = TmpX THEN 
                cmp FD
                bne TanxDiffTanY_01
//                  RETURN PI/4
                    lda A_PI_OVER_4
                    sta _res
                    jmp atdone
//              ELSE IF TmpX < TmpY Then
TanxDiffTanY_01:
                bcc TanXOverTanY_01
//                  SWAP (TmpY, TmpX)
                    ldx FD ; A contains FC 
                    sta FD
                    stx FC
//                  Octant = 2 ; PI / 2 ; Angle is in [PI/4 .. PI/2]
                    lda A_PI_OVER_2
                    sta octant 
//                  NegIt = 1
                    ldy #1
                    jmp compratio
//              ELSE (TmpX > TmpY)
TanXOverTanY_01:
//                  Octant = 1 ; 0 ; Angle is in [0 .. PI/4]
                    lda A_ZERO
                    sta octant 
                    jmp compratio
//              END IF
//  
//          ELSE (TanY < 0)
TanYNegative_02:
//              TmpY = -TanY
                eor #$FF
                sec
                adc #$00
                sta FC
//              IF TmpY = TmpX THEN 
                cmp FD
                bne TanxDiffTanY_02
//                  RETURN 7*PI/4
                    lda A_7_PI_OVER_4
                    sta _res
                    jmp atdone
TanxDiffTanY_02:
//              ELSE IF TmpX < TmpY Then
                bcc TanXOverTanY_02
//                  SWAP (TmpY, TmpX)
                    ldx FD ; A already contain tanY
                    sta FD
                    stx FC
//                  Octant = 7; 3*PI / 2  Angle is in [3PI/2 .. 7PI/4]
                    lda A_3_PI_OVER_2
                    sta octant
                    jmp compratio
//              ELSE (TmpX > TmpY)
TanXOverTanY_02:
//                  Octant = 8; 2*PI Angle is in [7PI/4 .. 2PI]
                    lda A_ZERO
                    sta octant
//                  NegIt = 1
                    ldy #1
                    jmp compratio
//             END IF
//  
//          END IF
//      ELSE (TanX < 0)
TanXNegative_01:
//          TmpX = -TanX
            eor #$FF
            sec
            adc #$00
            sta FD
//          IF TanY = 0 THEN
            lda _ty
            bne TanYNotNull_01
//              RETURN PI
                lda A_PI
                sta _res
                jmp atdone
TanYNotNull_01:
//          ELSE IF TanY > 0 THEN
            bmi TanYNegative_03
//              TmpY = TanY
                sta FC
//              IF TmpY = TmpX THEN 
                cmp FD
                bne TanxDiffTanY_03
//                  RETURN 3*PI/4
                    lda A_3_PI_OVER_4
                    sta _res
                    jmp atdone
TanxDiffTanY_03:
//              ELSE IF TmpX < TmpY Then
                bcc TanXOverTanY_03
//                  SWAP (TmpY, TmpX)
                    ldx FD ; A already contains TanY
                    sta FD
                    stx FC
//                  Octant = 3 ;  PI / 2 Angle is in [PI/2 .. 3PI/4]
                    lda A_PI_OVER_2
                    sta octant
                    jmp compratio
//              ELSE (TmpX > TmpY)
TanXOverTanY_03:
//                  NegIt = 1
                    ldy #1
//                  Octant = 4 ; PI Angle is in [3PI/4 .. PI]
                    lda A_PI
                    sta octant
                    jmp compratio
//              END IF
//  
//          ELSE (TanY < 0)
TanYNegative_03:
//              TmpY = -TanY
                eor #$FF
                sec
                adc #$00
                sta FC
//              IF TmpY = TmpX THEN 
                cmp FD
                bne TanxDiffTanY_04
//                  RETURN 5*PI/4
                    lda A_5_PI_OVER_4
                    sta _res
                    jmp atdone
TanxDiffTanY_04:
//              ELSE IF TmpX < TmpY Then
                bcc TanXOverTanY_04
//                  SWAP (TmpY, TmpX)
                    ldx FD ; A laready contains TanY
                    sta FD 
                    stx FC
//                  NegIt = 1
                    ldy #1
//                  Octant = 6 ; 3_PI_OVER_2 #$C0 Angle is in [5PI/4 .. 3PI/2]
                    lda A_3_PI_OVER_2
                    sta octant
                    jmp compratio
//              ELSE (TmpX > TmpY)
TanXOverTanY_04:
//                  Octant = 5 ; PI #$80 Angle is in [PI .. 5PI/4]
                    lda A_PI
                    sta octant
                    jmp compratio
//              END IF
//  
//          END IF
//      END IF
//  END

    ;lda _tx
    ;sta FD
    
    ;lda _ty
    ;sta FC

compratio:
//  Ratio = TmpY / TmpX
    
// divide FC (tanY) by FD( tanX) and store res in FE
;6 bits division
    lda FC
    asl
    ldx #$06
loop2
    cmp FD
    bcc *+4
    sbc FD
    rol FE
    asl
    dex
    bne loop2
        
        
//  Angle = 

    lda FE
    and #$3F
    
    tax
    ;sta _Index

//  IF NegIt THEN
    tya 
    beq DontNegIt
//      Angle = -ATAN [Ratio]
        lda atan_table, x
        eor #$FF
        sec
        adc #$00
        jmp SumPart
DontNegIt:
        lda atan_table, x
//  
SumPart:    
//  RES = Angle + Octant
    clc
    adc octant 

    sta _res
    

atdone
.)
	RTS

