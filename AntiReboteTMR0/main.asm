
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

TMR0 equ 0x01
OPTION_REG equ 0x81
help equ 0x20


main:
    PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
	ORG		0x00

    call init
loop:
    call work
    GOTO loop
init:
    BSF     STATUS, 5       ; set RP5 to 1          Now in bank 1

    MOVLW   0x00
    MOVWF   TRISB
    BSF     TRISA,  5

    BCF     OPTION_REG, 5   ; OPTION_REG(5)=0       T0CS=0
    BCF     OPTION_REG, 3   ; OPTION_REG(3)=0       PSA=0

    BCF     STATUS, 5       ; set RP5 to 0          Now in bank 0

    MOVLW   0x07        ; W=0x07
    MOVWF   0x1f        ; CMCOM=W=0x07

    BCF     PORTB,  0       ; set RB0 to 0
    MOVLW   0x02            ; w=0x02
    MOVWF   help            ; help=w=0x02

    RETURN
work:

    BTFSS   PORTA,  5       ; if RA(5)==0 then:
        CALL if1
    BTFSC   INTCON, 2       ; if T0IF==1 then:
        CALL    if2
    BTFSC   INTCON, 2       ; if T0IF==1 then:
        CALL    if3
    MOVF    help,   F
    BTFSC   STATUS, 2         ; if ZF == 1 then:
        CALL    if4
        
    RETURN

if1:
    MOVLW   0x02
    MOVWF   help
    RETURN
if2:
;    BCF     INTCON, 2
    MOVLW   0xd9            ; w=0xd9
    MOVWF   TMR0            ; TMR0=w=0xd9
    MOVF    help,   F
    BTFSS   STATUS, 2       ; if ZF==0 then:
        DECF    help,   F   
    RETURN
if3:
    BCF     INTCON, 2
    RETURN
if4:
    INCF    PORTB,  F
    MOVLW   0x02
    MOVWF   help
    RETURN

    END     main