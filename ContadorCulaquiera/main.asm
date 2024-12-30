
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
help2 equ 0x21

main:
    PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
	ORG		0x00

    call init
loop:
    call work
    GOTO loop
init:
    BSF     STATUS, 5       ; set RP5 to 1          Now in bank 1

    MOVLW   0x00            ; w=0x00
    MOVWF   TRISB           ; trisb=w=0x00 pinmode trisb output(0)
    MOVLW   0x00            ; w=0x00
    MOVWF   TRISA           ; trisb=w=0x00 pinmode trisb output(0)
    BCF     OPTION_REG, 5   ; OPTION_REG(5)=0       T0CS=0
    BCF     OPTION_REG, 3   ; OPTION_REG(3)=0       PSA=0

    BCF     STATUS, 5       ; set RP5 to 0          Now in bank 0

    MOVLW   0x07        ; W=0x07
    MOVWF   0x1f        ; CMCOM=W=0x07

    MOVLW   0x10        ; W=0x10
    MOVWF   help2        ; help2=W=0x10

    MOVLW   0x06            ; w=0x06
    MOVWF   help            ; help=w=0x06

    CLRF    PORTB

    RETURN
work:

    BTFSS   INTCON, 2       ; if INTCON(2)==T0IF==0 then:
        GOTO work

    MOVLW   0x3d            ; w=0x3d
    MOVWF   TMR0            ; TMR0=w=0x3d

    BCF     INTCON, 2       ; INTCON(2)=T0IF=0

    DECFSZ  help, F         ; if help - 1 != 0 then:
        GOTO work

    INCF    PORTB,  W
    SUBWF   help2,  W

    BTFSS   STATUS, 2
        INCF    PORTB,  F
    BTFSC   STATUS, 2
        CLRF    PORTB
        

    MOVLW   0x06            ; w=0x06
    MOVWF   help            ; help=w=0x06

    RETURN

    END     main