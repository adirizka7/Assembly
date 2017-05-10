extern printf
extern fflush
extern scanf
     
section .data
    fmt db "%d %d", 0
    fmtprint db "%d", 10, 0
    dword_size equ 4
         
section .bss
    a resd 1
    b resd 1
    res resd 1
        
section .text
    global main
         
main:
	push a
	push b
	push fmt
	call scanf

	push dword[a]
	push dword[b]
	call tambah
	mov [res], eax
	
	push eax
	push fmtprint
	call printf
	
	jmp exit2
	
tambah:
	push ebp
	mov ebp, esp
	mov eax, [ebp+3*dword_size]
	add eax, [ebp+2*dword_size]
	pop ebp
	ret 2*dword_size

exit2:   
    push 0
    call fflush
         
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
