extern printf
extern fflush
extern scanf
  
section .data
    fmt db "%d %d %d %d", 0
    msg1 db "lulus", 10, 0
    msg2 db "tidak", 10, 0
      
section .bss
    num1 resd 1
    num2 resd 1
    num3 resd 1
    num4 resd 1
     
section .text
    global main
      
main:
    push num1
    push num2
    push num3
    push num4
    push fmt
    call scanf
    add esp, 12
     
    mov eax, [num1]
    mov ebx, [num2]
    mov ecx, [num3]
    mov edx, [num4]
     
    add eax, ebx
    add eax, ecx
    add eax, edx
     
    mov edx, 0
    mov ecx, 4
    div ecx
    
    cmp eax, 40
    jc cek
    
    push msg1
    call printf
    add esp, 4
    jmp cp

cek:
	push msg2
	call printf
	add esp, 4

cp:

    push 0
    call fflush
      
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
