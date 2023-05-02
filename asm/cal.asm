%include "util.asm"
global _start

section .text

_start:

prmpt:
    
    mov rdi,wlc1
    call printstr
    call readint
    mov [num1], rax
    call endl

    mov rdi,wlc2
    call printstr
    call readint
    mov [num2], rax
    call endl

    mov rdi, oper
    call printstr
    mov rdi, op
    mov rsi, 2
    call readstr

cmp_op:
    
    mov rdi, [op]
    cmp rdi, 43; eq to + 
    je addition
    cmp rdi, 45; eq -
    je substraction
    cmp rdi, 42; eq *
    je multiply
    cmp rdi, 47; eq /
    je division

wrong:
    
    mov rdi, error
    call printstr
    call endl
    call exit0

addition:
    mov rdi, [num1]
    add rdi, [num2]
    call out


substraction:
    mov rdi, [num1]
    sub rdi, [num2]
    call out

multiply:
    mov rdi, [num1]
    imul rdi, [num2]
    call out

division:
    mov rdx,0
    mov rax, [num1]
    mov rbx, [num2]
    idiv rbx
    call out

out:
    call printint
    call endl
    call exit0

section .data
    
    wlc1: db "Enter the First Number: ", 0
    wlc2: db "Enter the Second Number: ", 0
    oper: db "Enter The operation [ '+', '-', '*', '\' ] : ", 0
    error: db "Wrong Input !", 0

section .bss
    num1: resb 8
    num2: resb 8
    op: resb 2
