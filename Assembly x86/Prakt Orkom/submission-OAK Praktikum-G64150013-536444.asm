extern printf
extern fflush
extern scanf
   
section .data
    fmt db "%d", 0
	fmtprint db "%d", 10, 0
       
section .bss
    num1 resd 1
    temp resd 1
      
section .text
    global main
       
main:
    push num1
    push fmt
    call scanf
    add esp, 8
    
    mov dword[temp], 0
    mov dword[temp+4], 1
    
    mov ecx, [num1]
    mov esi, 2
    
    mov edi, [num1]
    
sub_loop:
	mov ecx, esi
	dec ecx
	mov eax, [temp + 4*ecx]
	dec ecx
	add eax, [temp + 4*ecx]
	mov dword[temp + 4*esi], eax
	
	add esi, 1
	cmp esi, [num1]
	jbe sub_loop
	
	mov eax, [temp + 4*edi]
	
	push eax
	push fmtprint
	call printf
	add esp, 8

    push 0
    call fflush
       
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
