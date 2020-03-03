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
	ldy #2
	lda (sp),y
	TAX

	ldy #0
	lda (sp),y

    jsr WriteToAY
.)    
    rts

#define VIA_PCR $30C
#define VIA_IORA2 $30F
; parametre A = register number of 8912
; parametre X = donnée à transférer
WriteToAY:
.(
    PHP              
    SEI              
    STA VIA_IORA2    
    TAY              
    TXA              
    CPY #$07         
    BNE WriteToAY_F59D        
    ORA #$40         
WriteToAY_F59D:
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
    plp
.)              
    rts              

unknown: // F2E4
.(
  STA $0204        
  LDA $0201,X      
  BNE unknown_F2F6        
  LDA $0200,X      
  BEQ unknown_F2F6       
  CMP $0204        
  BCC unknown_F2F7        
unknown_F2F6:
  SEC
unknown_F2F7:
.)  
	RTS   

unknown2: // F2F8
.(
    STA $0204        
    LDA $0201,X      
    BNE unknown2_F308        
    LDA $0200,X      
    CMP $0204        
    BCC unknown2_F309        
unknown2_F308: 
    SEC              
unknown2_F309: 
.)
RTS      

_canal .dsb 1  // PARAMS + 1
_music_octave .dsb 1 // PARAMS + 3
_music_note .dsb 1   // PARAMS + 5
_music_volume .dsb 1 // PARAMS + 7

// int myMusic(int chanel,int octave,int key,int volume)
_myMusic:
.(
    ldy #0:	lda (sp),y: sta _canal
	ldy #2:	lda (sp),y: sta _music_octave
    ldy #4:	lda (sp),y: sta _music_note
    ldy #6:	lda (sp),y: sta _music_volume
	jsr MUSIC

.)
    rts
MUSIC:
.(
    LDX #$E1         
    LDA #$04         
    JSR unknown        
    BCS MUSIC_FC5A        
    LDX #$E3         
    LDA #$08         
    JSR unknown2        
    BCS MUSIC_FC5A        
    LDX #$E5         
    LDA #$0D         
    JSR unknown        
    BCS MUSIC_FC5A        
    LDY _music_octave // $02E3        
    LDX _music_note // $02E5        
    LDA MusicData,X  
    STA snd_period+1        
    LDA MUSIC_FC6B,X      
    STA snd_period        
    LDA _music_volume        
    STA snd_volume        
MUSIC_FC4B:      DEY              
    BMI MUSIC_FC57        
    LSR snd_period+1        
    ROR snd_period        
    JMP MUSIC_FC4B        
MUSIC_FC57:  JMP SOUND        
MUSIC_FC5A:  ;INC $02E0  
.)      
    RTS 

MusicData: .byt $00, $07, $07, $06, $06, $05, $05, $05, $04, $04, $04, $04
MUSIC_FC6B: .byt $00, $77, $0B, $A6, $47, $EC, $97, $47, $FB, $B3, $70, $30 

snd_period .dsb 2   // $02E3
snd_volume .dsb 1   // $02E5

SOUND: // FB40
.(
    LDA _canal // $02E1        
    CMP #$01         
    BNE SOUND_FB69        
    LDA #$00         
    LDX snd_period // $02E3        
    JSR WriteToAY    
    LDA #$01         
    LDX snd_period+1    // $02E4     
    JSR WriteToAY    
SOUND_FB57:  
    LDA snd_volume // $02E5        
    AND #$0F         
    BNE SOUND_FB62        
    LDX #$10         
    BNE SOUND_FB63        
SOUND_FB62:  TAX              
SOUND_FB63: LDA #$08         
    JSR WriteToAY    
    RTS              
SOUND_FB69: CMP #$02         
    BNE SOUND_FB8F        
    LDA #$02         
    LDX snd_period // $02E3        
    JSR WriteToAY    
    LDA #$03         
    LDX snd_period+1    // $02E4        
    JSR WriteToAY    
SOUND_FB7D: 
    LDA snd_volume // $02E5        
    AND #$0F         
    BNE SOUND_FB88        
    LDX #$10         
    BNE SOUND_FB89        
SOUND_FB88: 
    TAX              
SOUND_FB89: 
    LDA #$09         
    JSR WriteToAY    
    RTS              
SOUND_FB8F: 
    CMP #$03         
    BNE SOUND_FBB5        
    LDA #$04         
    LDX snd_period // $02E3        
    JSR WriteToAY    
    LDA #$05         
    LDX snd_period+1    // $02E4        
    JSR WriteToAY    
SOUND_FBA3: 
    LDA snd_volume // $02E5        
    AND #$0F         
    BNE SOUND_FBAE        
    LDX #$10         
    BNE SOUND_FBAF        
SOUND_FBAE: 
    TAX              
SOUND_FBAF:
    LDA #$0A         
    JSR WriteToAY    
    RTS              
SOUND_FBB5: LDA #$06         
    LDX snd_period // $02E3        
    JSR WriteToAY    
    LDA _canal // $02E1        
    CMP #$04         
    BEQ SOUND_FB57        
    CMP #$05         
    BEQ SOUND_FB7D        
    CMP #$06         
    BEQ SOUND_FBA3        
    ;INC $02E0        
.)
    RTS              
