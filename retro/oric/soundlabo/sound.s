#include "labels.h"

.text
AYRegisterNumber .dsb 1
AYRegisterValue  .dsb 1

write2ay:
.(
    ;First place the register number onto VIA Port A
    LDA AYRegisterNumber
    STA via_porta
    ;Then set control lines to Register Number state
    LDA #ayc_Register
    STA via_pcr
    ;We have to set control lines to Inactive after
    LDA #ayc_Inactive
    STA via_pcr
    ;Before we place the Register data on the bus
    LDA AYRegisterValue
    STA via_porta
    ;The set control lines to Register Data State
    LDA #ayc_Write
    STA via_pcr
    ;And finally set control lines inactive again
    LDA #ayc_Inactive
    STA via_pcr
.)
    rts

// void write2AyChip (unsigned char regnumber, unsigned char regvalue);
_write2AyChip:
.(
	ldy #0
	lda (sp),y
	sta AYRegisterNumber
	iny
	lda (sp),y
	sta AYRegisterValue

    jsr write2ay
.)    
    rts

WriteToAY:
.(
    PHP              
    SEI              
    STA VIA_IORA2    
    TAY              
    TXA              
    CPY #$07         
    BNE $F59D        
    ORA #$40         
    PHA              
    LDA VIA_PCR      
    ORA #$EE         
    STA VIA_PCR      
    AND #$11         
    ORA #$CC         
    STA VIA_PCR      
    TAX              
    PLA              
    STA VIA_IORA2    
    TXA              
    ORA #$EC         
    STA VIA_PCR      
    AND #$11         
    ORA #$CC         
    STA VIA_PCR      
    PLP              
.)
    RTS            