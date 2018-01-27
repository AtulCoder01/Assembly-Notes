dosseg
.model small
.stack 100h
.data
        msg db 100 dup("$")
.code
main proc
        mov ax, @data
        mov ds, ax
        mov si, offset msg

        l1:
        mov ah, 1
        int 21h
        cmp al, 13
        je program_end
        mov [si], al
        inc si
        jmp l1
        program_end:

        mov si, offset msg

        p1:
        mov dl, [si]
        cmp dl, '$'
        je pe
        dec dl ; incement encryption
        mov ah, 2
        int 21h
        inc si
        jmp p1
        pe:

        mov ah, 4ch
        int 21h
main endp
end main
