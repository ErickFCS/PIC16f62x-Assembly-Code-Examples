
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

W_AUX equ 0x70
STATUS_AUX equ 0x71

main:
    PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
    ORG		0x00
    call init
loop:
    call work
    GOTO loop

    PSECT	interrupts, global, class=CODE, delta=2, abs, ovrld
    ORG		0x04
    
    MOVWF   W_AUX
    SWAPF   STATUS, W
    MOVWF   STATUS_AUX
    BCF     STATUS, 6
    BCF     STATUS, 5

    call RBinterrupt

    MOVF    PORTB,  F
    BCF     INTCON, 0

    SWAPF   STATUS_AUX, W
    MOVWF   STATUS
    SWAPF   W_AUX, F
    SWAPF   W_AUX, w
    RETFIE

    ;PSECT	ruts, global, class=CODE, delta=2, abs, ovrld
    ;ORG		0x30
init:
    BSF     STATUS, 5       ; set RP5 to 1          Now in bank 1

    MOVLW   0x7C
    MOVWF   TRISB
    MOVLW   0xF0
    MOVWF   TRISA

    BCF     STATUS, 5       ; set RP5 to 0          Now in bank 0

    MOVLW   0x07        ; W=0x07
    MOVWF   CMCON        ; CMCON=W=0x07

    BCF     PORTB,  0       ; set RB0 to 1
    BSF     PORTB,  1       ; set RB1 to 0

    BSF     INTCON, 3       ; INTCON(3)=RBIE=1
    BSF     INTCON, 7       ; INTCON(7)=GIE=1

    RETURN
work:
    ;MOVLW   0x03
    ;XORWF   PORTB, F
    RETURN

RBinterrupt:

    BTFSC   PORTB, 4
        goto option1
    BTFSC   PORTB, 5
        goto option2
    BTFSC   PORTB, 6
        goto option3
    goto endSwitch1
option1:
    BTFSC   PORTB, 0
        MOVLW   0x00
    BTFSC   PORTB, 1
        MOVLW   0x01
    MOVWF   PORTA
    goto endSwitch1
option2:
    BTFSC   PORTB, 0
        MOVLW   0x02
    BTFSC   PORTB, 1
        MOVLW   0x03
    MOVWF   PORTA
    goto endSwitch1
option3:
    BTFSC   PORTB, 0
        MOVLW   0x04
    BTFSC   PORTB, 1
        MOVLW   0x05
    MOVWF   PORTA
    goto endSwitch1
endSwitch1:

    MOVF    PORTB,  F
    BCF     INTCON, 0

    RETURN

    END     main