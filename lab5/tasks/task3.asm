.MODEL SMALL
.STACK 100H   

.DATA 
    not_d_msg db 0ah, 0dh, "It is not a digit.$"    
    d_msg db 0ah, 0dh, "It is a digit.$"
.CODE
    mov ax, @DATA
    mov ds, ax
    
    mov ah, 01h
    int 21h
    
    cmp al, '0'
    jl print_not_digit
    
    cmp al, '9'
    jg print_not_digit
    
print_digit:
    mov ah, 09h
    lea dx, d_msg
    int 21h
    jmp exit
    
print_not_digit:
    mov ah, 09h
    lea dx, not_d_msg
    int 21h 
   
exit:
    mov ah, 4ch
    int 21h