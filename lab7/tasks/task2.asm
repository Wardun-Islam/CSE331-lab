include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
   prompt1 db 'Enter a decimal number: ',0
   prompt2 db "-th term of the Lazy Caterer's Squence is: ",0      
.CODE
    mov ax, @DATA
    mov ds, ax
    
    lea si, prompt1
    call PRINT_STRING
    call SCAN_NUM
    mov ax, cx
    mov bx, ax
    
    mul bx
    add ax, bx
    add ax, 2
    mov bx, 2
    div bx
    mov bx, ax
    mov ax, cx
    putc 0ah
    putc 0dh
    call PRINT_NUM
    lea si, prompt2
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