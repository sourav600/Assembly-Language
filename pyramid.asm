.model small
.stack 100h
.data
    newLine db 0ah, 0dh, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov bx, 1
    mov cx, 5 ;loop variable

    l1:
        push cx
        mov ah, 2
        mov dl, 32 ; 32 -> white space
    l2:
        int 21h
        loop l2

    mov cx, bx
    mov dl, '*'
    l3:
        int 21h
        loop l3
    
    mov ah, 9
    lea dx, newLine
    int 21h

    inc bx
    inc bx
    pop cx
    loop l1

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
    
    