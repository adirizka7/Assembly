extern printf
extern fflush
extern scanf
 
section .data
    fmt db "%d %d", 0
    fmtprint db "%d", 10, 0
     
section .bss
	num1 resd 1
	num2 resd 1
	
section .text
    global main
     
main:
    push num1
    push num2
    push fmt
    call scanf
    add esp, 12
    
    mov eax, [num1]
    mov ebx, [num2]
    
    add eax, ebx
    
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
