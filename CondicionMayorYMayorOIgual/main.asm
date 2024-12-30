
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
    MOVLW   0x0a        ; W=0x0b=11
    SUBWF   PORTA,  W   ; W=PORTA-W=PORTA-11
    BTFSS   STATUS, 0   ; if STATUS(0)(Carry flag) == 0 then
        call if1
    BTFSC   STATUS, 0   ; if STATUS(0)(Carry flag) == 1 then
        call else1
    MOVLW   0x26        ; W=0x0b=11
    SUBWF   PORTA,  W   ; W=PORTA-W=PORTA-11
    BTFSS   STATUS, 0   ; if STATUS(0)(Carry flag) == 0 then
        call if2
    BTFSC   STATUS, 0   ; if STATUS(0)(Carry flag) == 1 then
        call else2
    
    RETURN

if1:
    MOVLW   0xf0        ; W=0x0f
    ANDWF   PORTB, W    ; 
    MOVWF   PORTB       ; PORTB=W=0x0f
    RETURN
else1:
    MOVLW   0x0f        ; W=0x00
    IORWF   PORTB, W    ;
    MOVWF   PORTB       ; PORTB=W=0x00
    RETURN
if2:
    MOVLW   0x0f        ; W=0x0f
    ANDWF   PORTB, W    ;
    MOVWF   PORTB       ; PORTB=W=0x0f
    RETURN
else2:
    MOVLW   0xf0        ; W=0x00
    IORWF   PORTB, W    ;
    MOVWF   PORTB       ; PORTB=W=0x00
    RETURN

    END     main