extern printf
extern fflush
extern scanf
   
section .data
    fmt db "%d", 0
	fmtprint db "%d", 10, 0
       
section .bss
    num1 resd 1
      
section .text
    global main
       
main:
    push num1
    push fmt
    call scanf
    add esp, 8
    
    mov eax, 1
    mov ebx, 2
    mov ecx, [num1]
    
sub_loop:
	imul eax, ebx
	loop sub_loop
	
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
