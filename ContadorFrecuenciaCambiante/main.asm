
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
help2 equ 0x21

main:
    PSECT	por_vec, global, class=CODE, delta=2, abs, ovrld
	ORG		0x00

    call init
loop:
    call work
    GOTO loop
init:
    BSF     STATUS, 5       ; set RP5 to 1          Now in bank 1

    MOVLW   0x00            ; w=0x00
    MOVWF   TRISB           ; trisb=w=0x00 pinmode trisb output(0)
    BCF     OPTION_REG, 5   ; OPTION_REG(5)=0       T0CS=0
    BCF     OPTION_REG, 3   ; OPTION_REG(3)=0       PSA=0

    BCF     STATUS, 5       ; set RP5 to 0          Now in bank 0

    MOVLW   0x07        ; W=0x07
    MOVWF   0x1f        ; CMCOM=W=0x07

    MOVLW   0x10        ; W=0x10
    MOVWF   help2        ; help2=W=0x10

    MOVLW   0x14            ; w=0x14
    MOVWF   help            ; help=w=0x14

    CLRF    PORTB

    RETURN
work:

    BTFSS   INTCON, 2       ; if INTCON(2)==T0IF==0 then:
        GOTO work

    MOVLW   0x3d            ; w=0x3d
    MOVWF   TMR0            ; TMR0=w=0x3d

    BCF     INTCON, 2       ; INTCON(2)=T0IF=0

    DECF    help, F
    BTFSC   STATUS, 2       ; if Z flag == 1 then:
        CALL if1

    RETURN

if1:
    MOVLW   0x0f            ; w=0x0f
    SUBWF   PORTB,  W       ; w=PORTB-W=PORTB-0x0f
    BTFSS   STATUS, 0       ; if C flag == 0
        CALL if2
    BTFSC   STATUS, 0       ; if C flag == 1
        CALL else2
    MOVLW   0x14            ; w=0x14
    MOVWF   help            ; help=w=0x14
    RETURN
if2:
    INCF    PORTB           ; PORTB += 1
    RETURN
else2:
    BSF     STATUS, 5       ; set RP5 to 1          Now in bank 1
    MOVLW   0x07
    ANDWF   OPTION_REG, W
    SUBLW   0x04
    BTFSS   STATUS, 0       ; if C flag == 0
        CALL if3
    BTFSC   STATUS, 0       ; if C flag == 1
        CALL else3
    BCF     STATUS, 5       ; set RP5 to 0          Now in bank 0
    CLRF    PORTB
    RETURN
if3:
    DECF    OPTION_REG, F
    RETURN
else3:
    MOVLW   0x07
    IORWF   OPTION_REG, F
    RETURN
    END     main