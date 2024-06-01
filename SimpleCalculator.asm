.model small
.stack 100h
.data
msg db "Press 1 for Addition",0dh,0ah,"Press 2 for Multiplication",0dh,0ah,"Press 3 for Subtraction",0dh,0ah,"Press 4 Division", 0Dh,0Ah, '$'
msg1 db 0ah, 0dh, "Enter your choice: ", '$'
msg2 db 0ah, 0dh, "Enter two digit: ", '$'
sum db 0ah, 0dh, "Sum is: ", '$'

substract db 0ah, 0dh, "Substraction is: ", '$'
product db 0ah, 0dh, "Multiplication is: ", '$'
divi db 0ah, 0dh, "Division is: ", '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, msg
    int 21h

    lea dx, msg2
    int 21h
    mov ah, 1 
    int 21h ;input first number
    mov bl, al
    int 21h ;input second number
    mov bh, al

    mov ah, 9
    lea dx, msg1
    int 21h
    mov ah, 1
    int 21h

    cmp al, '1'
    je Addition
    cmp al, '2'
    je Multiplication
    cmp al, '3'
    je Substraction
    cmp al, '4'
    je Division

    Addition:
        mov ah, 9
        lea dx, sum
        int 21h

        add bl,bh
        sub bl, '0'

        mov ah, 2
        mov dl, bl
        int 21h
        jmp exit

    Substraction:
        mov ah, 9
        lea dx, substract
        int 21h

        sub bl, bh
        add bl, '0'

        mov ah, 2
        mov dl, bl
        int 21h
        jmp exit

    Multiplication:
        mov ah, 9
        lea dx, product
        int 21h

        sub bl, '0'
        sub bh, '0'
        mov al, bl

        mul bh
        aam
        mov bx, ax

        mov ah, 2
        mov dl, bh
        add dl, '0'
        int 21h

        mov dl, bl
        add dl, '0'
        int 21h
        jmp exit
    
    Division:
        mov ah, 9
        lea dx, divi
        int 21h

        mov al, '8'
        mov cl, '2'
        div cl ; al = al/cl and store into ax

        mov cl, al
        mov ch, ah

        mov ah, 2
        mov dl, cl
        add dl, 48
        int 21h

        mov ah, 2
        mov dl, ch
        add dl, 48
        int 21h

        jmp exit

    exit:
    mov ah, 4ch
    int 21h
    main endp 
end main
