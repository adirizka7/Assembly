extern printf
extern fflush
extern scanf
  
section .data
    fmt db "%d %d %d %d", 0
    msga db "A", 10, 0
    msgb db "B", 10, 0
    msgc db "C", 10, 0
    msgd db "D", 10, 0
    msge db "E", 10, 0
      
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
    jc e
    
    cmp eax, 50
    jc d
    
    cmp eax, 60
    jc c
    
    cmp eax, 80
    jc b
    
    push msga
	call printf
	add esp, 4
	jmp cp


b:
	push msgb
	call printf
	add esp, 4
	jmp cp

c:
	push msgc
	call printf
	add esp, 4    
	jmp cp

d:
	push msgd
	call printf
	add esp, 4
    jmp cp
    
e:
	push msge
	call printf
	add esp, 4
	jmp cp

cp:
    push 0
    call fflush
      
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
