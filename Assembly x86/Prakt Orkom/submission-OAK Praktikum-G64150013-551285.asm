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
	mov ecx, [a]
	mov ebx, [a]
	
	cmp ebx, 0
	je exit2
	
	mov eax, 1
	call pangkat
	
	push eax
	push fmtprint
	call printf
	
	cmp ebx, 0
	jne sub_loop
	
	jmp exit2
	
pangkat:
	mov edx, 2
	imul edx
	loop pangkat
	ret

exit2:   
    push 0
    call fflush
         
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
