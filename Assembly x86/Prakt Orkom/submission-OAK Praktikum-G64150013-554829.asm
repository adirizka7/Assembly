extern printf
extern fflush
extern scanf
     
section .data
    fmt db "%s", 0
    fmts db "%s", 10, 0
    fmtd db "%d", 10, 0
         
section .bss
	str1 resb 20
	str2 resb 20
        
section .text
    global main
         
main:
	cld
	push str1
	push fmt
	call scanf
	
	mov ecx, 21
	mov edi, str1
	mov al, ""
	repne scasb
	
	mov eax, 20
	sub eax, ecx
	
	push eax
	push fmtd
	call printf
	
exit:
	push 0
	call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
