.model small
.stack 100h
.data
msg db 0ah, 0dh, "Enter three number: ", '$'
msg1 db 0ah, 0dh, "Largest number is: ", '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, msg
    int 21h

    mov ah,1 
    int 21h
    mov bl,al
    
    int 21h
    mov bh,al

    int 21h
    mov cl, al

    cmp bl, bh
    jg check_third_num
    mov bl, bh

    check_third_num:
        cmp bl, cl
        jg exit
        mov bl, cl
    exit:
        mov ah, 9
        lea dx, msg1
        int 21h

        mov ah,2
        mov dl, bl
        int 21h

        mov ah, 4ch
        int 21h
        main endp
    end main