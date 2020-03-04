
irq_handler:
	php
	pha
	txa
	pha
	tya
	pha

	; This handler runs at 100hz 

	jsr task_25Hz

	pla
	tay
	pla
	tax
	pla
	plp

jmp_old_handler
	jmp 0000



_enterSC:
.(
    pha
    lda #64
    sta $030E
    pla
.)
    rts
    
_leaveSC:
.(
    pha
    lda #192
    sta $030E
    pla
.)
    rts
    
    
    
_kernelInit:
.(


	;Since we are starting from when the standard irq has already been 
	;setup, we need not worry about ensuring one irq event and/or right 
	;timer period, only redirecting irq vector to our own irq handler. 
	sei

	; Save the old handler value
	lda $245
	sta jmp_old_handler+1
	lda $246
	sta jmp_old_handler+2



	; Setup DDRA, DDRB and ACR
	lda #%11111111
	sta via_ddra
	lda #%11110111 ; PB0-2 outputs, PB3 input.
	sta via_ddrb
	lda #%1000000
	sta via_acr

	; Since this is an slow process, we set the VIA timer to 
	; issue interrupts at 25Hz, instead of 100 Hz. This is 
	; not necessary -- it depends on your needs
	lda #<40000
	sta via_t1ll 
	lda #>40000
	sta via_t1lh
		

	; Install our own handler
	lda #<irq_handler
	sta $245
	lda #>irq_handler
	sta $246

    cli 
.)
    rts
