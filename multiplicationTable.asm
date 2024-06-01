.model small
.stack 100h
.data
usermessage DB "Enter Number : $"
msg DB 0ah,0dh,'Multiplication table : $'
newline DB 0ah,0dh, "$"
var DB 01h ; o1h = decimal 1
 
.code
    main proc
        mov ax,@data
        mov ds,ax
 
        ; print user input line
        mov ah,9
        lea dx,usermessage
        int 21h
 
        ; for input in bl register
        mov ah,1
        int 21h
        sub al,'0'
        mov bl,al
 
        ; print user input line
        mov ah,9
        lea dx,msg
        int 21h
 
        for:
            cmp var,10 ; here 10 means loop will be executed in 10 times
            jg exit
 
            mov al,var
            mul bl
            aam
 
            mov dh,ah
            mov bh,al
 
            mov dl,dh
            add dl,30h
            mov ah,2
            int 21h
 
            mov dl,bh
            add dl,30h
            mov ah,2
            int 21h
 
            lea dx,newline
            mov ah,9
            int 21h
 
            inc var
        jmp for
 
        exit:
        mov ah,4ch
        int 21h
        main endp
    end main