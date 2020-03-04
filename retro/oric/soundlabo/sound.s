#include "labels.h"


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



; MUSIC:  $FC18 -> $FC5D
; PARAMS+1 canal (1 à 3)
; PARAMS+3 octave (0 à 7)
; PARAMS+5 note (0 à 12)
; PARAMS+7 volume (0 à 15)

_canal .dsb 1  // PARAMS + 1
_music_octave .dsb 1 // PARAMS + 3
_music_note .dsb 1   // PARAMS + 5
_music_volume .dsb 1 // PARAMS + 7

// jbMusic(int chanel,int octave,int key,int volume)
_jbMusic:
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
    ; JSR unknown_F2E4        

    STA $0204        
    LDA _canal // $0200,X         // $02E1
    BEQ unknown_F2F6       
    CMP $0204        
    BCC unknown_F2F7        
unknown_F2F6:
    SEC
unknown_F2F7:



    BCS MUSIC_FC5A        
    LDX #$E3         
    LDA #$08         
    ; JSR unknown_F2F8        


    STA $0204        
    LDA _music_octave // $0200,X    // $02E3  
    CMP $0204        
    BCC unknown2_F309        
unknown2_F308: 
    SEC              
unknown2_F309: 




    BCS MUSIC_FC5A        
    LDX #$E5         
    LDA #$0D         
    ;JSR unknown_F2E4     

    STA $0204        
    LDA _music_note // $0200,X    // $02E5
    BEQ unknown_F2F6_bis       
    CMP $0204        
    BCC unknown_F2F7_bis        
unknown_F2F6_bis:
    SEC
unknown_F2F7_bis:

    BCS MUSIC_FC5A        
    LDY _music_octave // $02E3        
    LDX _music_note // $02E5        
    LDA MusicData,X  
    STA snd_period+1        
    LDA MUSIC_FC6B,X      
    STA snd_period        
    LDA _music_volume        
    STA snd_volume        
MUSIC_FC4B:      
    DEY              
    BMI MUSIC_FC57        
    LSR snd_period+1        
    ROR snd_period        
    JMP MUSIC_FC4B        
MUSIC_FC57:  
    JMP SOUND        
MUSIC_FC5A:  ;INC $02E0  
.)      
    RTS 

MusicData:  .byt $00, $07, $07, $06, $06, $05, $05, $05, $04, $04, $04, $04, $03
MUSIC_FC6B: .byt $00, $77, $0B, $A6, $47, $EC, $97, $47, $FB, $B3, $70, $30, $F4 




; SOUND: $FB40
; PARAMS+1 canal (de 1 à 6)
; PARAMS+3 période (1 à 65535) (bruit)
; PARAMS+5 volume (1 à 15)


snd_period .dsb 2   // $02E3
snd_volume .dsb 1   // $02E5

 // void jbSound(int chanel,int period,int volume)
_jbSound:
.(
    ldy #0:	lda (sp),y: sta _canal
	ldy #2:	lda (sp),y: sta snd_period : iny : lda (sp),y: sta snd_period+1
    ldy #6:	lda (sp),y: sta snd_volume
	jsr MUSIC

.)
    rts
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
SOUND_FB62:
    TAX              
SOUND_FB63:
    LDA #$08         
    JSR WriteToAY    
    RTS              
SOUND_FB69:
    CMP #$02         
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

; PLAY: $FBD0
; PARAMS+1 canaux actifs (0 à 7) (son)
; PARAMS+3 canaux actifs (0 à 7) (bruit)
; PARAMS+5 enveloppe (1 à 7) (bruit)
; PARAMS+7 durée enveloppe (0 à 65535) (bruit)

sound_channels      .dsb 1 // $02E1 
noise_channels      .dsb 1 // $02E3 
enveloppe           .dsb 1 // $02E5
enveloppe_duration  .dsb 2 // $02E7

// void jbPlay(int soundchanels,int noisechanels,int envelop,int volume)
_jbPlay:
.(
    ldy #0:	lda (sp),y: sta sound_channels
	ldy #2:	lda (sp),y: sta noise_channels
    ldy #4:	lda (sp),y: sta enveloppe
    ldy #6:	lda (sp),y: sta enveloppe_duration: iny : lda (sp),y: sta enveloppe_duration+1
	jsr PLAY

.)
    rts

PLAY:
.(
    LDA noise_channels // $02E3        
    ASL              
    ASL              
    ASL              
    ORA sound_channels // $02E1        
    EOR #$3F         
    TAX              
    LDA #$07         
    JSR WriteToAY    
    CLC              
    LDA enveloppe_duration        
    ASL              
    STA enveloppe_duration        
    LDA enveloppe_duration+1        
    ROL              
    STA enveloppe_duration+1        
    LDA #$0B         
    LDX enveloppe_duration        
    JSR WriteToAY    
    LDA #$0C         
    LDX enveloppe_duration+1        
    JSR WriteToAY    
    LDA enveloppe //$02E5        
    AND #$07         
    TAY              
    LDA PLAY_FC10,Y      
    TAX              
    LDA #$0D         
    JSR WriteToAY    
.)
    RTS

;   FC10  00 00     BRK #$00         
;   FC12  04 08     DOP $08          
;   FC14  0A        ASL              
;   FC15  0B 0C     ANC #$0C         
;   FC17  0D A2 E1  ORA $E1A2        

PLAY_FC10 .byt $00, $00, $04, $08, $0A, $0B, $0C, $0D, $A2, $E1
