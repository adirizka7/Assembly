extern scanf
extern printf
extern fflush

section .data
	fid db "%d", 0
	fif db "%f", 0
	fis db "%s", 0
	; format default
	
	fmt db "%d %d", 0
	; another input
	
	fod db "%d", 10, 0
	fof db "%f", 10, 0
	fos db "%s", 10, 0
	; format default
	
	fmtp db "%d", 10, 0
	; another output
	
	dword_size equ 4
	; defining
	
section .bss
	an1 resd 1
	an2 resd 1
	str1 resb 50
	str2 resb 50

section .text
	global main
	
main:
	

exit:
	push 0
	call fflush
	mov eax, 1
	mov ebx, 0
	int 0x80

; ADIRIZKA7'S TEMPLATE


readint:
	push eax
	push fid
	call scanf
	add esp, 8
	ret

printint:
	push eax
	push fod
	call printf
	add esp, 8
	ret

readfloat:
	push eax
	push fif
	call scanf
	add esp, 8
	ret

printfloat:
	push eax
	push ebx
	push fof
	call printf
	add esp, 12
	ret

; unlike int, you dont have to state the size of operand before moving it to another
readstring:
	push eax
	push fis
	call scanf
	add esp, 8
	ret
	
printstring:
	push eax
	push fos
	call printf
	add esp, 8
	ret

