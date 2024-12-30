
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

TMR0 equ 0x01
OPTION_REG equ 0x81
help equ 0x20

W_AUX equ 0x70
STATUS_AUX equ 0x71


main:
    PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
    ORG		0x00
    call init
loop:
    ;nop
    ;nop
    GOTO loop

    PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
	ORG		0x04
    
    MOVWF   W_AUX
    SWAPF   STATUS, W
    MOVWF   STATUS_AUX
    BCF     STATUS, 6
    BCF     STATUS, 5

    call interrupt

    SWAPF   STATUS_AUX, W
    MOVWF   STATUS
    SWAPF   W_AUX, F
    SWAPF   W_AUX, w
    RETFIE

;PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
;ORG		0x30
init:
    BSF     STATUS, 5       ; set RP5 to 1          Now in bank 1

    BCF     TRISB,  0       ; pinMode RB0 output(0)
    BCF     OPTION_REG, 5   ; OPTION_REG(5)=0       T0CS=0
    BCF     OPTION_REG, 3   ; OPTION_REG(3)=0       PSA=0

    BCF     STATUS, 5       ; set RP5 to 0          Now in bank 0

    MOVLW   0x07        ; W=0x07
    MOVWF   CMCON        ; CMCON=W=0x07

    BCF     PORTB,  0       ; set RB0 to 0
    MOVLW   0x02            ; w=0x02
    MOVWF   help            ; help=w=0x02

    BSF     INTCON, 5       ; INTCON(2)=T0IF=0
    BSF     INTCON, 7       ; INTCON(2)=T0IF=0

    RETURN
interrupt:
    MOVLW   0x3d            ; w=0x3d
    MOVWF   TMR0            ; TMR0=w=0x3d

    BCF     INTCON, 2       ; INTCON(2)=T0IF=0

    DECFSZ  help, F         ; if help - 1 != 0 then:
        RETURN

    MOVLW   0x01            ; w=0x01
    XORWF   PORTB,  F       ; RB0 = !RB0
    MOVLW   0x02            ; w=0x02
    MOVWF   help            ; help=w=0x02
    RETURN
    END     main