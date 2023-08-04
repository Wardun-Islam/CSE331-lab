.MODEL SMALL
.STACK 100H   

.DATA     
 
.CODE
    mov ax, @DATA
    mov ds, ax
    
    mov ah, 01h
    int 21h
    
    cmp al, '1'
    je print_o
    
    cmp al, '3'
    je print_o 
    
    cmp al, '5' 
    je print_o 
    
    cmp al, '2'
    je print_e 
    
    cmp al, '4'
    je print_e 
    
    jmp exit
    
print_o:
    mov ah, 02h
    mov dl, 'O'
    int 21h
    jmp exit
    
print_e:
    mov ah, 02h
    mov dl, 'E'
    int 21h 
  
    
exit:
    mov ah, 4ch
    int 21h