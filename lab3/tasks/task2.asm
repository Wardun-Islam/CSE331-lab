.MODEL SMALL
.STACK 100H
.DATA   
    str db "hello$"
    
.CODE
    mov ax, @data
    mov ds, ax
    
    sub str[0], 32
    sub str[1], 32
    sub str[2], 32
    sub str[3], 32
    sub str[4], 32
    
    lea dx, str
    mov ah, 09h
    int 21h
    
EXIT:
    mov ah, 4ch
    int 21h