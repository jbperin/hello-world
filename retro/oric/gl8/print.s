
;
; This is a simple display module
; called by the C part of the program
;

.import popax
.import popa
.importzp ptr1, ptr2, ptr3, ptr4 ; 16 bits
.importzp tmp1, tmp2, tmp3, tmp4; 8 bits

;
; X_POS and Y_POS are used to define 
; the position of the message to display
; on the screen.
; This shows you that XA understand defines.
;
; 
; We define the adress of the TEXT screen.
; 
; #define DISPLAY_ADRESS $BB80
DISPLAY_ADRESS = $BB80

.export _AdvancedPrint

;
; We use a table of bytes to avoid the multiplication 
; by 40. We could have used a multiplication routine
; but introducing table accessing is not a bad thing.
; In order to speed up things, we precompute the real
; adress of each start of line. Each table takes only
; 28 bytes, even if it looks impressive at first glance.
;

; This table contains lower 8 bits of the adress
ScreenAdressLow:
	.byt .LOBYTE(DISPLAY_ADRESS+40*0)
	.byt .LOBYTE(DISPLAY_ADRESS+40*1)
	.byt .LOBYTE(DISPLAY_ADRESS+40*2)
	.byt .LOBYTE(DISPLAY_ADRESS+40*3)
	.byt .LOBYTE(DISPLAY_ADRESS+40*4)
	.byt .LOBYTE(DISPLAY_ADRESS+40*5)
	.byt .LOBYTE(DISPLAY_ADRESS+40*6)
	.byt .LOBYTE(DISPLAY_ADRESS+40*7)
	.byt .LOBYTE(DISPLAY_ADRESS+40*8)
	.byt .LOBYTE(DISPLAY_ADRESS+40*9)
	.byt .LOBYTE(DISPLAY_ADRESS+40*10)
	.byt .LOBYTE(DISPLAY_ADRESS+40*11)
	.byt .LOBYTE(DISPLAY_ADRESS+40*12)
	.byt .LOBYTE(DISPLAY_ADRESS+40*13)
	.byt .LOBYTE(DISPLAY_ADRESS+40*14)
	.byt .LOBYTE(DISPLAY_ADRESS+40*15)
	.byt .LOBYTE(DISPLAY_ADRESS+40*16)
	.byt .LOBYTE(DISPLAY_ADRESS+40*17)
	.byt .LOBYTE(DISPLAY_ADRESS+40*18)
	.byt .LOBYTE(DISPLAY_ADRESS+40*19)
	.byt .LOBYTE(DISPLAY_ADRESS+40*20)
	.byt .LOBYTE(DISPLAY_ADRESS+40*21)
	.byt .LOBYTE(DISPLAY_ADRESS+40*22)
	.byt .LOBYTE(DISPLAY_ADRESS+40*23)
	.byt .LOBYTE(DISPLAY_ADRESS+40*24)
	.byt .LOBYTE(DISPLAY_ADRESS+40*25)
	.byt .LOBYTE(DISPLAY_ADRESS+40*26)
	.byt .LOBYTE(DISPLAY_ADRESS+40*27)

; This table contains hight 8 bits of the adress
ScreenAdressHigh:
	.byt .HIBYTE(DISPLAY_ADRESS+40*0)
	.byt .HIBYTE(DISPLAY_ADRESS+40*1)
	.byt .HIBYTE(DISPLAY_ADRESS+40*2)
	.byt .HIBYTE(DISPLAY_ADRESS+40*3)
	.byt .HIBYTE(DISPLAY_ADRESS+40*4)
	.byt .HIBYTE(DISPLAY_ADRESS+40*5)
	.byt .HIBYTE(DISPLAY_ADRESS+40*6)
	.byt .HIBYTE(DISPLAY_ADRESS+40*7)
	.byt .HIBYTE(DISPLAY_ADRESS+40*8)
	.byt .HIBYTE(DISPLAY_ADRESS+40*9)
	.byt .HIBYTE(DISPLAY_ADRESS+40*10)
	.byt .HIBYTE(DISPLAY_ADRESS+40*11)
	.byt .HIBYTE(DISPLAY_ADRESS+40*12)
	.byt .HIBYTE(DISPLAY_ADRESS+40*13)
	.byt .HIBYTE(DISPLAY_ADRESS+40*14)
	.byt .HIBYTE(DISPLAY_ADRESS+40*15)
	.byt .HIBYTE(DISPLAY_ADRESS+40*16)
	.byt .HIBYTE(DISPLAY_ADRESS+40*17)
	.byt .HIBYTE(DISPLAY_ADRESS+40*18)
	.byt .HIBYTE(DISPLAY_ADRESS+40*19)
	.byt .HIBYTE(DISPLAY_ADRESS+40*20)
	.byt .HIBYTE(DISPLAY_ADRESS+40*21)
	.byt .HIBYTE(DISPLAY_ADRESS+40*22)
	.byt .HIBYTE(DISPLAY_ADRESS+40*23)
	.byt .HIBYTE(DISPLAY_ADRESS+40*24)
	.byt .HIBYTE(DISPLAY_ADRESS+40*25)
	.byt .HIBYTE(DISPLAY_ADRESS+40*26)
	.byt .HIBYTE(DISPLAY_ADRESS+40*27)


Xpos := tmp1
Ypos := tmp2
ptrMessage := ptr3

.segment "CODE"
;
; The message and display position will be read from the stack.
; sp+0 => X coordinate
; sp+2 => Y coordinate
; sp+4 => Adress of the message to display
;
.proc _AdvancedPrint

	; Initialise display adress
	; this uses self-modifying code
	; (the $0123 is replaced by display adress)
	
	; The idea is to get the Y position from the stack,
	; and use it as an index in the two adress tables.
	; We also need to add the value of the X position,
	; also taken from the stack to the resulting value.
    sta ptrMessage
    stx ptrMessage+1

	jsr popa 
    sta Xpos

	jsr popa 
    sta Ypos


	;ldy #2
	;lda (sp),y				; Access Y coordinate
	;tax


    ldx Ypos
    lda ScreenAdressLow,x
    clc
    adc Xpos
    sta write+1
    lda ScreenAdressHigh,x
    adc #0
    sta write+2


	;lda ScreenAdressLow,x	; Get the LOW part of the screen adress
	;clc						; Clear the carry (because we will do an addition after)
	;ldy #0
	;adc (sp),y				; Add X coordinate
	;sta write+1
	;lda ScreenAdressHigh,x	; Get the HIGH part of the screen adress
	;adc #0					; Eventually add the carry to complete the 16 bits addition
	;sta write+2				



	; Initialise message adress using the stack parameter
	; this uses self-modifying code
	; (the $0123 is replaced by message adress)
	; ldy #4
	; lda (sp),y
	; sta read+1
	; iny
	; lda (sp),y
	; sta read+2
    lda ptrMessage
    sta read+1
    lda ptrMessage+1
    sta read+2

	; Start at the first character
	ldx #0
loop_char:

	; Read the character, exit if it is a 0
read:
	lda $0123,x
	beq end_loop_char

	; Write the character on screen
write:
	sta $0123,x

	; Next character, and loop
	inx
	jmp loop_char  

	; Finished !
end_loop_char:
	rts
.endproc
