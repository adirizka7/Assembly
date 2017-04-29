section .data
    msg db "Hello "
    msg_len equ $-msg
    name_len dd 4
 
section .bss
    name resd 4
 
section .text
    global main
 
main:
    mov eax, 3
    mov ebx, 0
    mov ecx, name
    mov edx, name_len
    int 0x80
 
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80
 
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, 4
    int 0x80
 
 
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
