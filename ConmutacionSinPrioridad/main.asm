
PROCESSOR 16F628A

CONFIG FOSC = INTOSCIO	; Oscilador interno
CONFIG WDTE = OFF	    ; WDT desactivado
CONFIG PWRTE = OFF	    ; PWRT desactivado
CONFIG MCLRE = OFF	    ; RA5 como I/O
CONFIG BOREN = ON	    ; BOD activado
CONFIG LVP = OFF	    ; RB4 como I/O
CONFIG CPD = OFF	    ; Protección de datos desactivada
CONFIG CP = OFF		    ; Protección de código desactivada

#include <xc.inc>

main:
    PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
	ORG		0x00

    BCF     STATUS, 6   ; set RP6 to 0
    BSF     STATUS, 5   ; set RP5 to 1

    BSF     TRISB, 1    ; pinMode RB1 input(1)
    BCF     TRISB, 2    ; pinMode RB2 output(0)

    BCF     STATUS, 6   ; set RP6 to 0
    BCF     STATUS, 5   ; set RP5 to 0

    BSF     PORTB, 2    ; set RB2 to 1

loop:
    BTFSS   PORTB, 1    ; is RB1 == 0 then
        BSF PORTB, 2    ; set RB2 to 1
    BTFSC   PORTB, 1    ; is RB1 == 1 then
        BCF PORTB, 2    ; set RB2 to 0
    GOTO loop

    END     main