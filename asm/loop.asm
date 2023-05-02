%include 'util.asm'

global _start

section .text

_start:

   mov rdi, mesg
   call printstr
   call readint
   mov [user_in], rax
   mov rbx, 1

_loop:
   mov  rcx, [user_in]
   imul rcx, rbx

   mov rdi, rcx
   call printint
   call endl
   
   add rbx, 1
   cmp rbx, 11
   jne _loop
   call exit0

section .data

    mesg: db "Enter Number: ", 0

section .bss
   user_in: resb 8 
