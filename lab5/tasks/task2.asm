.MODEL SMALL
.STACK 100H   

.DATA
    inputs db 100 dup(?)     
 
.CODE
    mov ax, @DATA
    mov ds, ax
    
    mov ah, 01h
    lea si, inputs
    
take_input:
    int 21h
    cmp al, 0dh
    je finish_string
    mov [si], al
    inc si 
    jmp take_input 
  
finish_string:
    mov [si], '$'
    
    mov dl, 0ah
    mov ah, 02h
    int 21h
    lea dx, inputs
    mov ah, 09h
    int 21h
        
exit:
    mov ah, 4ch
    int 21h