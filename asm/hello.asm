global _start

section .text

_start:
    ;prnt hello world
    mov rax, 0x01 ;write syscall
    mov rdi, 0x01 ;fd -> 1 (std output)
    mov rsi, hello ;buffer --> hello (variable pointer)
    mov rdx, 0x0b ; count --> (length)
    syscall

    ;exit
    mov rax, 0x3c ; syscall 60 in hex 0x3c
    mov rdi, 0x01; exit code
    syscall

section .data
    hello: db 'hello world' ; variable
