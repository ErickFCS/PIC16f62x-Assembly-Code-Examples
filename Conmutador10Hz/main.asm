
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
delay100msCounter equ 0x21

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

    BCF     TRISB,  0   ; pinMode RB0 output(0)

    BCF     STATUS, 6   ; set RP6 to 0
    BCF     STATUS, 5   ; set RP5 to 0          Now in bank 0

    BCF     PORTB,  0   ; set RB0 to 0

    RETURN
work:
    CALL delay100ms
    BSF     PORTB,  0   ; set RB0 to 1
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    CALL delay100ms
    BCF     PORTB,  0   ; set RB0 to 0
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

delay100ms:
    MOVLW   100
    MOVWF   delay100msCounter
delay100msHelp:
    CALL delay1ms
    DECFSZ delay100msCounter, F
        GOTO delay100msHelp
    RETURN

    END     main