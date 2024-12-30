
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

    call init
loop:
    call work
    GOTO loop
init:
    BCF     STATUS, 6   ; set RP6 to 0
    BSF     STATUS, 5   ; set RP5 to 1          Now in bank 1

    BSF     TRISA, 4    ; pinMode RA4 input(1)
    BSF     TRISA, 5    ; pinMode RA5 input(1)
    BCF     TRISB, 1    ; pinMode RB1 output(0)
    BCF     TRISB, 2    ; pinMode RB2 output(0)
    BCF     TRISB, 7    ; pinMode RB7 output(0)

    BCF     STATUS, 6   ; set RP6 to 0
    BCF     STATUS, 5   ; set RP5 to 0          Now in bank 0

    BCF     PORTB, 1    ; set RB1 to 0
    BCF     PORTB, 2    ; set RB2 to 0
    BCF     PORTB, 7    ; set RB7 to 0
    RETURN
work:
    BTFSC   PORTA, 4    ; is RA4 == 1 then
        call if1
    BTFSS   PORTA, 4    ; is RA4 == 0 then
        call else1
    RETURN
if1:
    BCF     PORTB, 1    ; set RB1 to 0
    BCF     PORTB, 2    ; set RB2 to 0
    BCF     PORTB, 7    ; set RB7 to 0
    RETURN

else1:
    BTFSC PORTA, 5  ; is RA5 == 1 then
        call if2
    RETURN

if2:
    BSF     PORTB, 1    ; set RB1 to 1
    BSF     PORTB, 2    ; set RB2 to 1
    BSF     PORTB, 7    ; set RB7 to 1
    RETURN

    END     main