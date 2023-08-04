include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
   msg1 db 'Enter first number: ',0
   msg2 db 0ah, 0dh, 'Enter second number: ',0      
.CODE
    mov ax, @DATA
    mov ds, ax
    
    lea si, msg1
    call PRINT_STRING
    call SCAN_NUM
    mov ax, cx
    
    lea si, msg2
    call PRINT_STRING
    call SCAN_NUM
    
    sub ax, cx
    
    call PTHIS
    db 0ah, 0dh, 0
    
    PRINT 'Difference between the two numbers is: '
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