.model small
.stack 100h
.data
    str db 'abba','$'
    out1 db 0ah, 0dh, 'String is Palindrome!', '$'
    out2 db 0ah, 0dh, 'String is Not Palindrome!', '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset str

    loop1:
        mov al, [si]
        cmp al, '$'
        JE label1
        inc si
        jmp loop1
    label1:
        mov di, offset str
        dec si
    loop2:
        cmp si,di
        jl output1
        mov al, [si]
        mov bl, [di]
        cmp al, bl
        jne output2
        inc di
        dec si
        jmp loop2
    output1:
        mov ah, 9
        lea dx, out1
        int 21h
        jmp exit

    output2:
        mov ah, 9
        lea dx, out2
        int 21h
        jmp exit
    exit:
    mov ah, 4ch
    int 21h
    main endp

end main

