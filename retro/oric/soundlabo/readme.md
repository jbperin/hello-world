

W8912: $F590 -> F5C0
param : A : num de registre
        X : donnée à transférer

PING: $FA9F
SHOOT: $FAB5
EXPLD: $FACB
ZAP:   $FAE1

KB BEEP: $FB14
KB BEEP: $FB2A

SOUND: $FB40
PARAMS+1 canal (de 1 à 6)
PARAMS+3 période (1 à 65535) (bruit)
PARAMS+5 volume (1 à 15)

PLAY: $FBD0
PARAMS+1 canaux actifs (0 à 7) (son)
PARAMS+3 canaux actifs (0 à 7) (bruit)
PARAMS+5 enveloppe (1 à 7) (bruit)
PARAMS+7 durée enveloppe (0 à 65535) (bruit)

MUSIC:  $FC18 -> $FC5D
PARAMS+1 canal (1 à 3)
PARAMS+3 octave (0 à 7)
PARAMS+5 note (0 à 12)
PARAMS+7 volume (0 à 15)




int play(int soundchanels,int noisechanels,int envelop,int volume);
int music(int chanel,int octave,int key,int volume);
int sound(int chanel,int period,int volume);

_play        
        ldx #4          ;Get four parms
        jsr getXparm
        jsr $fbd0       ;play
        jmp grexit      ;common exit point
        
_music
        ldx #4          ;Get four parms
        jsr getXparm
        jsr $fc18       ;music
        jmp grexit      ;common exit point

_sound        
        ldx #3          ;Get three parms
        jsr getXparm
        jsr $fb40       ;sound
        jmp grexit      ;common exit point
