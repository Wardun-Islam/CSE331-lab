include 'emu8086.inc'
.model small
.stack 100h

.data
    matrix dw 1,2
    row1   dw 4,5
    row2   dw 7,8
    row3   dw 4,5
    row4   dw 4,5
.code

main proc
    
    mov ax, @data
    mov ds, ax

    lea si, matrix ; address of matrix
    
    mov cx, 10
    mov al, 0
    mov bl, 0
    l1:
        
        call scan_num
        mov [si], cx
        inc si
    
     
      

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
