extern printf
extern fflush
extern scanf
      
section .data
    fmt db "%f %f", 0
    fmts db "%s", 10, 0
    fmtd db "%d", 10, 0
    fmtf db "%f", 10, 0
          
section .bss
    satu resd 1
    dua resd 1
    result resd 1
    result1 resd 1
    result2 resd 1
     
section .text
    global main
          
main:
    push dua
    push satu
    push fmt
    call scanf
     
    fld dword[satu]
    fld dword[satu]
    fmulp
    fstp dword[result1]
     
    fld dword[dua]
    fld dword[dua]
    fmulp
    fstp dword[result2]
     
    fld dword[result1]
    fld dword[result2]
    faddp
     
    fsqrt
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
