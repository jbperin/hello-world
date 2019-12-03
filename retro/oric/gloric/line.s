

.zero
_PosPrint .dsb 2
.text

_PrintX .dsb 1
_PrintY .dsb 1

_printChar:
.(
    lda #$BB
    sta _PosPrint+1
    clc
    lda #$80
    adc _PrintX
    ldx _PrintY
    beq prdone
nxtline:
    adc #40
    bcc noincline
    inc _PosPrint+1
    clc
noincline:
    dex
    bne nxtline
prdone:
    sta _PosPrint
.)
    rts



_Point1X .dsb 1
_Point1Y .dsb 1
_Point2X .dsb 1
_Point2Y .dsb 1

_drawLine:
.(


    lda _Point1X
    sta _PrintX
    lda _Point1Y
    sta _PrintY
    jsr _printChar
    lda #65
    ldy #00
    sta (_PosPrint),y
//    dx =  abs(x1-x0);
//    sx = x0<x1 ? 1 : -1;
//    dy = -abs(y1-y0);
//    sy = y0<y1 ? 1 : -1;
//    err = dx+dy;  /* error value e_xy */
//    while (true)   /* loop */
//        if (x0==x1 && y0==y1) break;
//        e2 = 2*err;
//        if (e2 >= dy)
//            err += dy; /* e_xy+e_x > 0 */
//            x0 += sx;
//        end if
//        if (e2 <= dx) /* e_xy+e_y < 0 */
//            err += dx;
//            y0 += sy;
//        end if
//    end while
.)
    rts

