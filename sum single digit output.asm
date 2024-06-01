.model small
.stack 100h
.data
a db 'Enter first number:$'  
b db 'Enter second number:$' 
res db 'Sum of two number:$'  
.code
main proc
    mov ax,@data
    mov ds,ax 
     
    ;display a
    
    mov ah,9
    lea dx,a
    int 21h 
     
    ;take input a
    
    mov ah,1
    int 21h 
    mov bh,al
    
    ;nwe line 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ;display b 
    
    mov ah,9
    lea dx,b
    int 21h 
    
    ;take input b
    
    mov ah,1
    int 21h 
    mov bl,al
    
    ;new line
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    ;display res
     
    mov ah,9
    lea dx,res
    int 21h 
    
    ;add a and b
        
    add bh,bl 
    sub bh,48 
    
    ;display addition of a and b
    
    mov ah,2
    mov dl,bh
    int 21h
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
                        