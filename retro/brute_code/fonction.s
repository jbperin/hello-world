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
#define BIT_16   1
#define BIT_17   2
#define BIT_18   4
#define BIT_19   8
#define BIT_20  16
#define BIT_21  32
#define BIT_22  64
#define BIT_23 128
_function_input_0        .dsb	2
_function_input_1        .dsb	2
_function_output 		.dsb	2
sav_reg_0 		        .dsb	2
sav_reg_1 		        .dsb	2
sav_reg_7 		        .dsb	2
_uneFonction:
.(
lda tmp0: sta sav_reg_0
lda tmp0+1: sta sav_reg_0+1
lda tmp1: sta sav_reg_1
lda tmp1+1: sta sav_reg_1+1
lda tmp7: sta sav_reg_7
lda tmp7+1: sta sav_reg_7+1
lda #0: sta tmp7: sta tmp7+1
lda _function_input_0: sta tmp0
lda _function_input_0+1: sta tmp0+1
lda _function_input_1: sta tmp1
lda _function_input_1+1: sta tmp1+1
#include "function_core_opt.s"
_unefonctionDone
lda tmp7: sta _function_output
lda tmp7+1: sta _function_output+1
lda sav_reg_0: sta tmp0: 
lda sav_reg_0+1: sta tmp0+1: 
lda sav_reg_1: sta tmp1: 
lda sav_reg_1+1: sta tmp1+1: 
lda sav_reg_7: sta tmp7: 
lda sav_reg_7+1: sta tmp7+1: 
.):
rts
