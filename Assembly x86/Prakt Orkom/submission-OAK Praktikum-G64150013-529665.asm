extern printf
extern fflush
extern scanf

section .data
	fmt db "%s", 10, 0
	msg db "Hello world!", 0
	
section .bss

section .text
	global main
	
main:
	push msg
	push fmt
	call printf
	add esp, 8
	
	push 0
	call fflush
	
exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
