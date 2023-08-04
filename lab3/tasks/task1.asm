.MODEL SMALL
.STACK 100H
.DATA   
    arr1 db 1, 2, 3, 4, 5
    arr2 db 5 dup(?)
    
.CODE
    mov ax, @data
    mov ds, ax

    mov al, arr1[0]
    mov arr2[0], al
    mov al, arr1[1]
    mov arr2[1], al
    mov al, arr1[2]
    mov arr2[2], al
    mov al, arr1[3]
    mov arr2[3], al
    mov al, arr1[4]
    mov arr2[4], al
    
EXIT:
    mov ah, 4ch
    int 21h