
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

tabla0 equ 0x20
tabla1 equ 0x21
tabla2 equ 0x22
tabla3 equ 0x23
tabla4 equ 0x24
tabla5 equ 0x25
tabla6 equ 0x26
tabla7 equ 0x27
tabla_index equ 0x28

main:
    PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
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

    MOVLW   0x6a        ; W=0x6a
    MOVWF   tabla0      ; tabla0=W=0x6a
    MOVLW   0x39        ; W=0x39
    MOVWF   tabla1      ; tabla1=W=0x39
    MOVLW   0xde        ; W=0xde
    MOVWF   tabla2      ; tabla2=W=0xde
    MOVLW   0x88        ; W=0x88
    MOVWF   tabla3      ; tabla3=W=0x88
    MOVLW   0xd7        ; W=0xd7
    MOVWF   tabla4      ; tabla4=W=0xd7
    MOVLW   0xe6        ; W=0xe6
    MOVWF   tabla5      ; tabla5=W=0xe6
    MOVLW   0x25        ; W=0x25
    MOVWF   tabla6      ; tabla6=W=0x25
    MOVLW   0xed        ; W=0xed
    MOVWF   tabla7      ; tabla7=W=0xed
    MOVLW   0x20        ; W=0xed
    MOVWF   tabla_index ; tabla_index=W=0x20

    RETURN
work:

    MOVF    PORTA, W        ; W=PORTA
    ANDLW   0x07            ; and(0x07, W=PORTA)
    ADDWF   tabla_index, W  ; W=tabla_index+W
    MOVWF   FSR             ; FSR=W
    MOVF    INDF, W         ; W=INDF
    MOVWF   PORTB           ; PORTB=W=INDF

    RETURN

    END     main