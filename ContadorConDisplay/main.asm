
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

table0 equ 0x21
table1 equ 0x22
table2 equ 0x23
table_index equ 0x24
currentIndex equ 0x25
currentChannel equ 0x26

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
    MOVWF   TRISB           ; TRISB=W=0x00 pinmode TRISB output(0)
    ;MOVLW   0x00            ; w=0x00
    ;MOVWF   TRISA           ; TRISA=W=0x00 pinmode TRISA output(0)

    BCF     OPTION_REG, 5   ; OPTION_REG(5)=0       T0CS=0
    BCF     OPTION_REG, 3   ; OPTION_REG(3)=0       PSA=0
    BCF     OPTION_REG, 1   ; OPTION_REG(0)=0       PS0=0

    BCF     STATUS, 5       ; set RP5 to 0          Now in bank 0

    MOVLW   0x07        ; W=0x07
    MOVWF   0x1f        ; CMCON=W=0x07

    MOVLW   0x00        ; W=0x00
    MOVWF   table0      ; table0=W=0x00
    MOVLW   0x00        ; W=0x00
    MOVWF   table1      ; table1=W=0x00
    MOVLW   0x00        ; W=0x00
    MOVWF   table2      ; table2=W=0x00
    MOVLW   0x21        ; W=0x21
    MOVWF   table_index ; table_index=W=0x00
    MOVLW   0x00        ; W=0x00
    MOVWF   currentIndex; currentIndex=W=0x00
    MOVLW   0x00        ; W=0x00
    MOVWF   PORTB       ; PORTB=W=0x00
    MOVLW   0x01            ; W=0x01
    MOVWF   currentChannel  ; currentChannel=W=0x01
    
    MOVLW   0x80            ; W=0x20
    MOVWF   help            ; help=W=0x20

    RETURN
work:

    BTFSS   INTCON, 2       ; if INTCON(2)==T0IF==0 then:
        GOTO work
    MOVLW   0x86            ; w=0x86
    MOVWF   TMR0            ; TMR0=w=0x86
    BCF     INTCON, 2       ; INTCON(2)=T0IF=0

    call changeChannel

    DECFSZ  help, F         ; if help - 1 != 0 then:
        GOTO work
    MOVLW   0x80            ; w=0x20
    MOVWF   help            ; help=w=0x20

    call incrementDisplay

    RETURN

changeChannel:

    CLRF PORTB              ; PORTB=0x00
    CLRF PORTA              ; PORTA=0x00

    BCF STATUS, 0           ; STATUS(0)=0
    BTFSC currentChannel, 2 ; if currentChannel(2)==1 then:
        BSF STATUS, 0       ; STATUS(1)=1
    RLF currentChannel, F   ; rotate left through carry
    
    MOVLW 0x07              ; W=0x07
    ANDWF currentChannel, F ; and(currentChannel, W)
    SWAPF currentChannel, W ; swap(currentChannel)
    ;MOVF  currentChannel, W
    ;MOVWF PORTB

    BTFSC currentChannel, 0 ; if currentChannel(0)==1 then
        IORWF table0, W
        ;MOVF table0, W
    BTFSC currentChannel, 1 ; if currentChannel(1)==1 then
        IORWF table1, W
        ;MOVF table1, W
    BTFSC currentChannel, 2 ; if currentChannel(2)==1 then
        IORWF table2, W
        ;MOVF table2, W
    MOVWF PORTB
    ;MOVWF PORTA

    RETURN

incrementDisplay:

    MOVF table_index, W
    ADDWF currentIndex, W
    MOVWF FSR
    INCF INDF, F

    MOVLW 0x02
    SUBWF currentIndex, W
    BTFSC STATUS, 2
        call limit200

    MOVLW 0x0a
    SUBWF INDF, W
    BTFSS STATUS, 2
        RETURN

    CLRF INDF
    INCF currentIndex, F
    MOVLW 0x03
    SUBWF currentIndex, W
    BTFSS STATUS, 2
        call incrementDisplay
    CLRF currentIndex

    RETURN

limit200:

    MOVLW 0x02
    SUBWF INDF, W
    BTFSS STATUS, 2
        RETURN
    MOVLW 0x0a
    MOVWF INDF

    RETURN

    
    END     main