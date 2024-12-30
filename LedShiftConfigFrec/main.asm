
PROCESSOR 16F628A

CONFIG FOSC = INTOSCIO	    ; Oscilador interno
CONFIG WDTE = OFF	        ; WDT desactivado
CONFIG PWRTE = OFF	        ; PWRT desactivado
CONFIG MCLRE = OFF	        ; RA5 como I/O
CONFIG BOREN = ON	        ; BOD activado
CONFIG LVP = OFF	        ; RB4 como I/O
CONFIG CPD = OFF	        ; Protección de datos desactivada
CONFIG CP = OFF		        ; Protección de código desactivada

#include <xc.inc>

help equ 0x20
virtualPORTA equ 0x21
virtualOPTION_REG equ 0xa0

W_AUX equ 0x70
STATUS_AUX equ 0x71


main:
    PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
    ORG		0x00
    call init
loop:
    ;call work
    GOTO loop

    PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
	ORG		0x04
    
    MOVWF   W_AUX
    SWAPF   STATUS, W
    MOVWF   STATUS_AUX
    BCF     STATUS, 6
    BCF     STATUS, 5

    BTFSC   INTCON, 0
        call interruptRBINT
    BTFSC   INTCON, 2
        call interruptTMR0

    SWAPF   STATUS_AUX, W
    MOVWF   STATUS
    SWAPF   W_AUX, F
    SWAPF   W_AUX, w
    RETFIE

;PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
;ORG		0x30
init:
    BSF     STATUS, 5       ; set RP5 to 1          Now in bank 1

    BCF     OPTION_REG, 5   ; OPTION_REG(5)=0       T0CS=0
    BCF     OPTION_REG, 3   ; OPTION_REG(3)=0       PSA=0
    BSF     OPTION_REG, 0   ; OPTION_REG(0)=1       PS0=1
    BSF     OPTION_REG, 1   ; OPTION_REG(1)=1       PS1=1
    BSF     OPTION_REG, 2   ; OPTION_REG(2)=1       PS2=1
    MOVLW   0xe0
    MOVWF   TRISA
    MOVLW   0xf0
    MOVWF   TRISB

    BCF     STATUS, 5       ; set RP5 to 0          Now in bank 0

    MOVLW   0x07        ; W=0x07
    MOVWF   CMCON        ; CMCON=W=0x07

    MOVLW   0x10
    MOVWF   virtualPORTA

    MOVLW   0x00
    MOVWF   PORTA

    BSF     PORTB, 0
    BCF     PORTB, 1

    MOVLW   0x7D            ; w=0x7D (125)
    MOVWF   help            ; help=w=0x7D (125)

    MOVLW   0x83            ; w=0x83 (131 = 256-125)
    MOVWF   TMR0            ; TMR0=w=0x83 (131 = 256-125)

    BCF     INTCON, 2       ; INTCON(2)=T0IF=0
    BSF     INTCON, 5       ; INTCON(5)=T0IE=1
    BCF     INTCON, 0       ; INTCON(0)=RBIF=0
    BSF     INTCON, 3       ; INTCON(3)=RBIE=1
    BSF     INTCON, 7       ; INTCON(7)=GIE=1

    RETURN
work:
    MOVLW   0x03
    XORWF   PORTB, F
    RETURN
interruptTMR0:
    MOVLW   0x03
    XORWF   PORTB, F

    MOVLW   0x83            ; w=0x83 (131 = 256-125)
    MOVWF   TMR0            ; TMR0=w=0x83 (131 = 256-125)

    BCF     INTCON, 2       ; INTCON(2)=T0IF=0

    DECFSZ  help, F         ; if help - 1 != 0 then:
        RETURN

    BCF     virtualPORTA, 5
    BTFSC   virtualPORTA, 0
        BSF     virtualPORTA, 5
    RRF     virtualPORTA, W
    MOVWF   virtualPORTA
    XORLW   0x10
    MOVWF   PORTA

    MOVLW   0x7D            ; w=0x7D (125)
    MOVWF   help            ; help=w=0x7D (125)
    RETURN
interruptRBINT:
    MOVF    PORTB, W
    ANDLW   0x70
    BTFSC STATUS, 2
        RETURN
    BTFSC   PORTB, 4
        MOVLW   0x06
    BTFSC   PORTB, 5
        MOVLW   0x04
    BTFSC   PORTB, 6
        MOVLW   0x02
    BTFSC   PORTB, 0
        ADDLW   0x01

    BSF     STATUS, 5       ; set RP5 to 1          Now in bank 1

    MOVWF   virtualOPTION_REG
    MOVF    OPTION_REG, W
    ANDLW   0xf8
    IORWF   virtualOPTION_REG, W
    MOVWF   OPTION_REG

    BCF     STATUS, 5       ; set RP5 to 0          Now in bank 0

    MOVF    PORTB,  F
    BCF     INTCON, 0

    RETURN
    END     main