
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

delay1msCounter equ 0x20
delay200msCounter equ 0x21
delay1sCounter equ 0x22

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

    BCF     TRISA,  5   ; pinMode RA5 output(0)

    BCF     STATUS, 6   ; set RP6 to 0
    BCF     STATUS, 5   ; set RP5 to 0          Now in bank 0

    MOVLW   00000000B   ; W=0x00
    MOVWF   PORTB       ; PORTB=W=0x00

    RETURN
work:
    call delay200ms
    BTFSC   PORTA,  5   ; is RA5 == 1 then
        INCF    PORTB,  F   ; PORTB += 1
    RETURN

; cant = (1000uS - 28uS - 32uS) / 12uS = 78
; 28uS (default delay)
; 32uS (first iteration)
; 12uS (per iteration)
delay1ms:                       ;2MC
    MOVLW   79                  ;1MC
    MOVWF   delay1msCounter     ;1MC
delay1msHelp:
    DECFSZ delay1msCounter, F   ;1MC --> 2MC
        GOTO delay1msHelp       ;2MC
    RETURN                      ;2MC

delay200ms:
    MOVLW   200
    MOVWF   delay200msCounter
delay200msHelp:
    CALL delay1ms
    DECFSZ delay200msCounter, F
        GOTO delay200msHelp
    RETURN

    END     main