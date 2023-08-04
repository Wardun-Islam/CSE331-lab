.MODEL SMALL
.STACK 100H
    
.CODE
    mov ah, 01h
    int 21h
    mov bl, al
    sub bl, 30h
    
    mov ah, 01h
    int 21h
    mov bh, al
    sub bh, 30h
    
    add bl, bh
    
    mov ah, 02h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov dl, bl
    add dl, 30h
    int 21h
    
EXIT:
    mov ah, 4ch
    int 21h