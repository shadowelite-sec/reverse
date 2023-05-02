global main

section .text

main:

     mov rax, 0x02
     add rax, 0x03

     mov rax, 0x02
     sub rax, 0x2

     ;multiplay
     
     mov rax, 0x06
     imul rbx, rax, 0x02

     ;devision
     mov rax, 0x64
     mov rcx, 0x2
     idiv rcx

_exit:
     
     mov rax,0x3c
     mov rdi,0
     syscall


