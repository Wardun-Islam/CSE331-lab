include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
   msg1 db 'Enter the marks of 20 students: ',0
   msg2 db 0ah, 0dh, 'Frequencies: ',0
   marks db 10 dup(?)
   frequencies db 10 dup(0)      
.CODE
    mov ax, @DATA
    mov ds, ax
    
    lea si, msg1
    call PRINT_STRING
    
    mov cx, 20
    lea si, marks
    lea di, frequencies
input:
    mov ah, 01h
    int 21h
    putc ' ' 
    sub al, 30h
    mov [si], al
    mov bx, 0
    mov bl, al
    inc [di+bx]
    loop input
        
    lea si, msg2
    call PRINT_STRING
    mov cx, 10
print:
    mov al, [di]
    mov ah, 0
    call PRINT_NUM
    PUTC ' '
    inc di
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