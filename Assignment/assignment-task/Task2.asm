include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
   prompt1 db 'Enter a binary number: ',0
   prompt2 db 0ah, 0dh, 'Decimal: ',0
   prompt3 db 0ah, 0dh, 'Invalid input.',0      
.CODE
    mov ax, @DATA
    mov ds, ax
    
    lea si, prompt1
    call PRINT_STRING
    
    mov bx, 0
    mov cx, 16
    mov ah, 01h
    
_input:
    int 21h
    cmp al, '0'
    je _zero
    cmp al, '1'
    je _one
    jmp _error
    loop _input
    jmp _print
    
_error:
    lea si, prompt3
    call PRINT_STRING
    jmp EXIT

_zero:
   clc
   rcl bx, 1
   loop _input
   jmp _print 
     
_one:
   stc
   rcl bx, 1
   loop _input
   jmp _print

_print: 
    lea si, prompt2
    call PRINT_STRING
    mov ax, bx
    call PRINT_NUM 
       
EXIT:
    mov ah, 4ch
    int 21h
    
;--------------------DEFINE LIBRARY PROCEDURES--------------------;

    DEFINE_PRINT_STRING
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS

END