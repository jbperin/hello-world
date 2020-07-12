#include "params.h"

#ifdef USE_BUFFERED_SCREEN
    .bss
* = $_ADR_SCREEN_BUFFER    
hires_screen_buffer .dsb 8000
    .text

; memcpy((void *) (HIRES_SCREEN_ADDRESS+(FIRSTLINE*SCREEN_WIDTH)),(void *)(ADR_DRAWING+(FIRSTLINE*SCREEN_WIDTH)),(8*12)*SCREEN_WIDTH);// FIXME .. should be 8*11*SCREEN_WIDTH
_ScreenCopyHires
.(
	ldx #0
loop_x	
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*0,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*0,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*1,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*1,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*2,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*2,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*3,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*3,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*4,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*4,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*5,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*5,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*6,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*6,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*7,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*7,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*8,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*8,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*9,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*9,x
	
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*10,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*10,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*11,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*11,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*12,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*12,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*13,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*13,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*14,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*14,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*15,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*15,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*16,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*16,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*17,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*17,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*18,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*18,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*19,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*19,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*20,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*20,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*21,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*21,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*22,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*22,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*23,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*23,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*24,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*24,x
	lda $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*25,x
	sta $_ADR_SCREEN_MEMORY+(CLIP_TOP*SCREEN_WIDTH)+256*25,x



	dex
	beq end
	jmp loop_x
end

	rts
.)



#endif

; memset(ADR_DRAWING+(FIRSTLINE*SCREEN_WIDTH), 64, (8*12)*SCREEN_WIDTH); // FIXME .. should be 8*11*SCREEN_WIDTH
_HiresClear
.(
	lda #$40	; pixel eteint
	ldx #0		; compteur de boucle a 256
loop_x	
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*0,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*1,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*2,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*3,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*4,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*5,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*6,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*7,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*8,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*9,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*10,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*11,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*12,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*13,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*14,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*15,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*16,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*17,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*18,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*19,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*20,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*21,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*22,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*23,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*24,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*25,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*26,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*27,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*28,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*29,x
	sta $_ADR_DRAWING+(CLIP_TOP*SCREEN_WIDTH)+256*30,x

	dex
	bne loop_x
	rts
.)