extern printf
extern fflush
extern scanf
     
section .data
    fmt db "%d %d %d %d %d %d %d", 0
    fmtprint db "%d", 10, 0
    dword_size equ 4
         
section .bss
    tugas resd 1
    kuis resd 1
    proj resd 1
    uasp resd 1
    utsp resd 1
    uas resd 1
    uts resd 1
    res resd 1
        
section .text
    global main
         
main:
	push tugas
	push kuis
	push proj
	push uasp
	push utsp
	push uas
	push uts
	push fmt
	call scanf
	add esp, 28

	push dword [tugas]
	push dword [kuis]
	push dword [proj]
	push dword [uasp]
	push dword [utsp]
	push dword [uas]
	push dword [uts]
	call nilai_akhir
	
	cmp edx, 50
	jb lanjut
	
	add eax, 1

lanjut:
	
	push eax
	push fmtprint
	call printf
	
	jmp exit
	
nilai_akhir:
	push ebp
	mov ebp, esp
	
	mov ebx, 30
	mov eax, [ebp+2*dword_size]
	mul ebx
	mov ecx, eax
	
	mov eax, [ebp+3*dword_size]
	mul ebx
	add ecx, eax
	
	mov ebx, 10
	mov eax, [ebp+4*dword_size]
	mul ebx
	add ecx, eax
	
	mov eax, [ebp+5*dword_size]
	mul ebx
	add ecx, eax
	
	mov eax, [ebp+6*dword_size]
	mul ebx
	add ecx, eax
	
	mov ebx, 5
	mov eax, [ebp+7*dword_size]
	mul ebx
	add ecx, eax
	
	mov eax, [ebp+8*dword_size]
	mul ebx
	add ecx, eax
	
	mov eax, ecx
	
	mov ebx, 100
	mov edx, 0
	
	div ebx
	
	pop ebp
	ret 7*dword_size
         
exit:
	push 0
	call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
