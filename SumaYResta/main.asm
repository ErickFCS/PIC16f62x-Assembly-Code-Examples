
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

numA equ 0x20
numB equ 0x21

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
    BSF     TRISA,  5   ; pinMode RA5 to input(1)

    BCF     STATUS, 6   ; set RP6 to 0
    BCF     STATUS, 5   ; set RP5 to 0          Now in bank 0

    MOVLW   0x07        ; W=0x07
    MOVWF   0x1f        ; CMCOM=W=0x07

    MOVLW   0x00        ; W=0x00
    MOVWF   PORTB       ; PORTB=W=0xff -> all to 0

    MOVLW   0x1a        ; W=0x00
    MOVWF   numA        ; numA=W=0x1a=26

    MOVLW   0x06        ; W=0x00
    MOVWF   numB        ; numB=W=0x06=6

    RETURN
work:
    BTFSC   PORTA, 5    ; if RB5 == 1 then:
        call if1
    BTFSS   PORTA, 5    ; if RB5 == 0 then:
        call else1
    RETURN

if1:
    MOVF    numA, W     ; W=numA
    ADDWF   numB, W     ; W=W+numB=numA+numB
    ;MOVF    STATUS, W
    ;ANDLW   0x07              
    MOVWF   PORTB       ; PORTB=W=numA+numB
    RETURN
else1:
    MOVF    numB, W     ; W=numA
    SUBWF   numA, W     ; W=numA-W=numA-numB
    ;MOVF    STATUS, W
    ;ANDLW   0x07              
    MOVWF   PORTB       ; PORTB=W=numA-numB
    RETURN

    END     main