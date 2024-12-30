
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

index equ 0x20

main:
    PSECT por_vec, global, class=CODE, delta=2, abs, ovrld
    ORG 0x00

    call init
loop:
    call work
    GOTO loop
init:
    BSF     STATUS, 5       ; set RP5 to 1          Now in bank 1

    MOVLW   0x00            ; w=0x00
    MOVWF   TRISB           ; trisb=w=0x00 pinmode trisb output(0)
    MOVLW   0xff            ; w=0x00
    MOVWF   TRISA           ; trisb=w=0x00 pinmode trisa input(1)

    BCF     STATUS, 5       ; set RP5 to 0          Now in bank 0

    MOVLW   0x07        ; W=0x07
    MOVWF   0x1f        ; CMCOM=W=0x07

    MOVLW   0x00        ; W=0x00
    MOVWF   index       ; index=W=0x00

    RETURN
work:

    MOVF    PORTA, W        ; W=PORTA
    ANDLW   0x07            ; and(0x07, W=PORTA)
    MOVWF   index           ; index=w
    call    table           ; W=table(index)
    MOVWF   PORTB           ; PORTB=W

    RETURN
PSECT table, global, class=CODE, delta=2, abs, ovrld
    ORG 0x200
table:
    MOVLW   high(table)
    MOVWF   PCLATH
    MOVF    index, W
    ADDWF   PCL, F
    RETLW   0x6a
    RETLW   0x39
    RETLW   0xde
    RETLW   0x88
    RETLW   0xd7
    RETLW   0xe6
    RETLW   0x25
    RETLW   0xed
    END     main