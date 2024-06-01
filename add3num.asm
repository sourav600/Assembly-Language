.model small
.stack 100h

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 1
    int 21h
    mov bl, al

    mov ah, 1
    int 21h
    mov bh, al

    mov ah, 1
    int 21h
    mov cl, al

    mov ah, 2
    mov dl, 10 ; newline
    int 21h
    mov dl, 13 ;carriage return
    int 21h

    add cl,bl
    sub cl,'0'

    add cl,bh
    sub cl, '0'

    mov ah, 2
    mov dl, cl
    int 21h

    mov ah, 4ch
    int 21h
    main endp
end main
