include 'emu8086.inc'
.model small
.stack 100h

.data
.code

main proc
    
    mov ax, @data
    mov ds, ax
    mov ah, 01h
    int 21h
    sub al, 30h; set ah for input
    mov cl, al
    inc al
    mov bh, al
    mov ch, 0
    mov bl, cl
    mov bh, 1
    putc 0dh
    putc 0ah
    l1:
        mov dl, 1
        l2:
            cmp dl, bl
            jne skip1
            putc '*'; printing *
            jmp skip3
            skip1:
            cmp dl, bh
            jne skip2
            cmp bl, bh
            je skip3
            putc '*'; printing *
            jmp skip3
            skip2:
            putc ' '; printing ' '
            skip3:
            inc dl
            cmp dl, al
            jl l2
        putc 0ah
        putc 0dh
        dec bl
        inc bh
        loop l1
        
        
        
      

endp main
;--------------------DEFINE LIBRARY PROCEDURES--------------------;

    DEFINE_PRINT_STRING
    DEFINE_PTHIS
    DEFINE_GET_STRING
    DEFINE_CLEAR_SCREEN
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS

end main 
