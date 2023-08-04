include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
   prompt1 db 'Enter a decimal number: ', 0
   prompt2 db 0ah, 0dh, 'Binary: ',0
   prompt3 db 0ah, 0dh, "Number of 0's: ",0      
.CODE
    mov ax, @DATA
    mov ds, ax
    
    lea si, prompt1
    call PRINT_STRING
    call SCAN_NUM
    mov ax, cx
    mov cx, 16
    mov bx, 0
    lea si, prompt2
    call PRINT_STRING
_print:
    shl ax, 1
    jnc _zero
    
    putc '1'
    loop _print 
    jmp _print_count
_zero:
    putc '0'
    inc bx
    loop _print

_print_count:    
    lea si, prompt3
    call PRINT_STRING
    mov ax, bx
    call PRINT_NUM     
    
EXIT:
    mov ah, 4ch
    int 21h
    
;--------------------DEFINE LIBRARY PROCEDURES--------------------;

    DEFINE_PRINT_STRING
    DEFINE_PTHIS
    DEFINE_GET_STRING
    DEFINE_CLEAR_SCREEN
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS

END