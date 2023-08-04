.MODEL SMALL
.STACK 100H   

.DATA     
 
.CODE
    mov ax, @DATA
    mov ds, ax
    
    mov ah, 02h
    mov bl, 'A'
    mov cx, 26
    
print_letter:
    mov dl, bl
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    inc bl
    loop print_letter
   
exit:
    mov ah, 4ch
    int 21h