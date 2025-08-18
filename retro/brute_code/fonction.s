#define BIT_0    1
#define BIT_1    2
#define BIT_2    4
#define BIT_3    8
#define BIT_4   16
#define BIT_5   32
#define BIT_6   64
#define BIT_7  128
#define BIT_8    1
#define BIT_9    2
#define BIT_10   4
#define BIT_11   8
#define BIT_12  16
#define BIT_13  32
#define BIT_14  64
#define BIT_15 128
_function_input 		    .dsb	2
_function_output 		.dsb	2
sav_reg_0 		        .dsb	2
sav_reg_7 		        .dsb	2
_uneFonction:
.(
lda tmp0: sta sav_reg_0
lda tmp0+1: sta sav_reg_0+1
lda tmp7: sta sav_reg_7
lda tmp7+1: sta sav_reg_7+1
lda #0: sta tmp7: sta tmp7+1
lda _function_input: sta tmp0
lda _function_input+1: sta tmp0+1
#include "function_core.s"
_unefonctionDone
lda tmp7: sta _function_output
lda tmp7+1: sta _function_output+1
lda sav_reg_0: sta tmp0: 
lda sav_reg_0+1: sta tmp0+1: 
lda sav_reg_7: sta tmp7: 
lda sav_reg_7+1: sta tmp7+1: 
.):
rts
