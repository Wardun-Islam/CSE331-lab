include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
   msg1 db 'Enter 16 digits: ',0
   msg2 db 0ah, 0dh, 'Highest: ',0
   msg3 db 0ah, 0dh, 'Lowest: ',0 
   msg4 db 0ah, 0dh, 'Average: ',0
   highest db 0
   lowest db 0
   average db 0       
.CODE 

    check macro n
        cmp n, highest
        jle check_low
        mov highest, n
        check_low:
        cmp n, lowest
        jge return
        mov lowest, n
        return: 
    endm check


    MAIN PROC

    mov ax, @DATA
    mov ds, ax
    
    lea si, msg1
    call PRINT_STRING
    mov ah, 01h
    int 21h
    sub al, 30h
    mov highest, al
    mov lowest, al
    mov cx, 15
    mov ah, 0
    mov bx, ax
input:
    mov ah, 01h
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h
    check al
    mov ah, 0
    add bx, ax
    loop input
    
    mov ax, bx
    mov bl, 16
    div bl
    mov ah, 0
    lea si, msg4
    call PRINT_STRING
    call PRINT_NUM
    
    lea si, msg2
    call PRINT_STRING 
    mov ax, 0
    mov al, highest
    call PRINT_NUM
    
    lea si, msg3
    call PRINT_STRING 
    mov ax, 0
    mov al, lowest
    call PRINT_NUM
    
    mov ax, 7000h
    mov ds, ax
    mov si, 5345h
    mov al, highest
    mov[si], al
    mov al, lowest
    inc si
    mov[si], al 
    inc si
    mov al, average
    mov[si], al
     
    
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

ENDP MAIN
END MAIN