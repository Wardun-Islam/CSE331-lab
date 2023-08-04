.MODEL SMALL
.STACK 100H
.DATA
   msg1 db 'Enter an algebraic expression: $'
   msg2 db 0ah, 0dh, 'Expression is correct.$'
   msg3 db 0ah, 0dh, 'Incorrect expression.$'     
.CODE
    mov ax, @DATA
    mov ds, ax
    
    lea dx, msg1
    mov ah, 09h
    int 21h
    
    mov bx, sp
    
_input:
    mov ah, 01h
    int 21h
    cmp al, '('
    je push_stack
    cmp al, '{'
    je push_stack
    cmp al, '['
    je push_stack
    cmp al, ')'
    je pop_stack_1
    cmp al, '}'
    je pop_stack_2
    cmp al, ']'
    je pop_stack_3
    cmp al, 0dh
    jne _input 
    jmp check_stack

push_stack:
    push ax
    jmp _input
    
pop_stack_1:
    pop ax
    cmp al, '('
    jne display_incorrect
    jmp _input
    
pop_stack_2:
    pop ax
    cmp al, '{'
    jne display_incorrect
    jmp _input
    
pop_stack_3:
    pop ax
    cmp al, '['
    jne display_incorrect
    jmp _input
       
check_stack:
    cmp sp, bx
    jne display_incorrect
    
    lea dx, msg2
    mov ah, 09h
    int 21h 
    jmp EXIT
    
display_incorrect:
    lea dx, msg3
    mov ah, 09h
    int 21h    
        
EXIT:
    mov ah, 4ch
    int 21h

END