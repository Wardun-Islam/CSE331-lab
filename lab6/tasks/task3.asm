include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
   msg1 db 'The factorials of 7 is: ',0
   msg2 db 0ah, 0dh, 'The factorials of 8 is: ',0      
.CODE
    mov ax, @DATA
    mov ds, ax
    
    lea si, msg1
    call PRINT_STRING
    
    mov cx, 7
    mov ax, 1
print_7:
    mov bx, ax
    mov ax, cx
    call PRINT_NUM
    PUTC 'X'
    mov ax, bx 
    mul cx
    loop print_7
    
    PUTC 8
    PRINT ' = '
    call PRINT_NUM
    
    
    lea si, msg2
    call PRINT_STRING
    
    mov cx, 8
    mov ax, 1
print_8:
    mov bx, ax
    mov ax, cx
    call PRINT_NUM
    PUTC 'X'
    mov ax, bx 
    mul cx
    loop print_8
    
    PUTC 8
    PRINT ' = '
    call PRINT_NUM_UNS
    
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