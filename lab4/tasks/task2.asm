include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
   msg db 'The first fifteen terms of the Fibonacci sequence are:',0      
.CODE
    mov ax, @DATA
    mov ds, ax
    
    lea si, msg
    call PRINT_STRING
    
    mov cx, 15
    mov ax, 0
    mov dx, 1
print:
    putc ' '
    call PRINT_NUM 
    mov bx, dx
    add dx, ax
    mov ax, bx
    loop print
  
    
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