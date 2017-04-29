extern printf
extern fflush
extern scanf
    
section .data
    fmt db "%d", 0
    fmtprint db "%d", 10, 0
    
    input dd 7, 11, 10, 6
		  dd 5, 8, 9, 2
		  dd 1, 3, 12, 4 
        
section .bss
    num1 resd 1
       
section .text
    global main
        
main:
	push num1
    push fmt
    call scanf
    add esp, 8
    
    mov ecx, 4
    
    mov eax, 4
	
	mov ebx, [num1]
	
	mul ebx
	
	mov ebx, 0

sub_loop:
	add ebx, dword[input+4*eax]
	add eax, 1
	loop sub_loop
	
    push ebx
    push fmtprint
    call printf
    add esp, 8
 
    push 0
    call fflush
        
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
