section .data
	msg db "Hello x86", 10
	msg_len equ $-msg


section .text
	global main

main:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, msg_len
	int 0x80

exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
