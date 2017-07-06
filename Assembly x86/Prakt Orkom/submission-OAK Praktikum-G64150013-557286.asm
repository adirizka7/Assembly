extern scanf
extern printf
extern fflush

section .data
	fid db "%d", 0
	fif db "%f", 0
	fis db "%s", 0
	
	fod db "%d", 32, 0
	fod2 db "%d", 10, 0
	fof db "%f", 10, 0
	fos db "%s", 10, 0
	
section .bss
	n resd 1
	tmp resd 1
	arr resd 1

section .text
	global main
	
main:
	mov eax, n
	call rint
	
	mov ebx, 0
	
	; masukin ke arr
	.loop:
		mov eax, tmp
		call rint
		mov eax, [tmp]
		mov dword[arr+4*ebx], eax
		
		;mov eax, dword[arr+4*ebx]
		;call pint
		
		add ebx, 1
		cmp ebx, [n]
		jne .loop
	; eol masukin ke arr
	
	mov ebx, 0
	mov esi, [n]
	sub esi, 1
	
	.loopi:
		mov edi, ebx
		add edi, 1
		.loopj:
			mov eax, dword[arr+4*ebx]
			mov ecx, dword[arr+4*edi]
			cmp eax, ecx
			ja .swap
			
			.kembali
			
			add edi, 1
			cmp edi, [n]
			jne .loopj
		;eol loopj
		
		add ebx, 1
		cmp ebx, esi
		jne .loopi
	;eol .loopi
	jmp .printdulu
	
.swap:
	mov dword[arr+4*ebx], ecx
	mov dword[arr+4*edi], eax
	jmp .kembali
	
.printdulu:
	mov ebx, 0
	mov edi, [n]
	sub edi, 1
	
	.lprint:
		mov eax, dword[arr+4*ebx]
		call pint
		
		add ebx, 1
		cmp ebx, edi
		jne .lprint
	; eol .lprint
	
	mov eax, dword[arr+4*ebx]
	push eax
	push fod2
	call printf
	add esp, 8

exit:
	push 0
	call fflush
	mov eax, 1
	mov ebx, 0
	int 0x80


; ADIRIZKA7'S TEMPLATE

rfloat:
	push eax
	push fif
	call scanf
	add esp, 8
	ret

pfloat:
	push eax
	push ebx
	push fof
	call printf
	add esp, 12
	ret

rint:
	push eax
	push fid
	call scanf
	add esp, 8
	ret

pint:
	push eax
	push fod
	call printf
	add esp, 8
	ret

; unlike int, you dont have to state the size of operand before moving it to another var in STRING
rstring:
	push eax
	push fis
	call scanf
	add esp, 8
	ret
	
pstring:
	push eax
	push fos
	call printf
	add esp, 8
	ret

