include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
   prompt1 db 'Enter a decimal number: ', 0
   prompt2 db 0ah, 0dh, 'Binary: ',0      
.CODE
    mov ax, @DATA
    mov ds, ax
    
    lea si, prompt1
    call PRINT_STRING
    call SCAN_NUM
    mov ax, cx
    mov cx, 16
    lea si, prompt2
    call PRINT_STRING
_print:
    shl ax, 1
    jnc _zero
    
    putc '1'
    loop _print
    jmp EXIT
    
_zero:
    putc '0'
    loop _print     
    
EXIT:
    mov ah, 4ch
    int 21h
    
;--------------------DEFINE LIBRARY PROCEDURES--------------------;

    DEFINE_PRINT_STRING
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS

END