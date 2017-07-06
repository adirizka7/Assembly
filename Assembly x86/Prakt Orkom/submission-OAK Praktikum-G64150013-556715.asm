extern printf
extern fflush
extern scanf
      
section .data
    fmt db "%f", 0
    fmts db "%s", 10, 0
    fmtd db "%d", 10, 0
    fmtf db "%f", 10, 0
          
section .bss
    dia resd 1
    result resd 1
     
section .text
    global main
          
main:
    push dia
    push fmt
    call scanf
     
    fld dword[dia]
    push dword[dia]
    fldpi
    fmulp
    fstp qword[result]
     
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
