.model small
.stack 100h
.data
    str db 'abcde'
    output db 0ah, 0dh,"Reverse string is: ",'$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset str
    mov cx, 5 ; string size

    loop1:
        mov bx, [si]
        push bx
        inc si
        loop loop1
   
    mov ah, 9
    lea dx, output
    int 21h

    mov cx, 5
    loop2:
        pop dx
        mov ah,2
        int 21h
        loop loop2

    mov ah, 4ch
    int 21h
    main endp
end main