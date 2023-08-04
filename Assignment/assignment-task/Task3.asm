include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
      
.CODE
    mov ax, @DATA
    mov ds, ax
    
    mov cx, 1
    mov ax, 1
_print:
    mul cx
    call PRINT_NUM_UNS
    PUTC 0AH
    PUTC 0DH
    inc cx
    cmp cx, 9
    jne _print     
    
EXIT:
    mov ah, 4ch
    int 21h
    
;--------------------DEFINE LIBRARY PROCEDURES--------------------;

    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS

END