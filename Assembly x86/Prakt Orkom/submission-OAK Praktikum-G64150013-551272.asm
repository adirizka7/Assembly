extern printf
extern fflush
extern scanf
     
section .data
    fmt db "%d", 0
    fmtprint db "%d", 10, 0
         
section .bss
    a resd 1
        
section .text
    global main
         
main:
    
sub_loop:
	push a
	push fmt
	call scanf
	mov eax, [a]
	mov ebx, [a]
	mov ecx, 0
	
	cmp ebx, ecx
	je exit2
	
	call kuadrat
	
	push eax
	push fmtprint
	call printf
	
	cmp ebx, ecx
	jne sub_loop
	jmp exit2
	
kuadrat:
	mov edx, eax
	imul edx
	ret

exit2:   
    push 0
    call fflush
         
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
