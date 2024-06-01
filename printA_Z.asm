.model small
.stack 100h

.data
    
.code
main proc 
    mov cx, 26
    mov bl, 'a'

    label1:
        mov ah,2
        mov dl, bl
        int 21h

        ; mov ah, 2
        ; mov dl, 10 ; newline
        ; int 21h
        ; mov dl, 13 ;carriage return
        ; int 21h

        INC bl
        loop label1


        mov ah, 4ch
        int 21h
        main endp
    end main