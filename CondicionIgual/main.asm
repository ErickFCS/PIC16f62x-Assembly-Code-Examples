
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

    MOVLW   00000000B   ; W=0x00
    MOVWF   TRISB       ; TRISB=W=0x00 -> all output(0)
    MOVLW   11111111B   ; W=0xff
    MOVWF   TRISA       ; TRISA=W=0xff -> all input(1)

    BCF     STATUS, 6   ; set RP6 to 0
    BCF     STATUS, 5   ; set RP5 to 0          Now in bank 0

    MOVLW   0x07        ; W=0x07
    MOVWF   0x1f        ; CMCOM=W=0x07

    MOVLW   0x00        ; W=0x00
    MOVWF   PORTB       ; PORTB=W=0xff -> all to 0

    RETURN
work:
    MOVLW   0x0b        ; W=0x0b=11
    SUBWF   PORTA,  W   ; W=PORTA-W=PORTA-11
    BTFSC   STATUS, 2   ; if STATUS(2)(Zero flag) == 1 then
        call if1
    BTFSS   STATUS, 2   ; if STATUS(2)(Zero flag) == 0 then
        call else1
    
    RETURN

if1:
    MOVLW   0x14        ; W=0x14=20
    MOVWF   PORTB       ; PORTB=W=0x14=20
    RETURN
else1:
    MOVLW   0x0b        ; W=0x0b=11
    MOVWF   PORTB       ; PORTB=W=0x0b=11
    RETURN

    END     main