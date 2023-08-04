include 'emu8086.inc'
.MODEL SMALL
.STACK 100H
.DATA
   prompt_1 db 'Enter x: ',0
   prompt_2 db 0ah, 0dh, 'Enter y: ',0      
.CODE
    mov ax, @DATA
    mov ds, ax
    
    lea si, prompt_1
    call print_string
    call scan_num
    mov bx, cx
    lea si, prompt_2
    call print_string
    call scan_num
    dec bx;x-1
    dec cx;y-1
    mov ax, bx
    mul bx;x*x
    mov bx, ax
    mov ax, cx
    mul cx;y*y
    mov cx, ax
    add bx, cx;result
    
    mov ax, 7000h;segment
    mov ds, ax
    mov si, 3145h;offset
    mov [si], bx
    
    putc 0ah
    putc 0dh
    mov ax, bx
    call print_num
    hlt
         
;--------------------DEFINE LIBRARY PROCEDURES--------------------;

    DEFINE_PRINT_STRING
    DEFINE_GET_STRING
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS

END