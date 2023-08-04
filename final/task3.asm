.MODEL SMALL
.STACK 100H
.DATA
   num1 dw  500
   num2 dw  100
   multh dw ? 
   multl dw ?
   quotient dw ?
   remainder dw ?
         
.CODE
     mov ax, num1
     
     mul num2
     mov multl, ax
     mov multh, dx 
     
     mov ax, num1
     
     div num2
     mov quotient, ax
     mov remainder, dx  
    
EXIT:
    mov ah, 4ch
    int 21h

END