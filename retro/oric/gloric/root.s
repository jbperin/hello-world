
NUM:
_square    .byt 0,0,0     ; input number
storage   .byt 0,0,0     ; temporary data
ROOT:
_thesqrt      .byt 0,0       ; result
REM:
remainder .byt 0,0       ; result remainder

;http://6502org.wikidot.com/software-math-sqrt

_sqrt_16:
.(
   LDA #0
   STA ROOT
   STA REM
   LDX #8
L1 SEC
   LDA NUM+1 ; NUMH
   SBC #$40
   TAY
   LDA REM
   SBC ROOT
   BCC L2
   STY NUM+1 ; NUMH
   STA REM
L2 ROL ROOT
   ASL NUM
   ROL NUM+1 ; NUMH
   ROL REM
   ASL NUM
   ROL NUM+1 ; NUMH
   ROL REM
   DEX
   BNE L1
.)
  RTS



;https://codebase64.org/doku.php?id=base:16bit_and_24bit_sqrt
;-----------------------------------
;   Square Root of a 24bit number
;-----------------------------------
; by Verz - Jul2019
;-----------------------------------
;
;  load the 24bit input in square
;  16bit result in  sqrt & remainder
;-----------------------------------


_sqrt24:
.(
        LDY #$01        ; lsby of first odd number = 1
        STY storage
        DEY
        STY storage+1   ; msby of first odd number (_thesqrt = 0)
        sty storage+2
        sty _thesqrt
        sty _thesqrt+1
again
        SEC
        LDA _square     ; save remainder
        sta remainder
        SBC storage    ; subtract odd lo from integer lo
        STA _square
        LDA _square+1
        sta remainder+1
        SBC storage+1   ; subtract odd mid from integer mid
        STA _square+1
        lda _square+2
        sbc storage+2   ; subtract odd hi from integer hi
        sta _square+2
        BCC nomore    ; is subtract result negative?
        INC _thesqrt      ; no. increment _square root
        bne sqnxt
        inc _thesqrt+1
sqnxt   LDA storage     ; calculate next odd number
        ADC #$01        ; +1+C(=1)
        STA storage
        BCC again
        lda storage+1
        adc #$00
        sta storage+1
        bcc again
        INC storage+2
        JMP again
nomore
.)
        RTS
