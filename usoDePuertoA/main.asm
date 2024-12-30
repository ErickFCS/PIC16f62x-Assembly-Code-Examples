
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
    goto loop
init:
    BCF     STATUS, 6   ; set RP6 to 0
    BSF     STATUS, 5   ; set RP5 to 1          Now in bank 1

    BSF     TRISA, 0    ; pinMode RA0 input(1)
    BSF     TRISA, 1    ; pinMode RA1 input(1)
    BCF     TRISA, 3    ; pinMode RA3 output(0)

    BCF     STATUS, 6   ; set RP6 to 0
    BCF     STATUS, 5   ; set RP5 to 0          Now in bank 0

    BCF     PORTA, 3    ; set RA2 to 0
    RETURN
work:
    BTFSC   PORTA, 1    ; is RA1 == 1 then
        BCF PORTA, 3    ; set RA3 to 0
    BTFSS   PORTA, 1    ; is RA1 == 0 then
        call else1
    RETURN
else1:
    BTFSC PORTA, 0  ; is RA0 == 1 then
        BSF PORTA, 3    ; set RA3 to 1
    RETURN

    END     main