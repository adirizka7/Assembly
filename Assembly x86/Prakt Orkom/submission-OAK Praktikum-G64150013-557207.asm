extern printf
extern fflush
extern scanf
       
section .data
    fmt db "%f", 0
    fmt2 db "%d", 0
    fmts db "%s", 10, 0
    fmtd db "%d", 10, 0
    fmtf db "%.1f", 10, 0
    sum dq 0.0       
           
section .bss
	n resd 1
	bil resd 1
	result resd 1
      
section .text
    global main
           
main:
	push n
    push fmt2
    call scanf
    
    mov edi, [n]
	fld qword[sum]
	
.loop:
	push bil
	push fmt
	call scanf
	add esp, 8
	
	fadd dword[bil]
	
	sub edi, 1
	cmp edi, 0
	jne .loop


	fidiv dword[n]
	fst qword[result]
	
	push dword[result+4]
	push dword[result]
	push fmtf
	call printf

exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
