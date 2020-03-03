#define ayc_Register $FF
#define ayc_Inactive $DD
#define ayc_Write    $FD
#define ayc_Read     $DF
;
#define via_portb    $0300
#define via_porta_hs $0301
#define via_ddrb     $0302
#define via_ddra     $0303
#define via_t1cl     $0304
#define via_t1ch     $0305
#define via_t1ll     $0306
#define via_t1lh     $0307
#define via_t2cl     $0308
#define via_t2ll     $0308
#define via_t2ch     $0309
#define via_sr       $030A
#define via_acr      $030B
#define via_pcr      $030C
#define via_ifr      $030D
#define via_ier      $030E
#define via_porta    $030F
;
#define dkt_LeftJoy  $0310
#define dkt_RightJoy $0320
;
#define via2_portb    $0320
#define via2_porta_hs $0321
#define via2_ddrb     $0322
#define via2_ddra     $0323
#define via2_t1cl     $0324
#define via2_t1ch     $0325
#define via2_t1ll     $0326
#define via2_t1lh     $0327
#define via2_t2cl     $0328
#define via2_t2ll     $0328
#define via2_t2ch     $0329
#define via2_sr       $032A
#define via2_acr      $032B
#define via2_pcr      $032C
#define via2_ifr      $032D
#define via2_ier      $032E
#define via2_porta    $032F
;
#define fdc_Command   $0310
#define fdc_Status    $0310
#define fdc_Track     $0311
#define fdc_Sector    $0312
#define fdc_Data      $0313
#define fdc_Control   $0314
#define fdc_DRQState  $0318
;
#define jsm_Command   $03F4
#define jsm_Status    $03F4
#define jsm_Track     $03F5
#define jsm_Sector    $03F6
#define jsm_Data      $03F7
#define jsm_Side      $03F8 ;B0 Side 0(0) or 1(1)
#define jsm_FDCReset  $03F9 ;Write any value
#define jsm_Overlay   $03FA ;B0 Overlay(1)
#define jsm_ROMDIS    $03FB ;B0 Disable ROM(1)
#define jsm_DriveA    $03FC ;Write any Value
#define jsm_DriveB    $03FD ;Write any Value
#define jsm_DriveC    $03FE ;Write any Value
#define jsm_DriveD    $03FF ;Write any Value