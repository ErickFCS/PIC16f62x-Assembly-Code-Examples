# 1 "main.asm"
# 1 "<built-in>" 1
# 1 "main.asm" 2

PROCESSOR 16F628A

CONFIG FOSC = INTOSCIO ; Oscilador interno
CONFIG WDTE = OFF ; WDT desactivado
CONFIG PWRTE = OFF ; PWRT desactivado
CONFIG MCLRE = OFF ; RA5 como I/O
CONFIG BOREN = ON ; BOD activado
CONFIG LVP = OFF ; RB4 como I/O
CONFIG CPD = OFF ; Protección de datos desactivada
CONFIG CP = OFF ; Protección de código desactivada


# 1 "D:\\USER\\MyPrograms\\X8Compiller\\pic\\include\\xc.inc" 1 3






# 1 "D:\\USER\\MyPrograms\\X8Compiller\\pic\\include\\pic.inc" 1 3



# 1 "D:\\USER\\MyPrograms\\X8Compiller\\pic\\include\\pic_as_chip_select.inc" 1 3
# 2353 "D:\\USER\\MyPrograms\\X8Compiller\\pic\\include\\pic_as_chip_select.inc" 3
# 1 "D:\\USER\\MyPrograms\\X8Compiller\\pic\\include\\proc\\pic16f628a.inc" 1 3
# 47 "D:\\USER\\MyPrograms\\X8Compiller\\pic\\include\\proc\\pic16f628a.inc" 3
INDF equ 0000h



TMR0 equ 0001h



PCL equ 0002h



STATUS equ 0003h

STATUS_C_POSN equ 0000h
STATUS_C_POSITION equ 0000h
STATUS_C_SIZE equ 0001h
STATUS_C_LENGTH equ 0001h
STATUS_C_MASK equ 0001h
STATUS_DC_POSN equ 0001h
STATUS_DC_POSITION equ 0001h
STATUS_DC_SIZE equ 0001h
STATUS_DC_LENGTH equ 0001h
STATUS_DC_MASK equ 0002h
STATUS_Z_POSN equ 0002h
STATUS_Z_POSITION equ 0002h
STATUS_Z_SIZE equ 0001h
STATUS_Z_LENGTH equ 0001h
STATUS_Z_MASK equ 0004h
STATUS_nPD_POSN equ 0003h
STATUS_nPD_POSITION equ 0003h
STATUS_nPD_SIZE equ 0001h
STATUS_nPD_LENGTH equ 0001h
STATUS_nPD_MASK equ 0008h
STATUS_nTO_POSN equ 0004h
STATUS_nTO_POSITION equ 0004h
STATUS_nTO_SIZE equ 0001h
STATUS_nTO_LENGTH equ 0001h
STATUS_nTO_MASK equ 0010h
STATUS_RP_POSN equ 0005h
STATUS_RP_POSITION equ 0005h
STATUS_RP_SIZE equ 0002h
STATUS_RP_LENGTH equ 0002h
STATUS_RP_MASK equ 0060h
STATUS_IRP_POSN equ 0007h
STATUS_IRP_POSITION equ 0007h
STATUS_IRP_SIZE equ 0001h
STATUS_IRP_LENGTH equ 0001h
STATUS_IRP_MASK equ 0080h
STATUS_RP0_POSN equ 0005h
STATUS_RP0_POSITION equ 0005h
STATUS_RP0_SIZE equ 0001h
STATUS_RP0_LENGTH equ 0001h
STATUS_RP0_MASK equ 0020h
STATUS_RP1_POSN equ 0006h
STATUS_RP1_POSITION equ 0006h
STATUS_RP1_SIZE equ 0001h
STATUS_RP1_LENGTH equ 0001h
STATUS_RP1_MASK equ 0040h
STATUS_CARRY_POSN equ 0000h
STATUS_CARRY_POSITION equ 0000h
STATUS_CARRY_SIZE equ 0001h
STATUS_CARRY_LENGTH equ 0001h
STATUS_CARRY_MASK equ 0001h
STATUS_ZERO_POSN equ 0002h
STATUS_ZERO_POSITION equ 0002h
STATUS_ZERO_SIZE equ 0001h
STATUS_ZERO_LENGTH equ 0001h
STATUS_ZERO_MASK equ 0004h



FSR equ 0004h



PORTA equ 0005h

PORTA_RA0_POSN equ 0000h
PORTA_RA0_POSITION equ 0000h
PORTA_RA0_SIZE equ 0001h
PORTA_RA0_LENGTH equ 0001h
PORTA_RA0_MASK equ 0001h
PORTA_RA1_POSN equ 0001h
PORTA_RA1_POSITION equ 0001h
PORTA_RA1_SIZE equ 0001h
PORTA_RA1_LENGTH equ 0001h
PORTA_RA1_MASK equ 0002h
PORTA_RA2_POSN equ 0002h
PORTA_RA2_POSITION equ 0002h
PORTA_RA2_SIZE equ 0001h
PORTA_RA2_LENGTH equ 0001h
PORTA_RA2_MASK equ 0004h
PORTA_RA3_POSN equ 0003h
PORTA_RA3_POSITION equ 0003h
PORTA_RA3_SIZE equ 0001h
PORTA_RA3_LENGTH equ 0001h
PORTA_RA3_MASK equ 0008h
PORTA_RA4_POSN equ 0004h
PORTA_RA4_POSITION equ 0004h
PORTA_RA4_SIZE equ 0001h
PORTA_RA4_LENGTH equ 0001h
PORTA_RA4_MASK equ 0010h
PORTA_RA5_POSN equ 0005h
PORTA_RA5_POSITION equ 0005h
PORTA_RA5_SIZE equ 0001h
PORTA_RA5_LENGTH equ 0001h
PORTA_RA5_MASK equ 0020h
PORTA_RA6_POSN equ 0006h
PORTA_RA6_POSITION equ 0006h
PORTA_RA6_SIZE equ 0001h
PORTA_RA6_LENGTH equ 0001h
PORTA_RA6_MASK equ 0040h
PORTA_RA7_POSN equ 0007h
PORTA_RA7_POSITION equ 0007h
PORTA_RA7_SIZE equ 0001h
PORTA_RA7_LENGTH equ 0001h
PORTA_RA7_MASK equ 0080h



PORTB equ 0006h

PORTB_RB0_POSN equ 0000h
PORTB_RB0_POSITION equ 0000h
PORTB_RB0_SIZE equ 0001h
PORTB_RB0_LENGTH equ 0001h
PORTB_RB0_MASK equ 0001h
PORTB_RB1_POSN equ 0001h
PORTB_RB1_POSITION equ 0001h
PORTB_RB1_SIZE equ 0001h
PORTB_RB1_LENGTH equ 0001h
PORTB_RB1_MASK equ 0002h
PORTB_RB2_POSN equ 0002h
PORTB_RB2_POSITION equ 0002h
PORTB_RB2_SIZE equ 0001h
PORTB_RB2_LENGTH equ 0001h
PORTB_RB2_MASK equ 0004h
PORTB_RB3_POSN equ 0003h
PORTB_RB3_POSITION equ 0003h
PORTB_RB3_SIZE equ 0001h
PORTB_RB3_LENGTH equ 0001h
PORTB_RB3_MASK equ 0008h
PORTB_RB4_POSN equ 0004h
PORTB_RB4_POSITION equ 0004h
PORTB_RB4_SIZE equ 0001h
PORTB_RB4_LENGTH equ 0001h
PORTB_RB4_MASK equ 0010h
PORTB_RB5_POSN equ 0005h
PORTB_RB5_POSITION equ 0005h
PORTB_RB5_SIZE equ 0001h
PORTB_RB5_LENGTH equ 0001h
PORTB_RB5_MASK equ 0020h
PORTB_RB6_POSN equ 0006h
PORTB_RB6_POSITION equ 0006h
PORTB_RB6_SIZE equ 0001h
PORTB_RB6_LENGTH equ 0001h
PORTB_RB6_MASK equ 0040h
PORTB_RB7_POSN equ 0007h
PORTB_RB7_POSITION equ 0007h
PORTB_RB7_SIZE equ 0001h
PORTB_RB7_LENGTH equ 0001h
PORTB_RB7_MASK equ 0080h



PCLATH equ 000Ah

PCLATH_PCLATH_POSN equ 0000h
PCLATH_PCLATH_POSITION equ 0000h
PCLATH_PCLATH_SIZE equ 0005h
PCLATH_PCLATH_LENGTH equ 0005h
PCLATH_PCLATH_MASK equ 001Fh



INTCON equ 000Bh

INTCON_RBIF_POSN equ 0000h
INTCON_RBIF_POSITION equ 0000h
INTCON_RBIF_SIZE equ 0001h
INTCON_RBIF_LENGTH equ 0001h
INTCON_RBIF_MASK equ 0001h
INTCON_INTF_POSN equ 0001h
INTCON_INTF_POSITION equ 0001h
INTCON_INTF_SIZE equ 0001h
INTCON_INTF_LENGTH equ 0001h
INTCON_INTF_MASK equ 0002h
INTCON_T0IF_POSN equ 0002h
INTCON_T0IF_POSITION equ 0002h
INTCON_T0IF_SIZE equ 0001h
INTCON_T0IF_LENGTH equ 0001h
INTCON_T0IF_MASK equ 0004h
INTCON_RBIE_POSN equ 0003h
INTCON_RBIE_POSITION equ 0003h
INTCON_RBIE_SIZE equ 0001h
INTCON_RBIE_LENGTH equ 0001h
INTCON_RBIE_MASK equ 0008h
INTCON_INTE_POSN equ 0004h
INTCON_INTE_POSITION equ 0004h
INTCON_INTE_SIZE equ 0001h
INTCON_INTE_LENGTH equ 0001h
INTCON_INTE_MASK equ 0010h
INTCON_T0IE_POSN equ 0005h
INTCON_T0IE_POSITION equ 0005h
INTCON_T0IE_SIZE equ 0001h
INTCON_T0IE_LENGTH equ 0001h
INTCON_T0IE_MASK equ 0020h
INTCON_PEIE_POSN equ 0006h
INTCON_PEIE_POSITION equ 0006h
INTCON_PEIE_SIZE equ 0001h
INTCON_PEIE_LENGTH equ 0001h
INTCON_PEIE_MASK equ 0040h
INTCON_GIE_POSN equ 0007h
INTCON_GIE_POSITION equ 0007h
INTCON_GIE_SIZE equ 0001h
INTCON_GIE_LENGTH equ 0001h
INTCON_GIE_MASK equ 0080h
INTCON_TMR0IF_POSN equ 0002h
INTCON_TMR0IF_POSITION equ 0002h
INTCON_TMR0IF_SIZE equ 0001h
INTCON_TMR0IF_LENGTH equ 0001h
INTCON_TMR0IF_MASK equ 0004h
INTCON_TMR0IE_POSN equ 0005h
INTCON_TMR0IE_POSITION equ 0005h
INTCON_TMR0IE_SIZE equ 0001h
INTCON_TMR0IE_LENGTH equ 0001h
INTCON_TMR0IE_MASK equ 0020h



PIR1 equ 000Ch

PIR1_TMR1IF_POSN equ 0000h
PIR1_TMR1IF_POSITION equ 0000h
PIR1_TMR1IF_SIZE equ 0001h
PIR1_TMR1IF_LENGTH equ 0001h
PIR1_TMR1IF_MASK equ 0001h
PIR1_TMR2IF_POSN equ 0001h
PIR1_TMR2IF_POSITION equ 0001h
PIR1_TMR2IF_SIZE equ 0001h
PIR1_TMR2IF_LENGTH equ 0001h
PIR1_TMR2IF_MASK equ 0002h
PIR1_CCP1IF_POSN equ 0002h
PIR1_CCP1IF_POSITION equ 0002h
PIR1_CCP1IF_SIZE equ 0001h
PIR1_CCP1IF_LENGTH equ 0001h
PIR1_CCP1IF_MASK equ 0004h
PIR1_TXIF_POSN equ 0004h
PIR1_TXIF_POSITION equ 0004h
PIR1_TXIF_SIZE equ 0001h
PIR1_TXIF_LENGTH equ 0001h
PIR1_TXIF_MASK equ 0010h
PIR1_RCIF_POSN equ 0005h
PIR1_RCIF_POSITION equ 0005h
PIR1_RCIF_SIZE equ 0001h
PIR1_RCIF_LENGTH equ 0001h
PIR1_RCIF_MASK equ 0020h
PIR1_CMIF_POSN equ 0006h
PIR1_CMIF_POSITION equ 0006h
PIR1_CMIF_SIZE equ 0001h
PIR1_CMIF_LENGTH equ 0001h
PIR1_CMIF_MASK equ 0040h
PIR1_EEIF_POSN equ 0007h
PIR1_EEIF_POSITION equ 0007h
PIR1_EEIF_SIZE equ 0001h
PIR1_EEIF_LENGTH equ 0001h
PIR1_EEIF_MASK equ 0080h



TMR1L equ 000Eh



TMR1H equ 000Fh



T1CON equ 0010h

T1CON_TMR1ON_POSN equ 0000h
T1CON_TMR1ON_POSITION equ 0000h
T1CON_TMR1ON_SIZE equ 0001h
T1CON_TMR1ON_LENGTH equ 0001h
T1CON_TMR1ON_MASK equ 0001h
T1CON_TMR1CS_POSN equ 0001h
T1CON_TMR1CS_POSITION equ 0001h
T1CON_TMR1CS_SIZE equ 0001h
T1CON_TMR1CS_LENGTH equ 0001h
T1CON_TMR1CS_MASK equ 0002h
T1CON_nT1SYNC_POSN equ 0002h
T1CON_nT1SYNC_POSITION equ 0002h
T1CON_nT1SYNC_SIZE equ 0001h
T1CON_nT1SYNC_LENGTH equ 0001h
T1CON_nT1SYNC_MASK equ 0004h
T1CON_T1OSCEN_POSN equ 0003h
T1CON_T1OSCEN_POSITION equ 0003h
T1CON_T1OSCEN_SIZE equ 0001h
T1CON_T1OSCEN_LENGTH equ 0001h
T1CON_T1OSCEN_MASK equ 0008h
T1CON_T1CKPS_POSN equ 0004h
T1CON_T1CKPS_POSITION equ 0004h
T1CON_T1CKPS_SIZE equ 0002h
T1CON_T1CKPS_LENGTH equ 0002h
T1CON_T1CKPS_MASK equ 0030h
T1CON_T1CKPS0_POSN equ 0004h
T1CON_T1CKPS0_POSITION equ 0004h
T1CON_T1CKPS0_SIZE equ 0001h
T1CON_T1CKPS0_LENGTH equ 0001h
T1CON_T1CKPS0_MASK equ 0010h
T1CON_T1CKPS1_POSN equ 0005h
T1CON_T1CKPS1_POSITION equ 0005h
T1CON_T1CKPS1_SIZE equ 0001h
T1CON_T1CKPS1_LENGTH equ 0001h
T1CON_T1CKPS1_MASK equ 0020h



TMR2 equ 0011h



T2CON equ 0012h

T2CON_T2CKPS_POSN equ 0000h
T2CON_T2CKPS_POSITION equ 0000h
T2CON_T2CKPS_SIZE equ 0002h
T2CON_T2CKPS_LENGTH equ 0002h
T2CON_T2CKPS_MASK equ 0003h
T2CON_TMR2ON_POSN equ 0002h
T2CON_TMR2ON_POSITION equ 0002h
T2CON_TMR2ON_SIZE equ 0001h
T2CON_TMR2ON_LENGTH equ 0001h
T2CON_TMR2ON_MASK equ 0004h
T2CON_TOUTPS_POSN equ 0003h
T2CON_TOUTPS_POSITION equ 0003h
T2CON_TOUTPS_SIZE equ 0004h
T2CON_TOUTPS_LENGTH equ 0004h
T2CON_TOUTPS_MASK equ 0078h
T2CON_T2CKPS0_POSN equ 0000h
T2CON_T2CKPS0_POSITION equ 0000h
T2CON_T2CKPS0_SIZE equ 0001h
T2CON_T2CKPS0_LENGTH equ 0001h
T2CON_T2CKPS0_MASK equ 0001h
T2CON_T2CKPS1_POSN equ 0001h
T2CON_T2CKPS1_POSITION equ 0001h
T2CON_T2CKPS1_SIZE equ 0001h
T2CON_T2CKPS1_LENGTH equ 0001h
T2CON_T2CKPS1_MASK equ 0002h
T2CON_TOUTPS0_POSN equ 0003h
T2CON_TOUTPS0_POSITION equ 0003h
T2CON_TOUTPS0_SIZE equ 0001h
T2CON_TOUTPS0_LENGTH equ 0001h
T2CON_TOUTPS0_MASK equ 0008h
T2CON_TOUTPS1_POSN equ 0004h
T2CON_TOUTPS1_POSITION equ 0004h
T2CON_TOUTPS1_SIZE equ 0001h
T2CON_TOUTPS1_LENGTH equ 0001h
T2CON_TOUTPS1_MASK equ 0010h
T2CON_TOUTPS2_POSN equ 0005h
T2CON_TOUTPS2_POSITION equ 0005h
T2CON_TOUTPS2_SIZE equ 0001h
T2CON_TOUTPS2_LENGTH equ 0001h
T2CON_TOUTPS2_MASK equ 0020h
T2CON_TOUTPS3_POSN equ 0006h
T2CON_TOUTPS3_POSITION equ 0006h
T2CON_TOUTPS3_SIZE equ 0001h
T2CON_TOUTPS3_LENGTH equ 0001h
T2CON_TOUTPS3_MASK equ 0040h



CCPR1L equ 0015h



CCPR1H equ 0016h



CCP1CON equ 0017h

CCP1CON_CCP1M_POSN equ 0000h
CCP1CON_CCP1M_POSITION equ 0000h
CCP1CON_CCP1M_SIZE equ 0004h
CCP1CON_CCP1M_LENGTH equ 0004h
CCP1CON_CCP1M_MASK equ 000Fh
CCP1CON_CCP1Y_POSN equ 0004h
CCP1CON_CCP1Y_POSITION equ 0004h
CCP1CON_CCP1Y_SIZE equ 0001h
CCP1CON_CCP1Y_LENGTH equ 0001h
CCP1CON_CCP1Y_MASK equ 0010h
CCP1CON_CCP1X_POSN equ 0005h
CCP1CON_CCP1X_POSITION equ 0005h
CCP1CON_CCP1X_SIZE equ 0001h
CCP1CON_CCP1X_LENGTH equ 0001h
CCP1CON_CCP1X_MASK equ 0020h
CCP1CON_CCP1M0_POSN equ 0000h
CCP1CON_CCP1M0_POSITION equ 0000h
CCP1CON_CCP1M0_SIZE equ 0001h
CCP1CON_CCP1M0_LENGTH equ 0001h
CCP1CON_CCP1M0_MASK equ 0001h
CCP1CON_CCP1M1_POSN equ 0001h
CCP1CON_CCP1M1_POSITION equ 0001h
CCP1CON_CCP1M1_SIZE equ 0001h
CCP1CON_CCP1M1_LENGTH equ 0001h
CCP1CON_CCP1M1_MASK equ 0002h
CCP1CON_CCP1M2_POSN equ 0002h
CCP1CON_CCP1M2_POSITION equ 0002h
CCP1CON_CCP1M2_SIZE equ 0001h
CCP1CON_CCP1M2_LENGTH equ 0001h
CCP1CON_CCP1M2_MASK equ 0004h
CCP1CON_CCP1M3_POSN equ 0003h
CCP1CON_CCP1M3_POSITION equ 0003h
CCP1CON_CCP1M3_SIZE equ 0001h
CCP1CON_CCP1M3_LENGTH equ 0001h
CCP1CON_CCP1M3_MASK equ 0008h



RCSTA equ 0018h

RCSTA_RX9D_POSN equ 0000h
RCSTA_RX9D_POSITION equ 0000h
RCSTA_RX9D_SIZE equ 0001h
RCSTA_RX9D_LENGTH equ 0001h
RCSTA_RX9D_MASK equ 0001h
RCSTA_OERR_POSN equ 0001h
RCSTA_OERR_POSITION equ 0001h
RCSTA_OERR_SIZE equ 0001h
RCSTA_OERR_LENGTH equ 0001h
RCSTA_OERR_MASK equ 0002h
RCSTA_FERR_POSN equ 0002h
RCSTA_FERR_POSITION equ 0002h
RCSTA_FERR_SIZE equ 0001h
RCSTA_FERR_LENGTH equ 0001h
RCSTA_FERR_MASK equ 0004h
RCSTA_ADEN_POSN equ 0003h
RCSTA_ADEN_POSITION equ 0003h
RCSTA_ADEN_SIZE equ 0001h
RCSTA_ADEN_LENGTH equ 0001h
RCSTA_ADEN_MASK equ 0008h
RCSTA_CREN_POSN equ 0004h
RCSTA_CREN_POSITION equ 0004h
RCSTA_CREN_SIZE equ 0001h
RCSTA_CREN_LENGTH equ 0001h
RCSTA_CREN_MASK equ 0010h
RCSTA_SREN_POSN equ 0005h
RCSTA_SREN_POSITION equ 0005h
RCSTA_SREN_SIZE equ 0001h
RCSTA_SREN_LENGTH equ 0001h
RCSTA_SREN_MASK equ 0020h
RCSTA_RX9_POSN equ 0006h
RCSTA_RX9_POSITION equ 0006h
RCSTA_RX9_SIZE equ 0001h
RCSTA_RX9_LENGTH equ 0001h
RCSTA_RX9_MASK equ 0040h
RCSTA_SPEN_POSN equ 0007h
RCSTA_SPEN_POSITION equ 0007h
RCSTA_SPEN_SIZE equ 0001h
RCSTA_SPEN_LENGTH equ 0001h
RCSTA_SPEN_MASK equ 0080h
RCSTA_ADDEN_POSN equ 0003h
RCSTA_ADDEN_POSITION equ 0003h
RCSTA_ADDEN_SIZE equ 0001h
RCSTA_ADDEN_LENGTH equ 0001h
RCSTA_ADDEN_MASK equ 0008h



TXREG equ 0019h



RCREG equ 001Ah



CMCON equ 001Fh

CMCON_CM_POSN equ 0000h
CMCON_CM_POSITION equ 0000h
CMCON_CM_SIZE equ 0003h
CMCON_CM_LENGTH equ 0003h
CMCON_CM_MASK equ 0007h
CMCON_CIS_POSN equ 0003h
CMCON_CIS_POSITION equ 0003h
CMCON_CIS_SIZE equ 0001h
CMCON_CIS_LENGTH equ 0001h
CMCON_CIS_MASK equ 0008h
CMCON_C1INV_POSN equ 0004h
CMCON_C1INV_POSITION equ 0004h
CMCON_C1INV_SIZE equ 0001h
CMCON_C1INV_LENGTH equ 0001h
CMCON_C1INV_MASK equ 0010h
CMCON_C2INV_POSN equ 0005h
CMCON_C2INV_POSITION equ 0005h
CMCON_C2INV_SIZE equ 0001h
CMCON_C2INV_LENGTH equ 0001h
CMCON_C2INV_MASK equ 0020h
CMCON_C1OUT_POSN equ 0006h
CMCON_C1OUT_POSITION equ 0006h
CMCON_C1OUT_SIZE equ 0001h
CMCON_C1OUT_LENGTH equ 0001h
CMCON_C1OUT_MASK equ 0040h
CMCON_C2OUT_POSN equ 0007h
CMCON_C2OUT_POSITION equ 0007h
CMCON_C2OUT_SIZE equ 0001h
CMCON_C2OUT_LENGTH equ 0001h
CMCON_C2OUT_MASK equ 0080h
CMCON_CM0_POSN equ 0000h
CMCON_CM0_POSITION equ 0000h
CMCON_CM0_SIZE equ 0001h
CMCON_CM0_LENGTH equ 0001h
CMCON_CM0_MASK equ 0001h
CMCON_CM1_POSN equ 0001h
CMCON_CM1_POSITION equ 0001h
CMCON_CM1_SIZE equ 0001h
CMCON_CM1_LENGTH equ 0001h
CMCON_CM1_MASK equ 0002h
CMCON_CM2_POSN equ 0002h
CMCON_CM2_POSITION equ 0002h
CMCON_CM2_SIZE equ 0001h
CMCON_CM2_LENGTH equ 0001h
CMCON_CM2_MASK equ 0004h



OPTION_REG equ 0081h

OPTION_REG_PS_POSN equ 0000h
OPTION_REG_PS_POSITION equ 0000h
OPTION_REG_PS_SIZE equ 0003h
OPTION_REG_PS_LENGTH equ 0003h
OPTION_REG_PS_MASK equ 0007h
OPTION_REG_PSA_POSN equ 0003h
OPTION_REG_PSA_POSITION equ 0003h
OPTION_REG_PSA_SIZE equ 0001h
OPTION_REG_PSA_LENGTH equ 0001h
OPTION_REG_PSA_MASK equ 0008h
OPTION_REG_T0SE_POSN equ 0004h
OPTION_REG_T0SE_POSITION equ 0004h
OPTION_REG_T0SE_SIZE equ 0001h
OPTION_REG_T0SE_LENGTH equ 0001h
OPTION_REG_T0SE_MASK equ 0010h
OPTION_REG_T0CS_POSN equ 0005h
OPTION_REG_T0CS_POSITION equ 0005h
OPTION_REG_T0CS_SIZE equ 0001h
OPTION_REG_T0CS_LENGTH equ 0001h
OPTION_REG_T0CS_MASK equ 0020h
OPTION_REG_INTEDG_POSN equ 0006h
OPTION_REG_INTEDG_POSITION equ 0006h
OPTION_REG_INTEDG_SIZE equ 0001h
OPTION_REG_INTEDG_LENGTH equ 0001h
OPTION_REG_INTEDG_MASK equ 0040h
OPTION_REG_nRBPU_POSN equ 0007h
OPTION_REG_nRBPU_POSITION equ 0007h
OPTION_REG_nRBPU_SIZE equ 0001h
OPTION_REG_nRBPU_LENGTH equ 0001h
OPTION_REG_nRBPU_MASK equ 0080h
OPTION_REG_PS0_POSN equ 0000h
OPTION_REG_PS0_POSITION equ 0000h
OPTION_REG_PS0_SIZE equ 0001h
OPTION_REG_PS0_LENGTH equ 0001h
OPTION_REG_PS0_MASK equ 0001h
OPTION_REG_PS1_POSN equ 0001h
OPTION_REG_PS1_POSITION equ 0001h
OPTION_REG_PS1_SIZE equ 0001h
OPTION_REG_PS1_LENGTH equ 0001h
OPTION_REG_PS1_MASK equ 0002h
OPTION_REG_PS2_POSN equ 0002h
OPTION_REG_PS2_POSITION equ 0002h
OPTION_REG_PS2_SIZE equ 0001h
OPTION_REG_PS2_LENGTH equ 0001h
OPTION_REG_PS2_MASK equ 0004h



TRISA equ 0085h

TRISA_TRISA0_POSN equ 0000h
TRISA_TRISA0_POSITION equ 0000h
TRISA_TRISA0_SIZE equ 0001h
TRISA_TRISA0_LENGTH equ 0001h
TRISA_TRISA0_MASK equ 0001h
TRISA_TRISA1_POSN equ 0001h
TRISA_TRISA1_POSITION equ 0001h
TRISA_TRISA1_SIZE equ 0001h
TRISA_TRISA1_LENGTH equ 0001h
TRISA_TRISA1_MASK equ 0002h
TRISA_TRISA2_POSN equ 0002h
TRISA_TRISA2_POSITION equ 0002h
TRISA_TRISA2_SIZE equ 0001h
TRISA_TRISA2_LENGTH equ 0001h
TRISA_TRISA2_MASK equ 0004h
TRISA_TRISA3_POSN equ 0003h
TRISA_TRISA3_POSITION equ 0003h
TRISA_TRISA3_SIZE equ 0001h
TRISA_TRISA3_LENGTH equ 0001h
TRISA_TRISA3_MASK equ 0008h
TRISA_TRISA4_POSN equ 0004h
TRISA_TRISA4_POSITION equ 0004h
TRISA_TRISA4_SIZE equ 0001h
TRISA_TRISA4_LENGTH equ 0001h
TRISA_TRISA4_MASK equ 0010h
TRISA_TRISA5_POSN equ 0005h
TRISA_TRISA5_POSITION equ 0005h
TRISA_TRISA5_SIZE equ 0001h
TRISA_TRISA5_LENGTH equ 0001h
TRISA_TRISA5_MASK equ 0020h
TRISA_TRISA6_POSN equ 0006h
TRISA_TRISA6_POSITION equ 0006h
TRISA_TRISA6_SIZE equ 0001h
TRISA_TRISA6_LENGTH equ 0001h
TRISA_TRISA6_MASK equ 0040h
TRISA_TRISA7_POSN equ 0007h
TRISA_TRISA7_POSITION equ 0007h
TRISA_TRISA7_SIZE equ 0001h
TRISA_TRISA7_LENGTH equ 0001h
TRISA_TRISA7_MASK equ 0080h



TRISB equ 0086h

TRISB_TRISB0_POSN equ 0000h
TRISB_TRISB0_POSITION equ 0000h
TRISB_TRISB0_SIZE equ 0001h
TRISB_TRISB0_LENGTH equ 0001h
TRISB_TRISB0_MASK equ 0001h
TRISB_TRISB1_POSN equ 0001h
TRISB_TRISB1_POSITION equ 0001h
TRISB_TRISB1_SIZE equ 0001h
TRISB_TRISB1_LENGTH equ 0001h
TRISB_TRISB1_MASK equ 0002h
TRISB_TRISB2_POSN equ 0002h
TRISB_TRISB2_POSITION equ 0002h
TRISB_TRISB2_SIZE equ 0001h
TRISB_TRISB2_LENGTH equ 0001h
TRISB_TRISB2_MASK equ 0004h
TRISB_TRISB3_POSN equ 0003h
TRISB_TRISB3_POSITION equ 0003h
TRISB_TRISB3_SIZE equ 0001h
TRISB_TRISB3_LENGTH equ 0001h
TRISB_TRISB3_MASK equ 0008h
TRISB_TRISB4_POSN equ 0004h
TRISB_TRISB4_POSITION equ 0004h
TRISB_TRISB4_SIZE equ 0001h
TRISB_TRISB4_LENGTH equ 0001h
TRISB_TRISB4_MASK equ 0010h
TRISB_TRISB5_POSN equ 0005h
TRISB_TRISB5_POSITION equ 0005h
TRISB_TRISB5_SIZE equ 0001h
TRISB_TRISB5_LENGTH equ 0001h
TRISB_TRISB5_MASK equ 0020h
TRISB_TRISB6_POSN equ 0006h
TRISB_TRISB6_POSITION equ 0006h
TRISB_TRISB6_SIZE equ 0001h
TRISB_TRISB6_LENGTH equ 0001h
TRISB_TRISB6_MASK equ 0040h
TRISB_TRISB7_POSN equ 0007h
TRISB_TRISB7_POSITION equ 0007h
TRISB_TRISB7_SIZE equ 0001h
TRISB_TRISB7_LENGTH equ 0001h
TRISB_TRISB7_MASK equ 0080h



PIE1 equ 008Ch

PIE1_TMR1IE_POSN equ 0000h
PIE1_TMR1IE_POSITION equ 0000h
PIE1_TMR1IE_SIZE equ 0001h
PIE1_TMR1IE_LENGTH equ 0001h
PIE1_TMR1IE_MASK equ 0001h
PIE1_TMR2IE_POSN equ 0001h
PIE1_TMR2IE_POSITION equ 0001h
PIE1_TMR2IE_SIZE equ 0001h
PIE1_TMR2IE_LENGTH equ 0001h
PIE1_TMR2IE_MASK equ 0002h
PIE1_CCP1IE_POSN equ 0002h
PIE1_CCP1IE_POSITION equ 0002h
PIE1_CCP1IE_SIZE equ 0001h
PIE1_CCP1IE_LENGTH equ 0001h
PIE1_CCP1IE_MASK equ 0004h
PIE1_TXIE_POSN equ 0004h
PIE1_TXIE_POSITION equ 0004h
PIE1_TXIE_SIZE equ 0001h
PIE1_TXIE_LENGTH equ 0001h
PIE1_TXIE_MASK equ 0010h
PIE1_RCIE_POSN equ 0005h
PIE1_RCIE_POSITION equ 0005h
PIE1_RCIE_SIZE equ 0001h
PIE1_RCIE_LENGTH equ 0001h
PIE1_RCIE_MASK equ 0020h
PIE1_CMIE_POSN equ 0006h
PIE1_CMIE_POSITION equ 0006h
PIE1_CMIE_SIZE equ 0001h
PIE1_CMIE_LENGTH equ 0001h
PIE1_CMIE_MASK equ 0040h
PIE1_EEIE_POSN equ 0007h
PIE1_EEIE_POSITION equ 0007h
PIE1_EEIE_SIZE equ 0001h
PIE1_EEIE_LENGTH equ 0001h
PIE1_EEIE_MASK equ 0080h



PCON equ 008Eh

PCON_nBOR_POSN equ 0000h
PCON_nBOR_POSITION equ 0000h
PCON_nBOR_SIZE equ 0001h
PCON_nBOR_LENGTH equ 0001h
PCON_nBOR_MASK equ 0001h
PCON_nPOR_POSN equ 0001h
PCON_nPOR_POSITION equ 0001h
PCON_nPOR_SIZE equ 0001h
PCON_nPOR_LENGTH equ 0001h
PCON_nPOR_MASK equ 0002h
PCON_OSCF_POSN equ 0003h
PCON_OSCF_POSITION equ 0003h
PCON_OSCF_SIZE equ 0001h
PCON_OSCF_LENGTH equ 0001h
PCON_OSCF_MASK equ 0008h
PCON_nBO_POSN equ 0000h
PCON_nBO_POSITION equ 0000h
PCON_nBO_SIZE equ 0001h
PCON_nBO_LENGTH equ 0001h
PCON_nBO_MASK equ 0001h
PCON_nBOD_POSN equ 0000h
PCON_nBOD_POSITION equ 0000h
PCON_nBOD_SIZE equ 0001h
PCON_nBOD_LENGTH equ 0001h
PCON_nBOD_MASK equ 0001h



PR2 equ 0092h



TXSTA equ 0098h

TXSTA_TX9D_POSN equ 0000h
TXSTA_TX9D_POSITION equ 0000h
TXSTA_TX9D_SIZE equ 0001h
TXSTA_TX9D_LENGTH equ 0001h
TXSTA_TX9D_MASK equ 0001h
TXSTA_TRMT_POSN equ 0001h
TXSTA_TRMT_POSITION equ 0001h
TXSTA_TRMT_SIZE equ 0001h
TXSTA_TRMT_LENGTH equ 0001h
TXSTA_TRMT_MASK equ 0002h
TXSTA_BRGH_POSN equ 0002h
TXSTA_BRGH_POSITION equ 0002h
TXSTA_BRGH_SIZE equ 0001h
TXSTA_BRGH_LENGTH equ 0001h
TXSTA_BRGH_MASK equ 0004h
TXSTA_SYNC_POSN equ 0004h
TXSTA_SYNC_POSITION equ 0004h
TXSTA_SYNC_SIZE equ 0001h
TXSTA_SYNC_LENGTH equ 0001h
TXSTA_SYNC_MASK equ 0010h
TXSTA_TXEN_POSN equ 0005h
TXSTA_TXEN_POSITION equ 0005h
TXSTA_TXEN_SIZE equ 0001h
TXSTA_TXEN_LENGTH equ 0001h
TXSTA_TXEN_MASK equ 0020h
TXSTA_TX9_POSN equ 0006h
TXSTA_TX9_POSITION equ 0006h
TXSTA_TX9_SIZE equ 0001h
TXSTA_TX9_LENGTH equ 0001h
TXSTA_TX9_MASK equ 0040h
TXSTA_CSRC_POSN equ 0007h
TXSTA_CSRC_POSITION equ 0007h
TXSTA_CSRC_SIZE equ 0001h
TXSTA_CSRC_LENGTH equ 0001h
TXSTA_CSRC_MASK equ 0080h



SPBRG equ 0099h



EEDATA equ 009Ah



EEADR equ 009Bh



EECON1 equ 009Ch

EECON1_RD_POSN equ 0000h
EECON1_RD_POSITION equ 0000h
EECON1_RD_SIZE equ 0001h
EECON1_RD_LENGTH equ 0001h
EECON1_RD_MASK equ 0001h
EECON1_WR_POSN equ 0001h
EECON1_WR_POSITION equ 0001h
EECON1_WR_SIZE equ 0001h
EECON1_WR_LENGTH equ 0001h
EECON1_WR_MASK equ 0002h
EECON1_WREN_POSN equ 0002h
EECON1_WREN_POSITION equ 0002h
EECON1_WREN_SIZE equ 0001h
EECON1_WREN_LENGTH equ 0001h
EECON1_WREN_MASK equ 0004h
EECON1_WRERR_POSN equ 0003h
EECON1_WRERR_POSITION equ 0003h
EECON1_WRERR_SIZE equ 0001h
EECON1_WRERR_LENGTH equ 0001h
EECON1_WRERR_MASK equ 0008h



EECON2 equ 009Dh



VRCON equ 009Fh

VRCON_VR_POSN equ 0000h
VRCON_VR_POSITION equ 0000h
VRCON_VR_SIZE equ 0004h
VRCON_VR_LENGTH equ 0004h
VRCON_VR_MASK equ 000Fh
VRCON_VRR_POSN equ 0005h
VRCON_VRR_POSITION equ 0005h
VRCON_VRR_SIZE equ 0001h
VRCON_VRR_LENGTH equ 0001h
VRCON_VRR_MASK equ 0020h
VRCON_VROE_POSN equ 0006h
VRCON_VROE_POSITION equ 0006h
VRCON_VROE_SIZE equ 0001h
VRCON_VROE_LENGTH equ 0001h
VRCON_VROE_MASK equ 0040h
VRCON_VREN_POSN equ 0007h
VRCON_VREN_POSITION equ 0007h
VRCON_VREN_SIZE equ 0001h
VRCON_VREN_LENGTH equ 0001h
VRCON_VREN_MASK equ 0080h
VRCON_VR0_POSN equ 0000h
VRCON_VR0_POSITION equ 0000h
VRCON_VR0_SIZE equ 0001h
VRCON_VR0_LENGTH equ 0001h
VRCON_VR0_MASK equ 0001h
VRCON_VR1_POSN equ 0001h
VRCON_VR1_POSITION equ 0001h
VRCON_VR1_SIZE equ 0001h
VRCON_VR1_LENGTH equ 0001h
VRCON_VR1_MASK equ 0002h
VRCON_VR2_POSN equ 0002h
VRCON_VR2_POSITION equ 0002h
VRCON_VR2_SIZE equ 0001h
VRCON_VR2_LENGTH equ 0001h
VRCON_VR2_MASK equ 0004h
VRCON_VR3_POSN equ 0003h
VRCON_VR3_POSITION equ 0003h
VRCON_VR3_SIZE equ 0001h
VRCON_VR3_LENGTH equ 0001h
VRCON_VR3_MASK equ 0008h
# 1066 "D:\\USER\\MyPrograms\\X8Compiller\\pic\\include\\proc\\pic16f628a.inc" 3
psect udata_shr,class=COMMON,space=1,noexec
psect udata,class=RAM,space=1,noexec
psect udata_bank0,class=BANK0,space=1,noexec
psect udata_bank1,class=BANK1,space=1,noexec
psect udata_bank2,class=BANK2,space=1,noexec
psect code,class=CODE,space=0,delta=2
psect data,class=STRCODE,space=0,delta=2,noexec
psect edata,class=EEDATA,space=3,delta=2,noexec
# 2353 "D:\\USER\\MyPrograms\\X8Compiller\\pic\\include\\pic_as_chip_select.inc" 2 3
# 4 "D:\\USER\\MyPrograms\\X8Compiller\\pic\\include\\pic.inc" 2 3




stk_offset SET 0
auto_size SET 0


; stack_auto defines a symbol /name/_offset which equates to the
; stack offset of the auto object in question

stack_auto MACRO name, size
name&_offset EQU stk_offset-size
stk_offset SET name&_offset
auto_size SET -stk_offset
ENDM


; stack_param defines a symbol /name/_offset which equates to the
; stack offset of the parameter object in question

stack_param MACRO name, size
name&_offset EQU stk_offset-size
stk_offset SET name&_offset
ENDM


; alloc_stack adjusts the SP to allocate space for auto objects
; it also links in to the btemp symbol so that can be used

alloc_stack MACRO
GLOBAL btemp
addfsr FSR1,auto_size
ENDM


; restore_stack adjusts the SP to remove all auto and parameter
; objects from the stack prior to returning from a function

restore_stack MACRO
addfsr FSR1,stk_offset
stk_offset SET 0
auto_size SET 0
ENDM
# 7 "D:\\USER\\MyPrograms\\X8Compiller\\pic\\include\\xc.inc" 2 3
# 13 "main.asm" 2


numA equ 0x20
numB equ 0x21

main:
    PSECT por_vec, global, class=CODE, delta=2, abs, ovrld
 ORG 0x00

    call init
loop:
    call work
    GOTO loop
init:
    BCF STATUS, 6 ; set RP6 to 0
    BSF STATUS, 5 ; set RP5 to 1 Now in bank 1

    MOVLW 00000000B ; W=0x00
    MOVWF TRISB ; TRISB=W=0x00 -> all output(0)
    BSF TRISA, 5 ; pinMode ((PORTA) and 07Fh), 5 to input(1)

    BCF STATUS, 6 ; set RP6 to 0
    BCF STATUS, 5 ; set RP5 to 0 Now in bank 0

    MOVLW 0x07 ; W=0x07
    MOVWF 0x1f ; CMCOM=W=0x07

    MOVLW 0x00 ; W=0x00
    MOVWF PORTB ; PORTB=W=0xff -> all to 0

    MOVLW 0x1a ; W=0x00
    MOVWF numA ; numA=W=0x1a=26

    MOVLW 0x06 ; W=0x00
    MOVWF numB ; numB=W=0x06=6

    RETURN
work:
    BTFSC PORTA, 5 ; if ((PORTB) and 07Fh), 5 == 1 then:
        call if1
    BTFSS PORTA, 5 ; if ((PORTB) and 07Fh), 5 == 0 then:
        call else1
    RETURN

if1:
    MOVF numA, W ; W=numA
    ADDWF numB, W ; W=W+numB=numA+numB
    ;MOVF STATUS, W
    ;ANDLW 0x07
    MOVWF PORTB ; PORTB=W=numA+numB
    RETURN
else1:
    MOVF numB, W ; W=numA
    SUBWF numA, W ; W=numA-W=numA-numB
    ;MOVF STATUS, W
    ;ANDLW 0x07
    MOVWF PORTB ; PORTB=W=numA-numB
    RETURN

    END main
