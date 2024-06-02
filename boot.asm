bits 16
org 0x7c00

msg: db "Hello, World!", 0
start:
    mov si, msg
    call print_string
    jmp $
print_char:
    mov ah, 0x0e
    int 0x10
    ret
print_string:
    mov al, [si]
    inc si
    or al, al
    jz .done
    call print_char
    jmp print_string
.done:
    ret
times 510-($-$$) db 0
dw 0xaa55
