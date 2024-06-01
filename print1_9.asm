.model small
.stack 100h

.data
    a db ?
    b db ?
    
.code
main proc 
    mov ax, @data
    mov ds, ax

    mov cx, 10
    mov bl, 1

    label1:
        mov al, bl
        mov ah, 0
        aaa

        mov a, al
        mov b, ah

        mov ah,2
        mov dl, b
        add dl, '0'
        int 21h

        mov ah,2
        mov dl, a
        add dl, '0'
        int 21h

        mov ah, 2
        mov dl, 10 ; newline
        int 21h
        mov dl, 13 ;carriage return
        int 21h

        INC bl
        loop label1


        mov ah, 4ch
        int 21h
        main endp
    end main