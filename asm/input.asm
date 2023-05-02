global _start

section .text

_start:
    mov rax, 0x01; write
    mov rdi, 0x01; stdout
    mov rsi, print; buffer
    mov rdx, print_len; len
    syscall
    ;jmp exit

user_input:
    mov rax, 0x00; read
    mov rdi, 0x00; stdin
    mov rsi, input;buffer
    mov rdx, 0x0b; count
    syscall
    mov rbx, rax

print_output:
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, wlc
    mov rdx, wlc_len 
    syscall

print_user_input:
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, input
    mov rdx, rbx 
    syscall
    

exit:
    mov rax, 0x3c; exit
    mov rdi, 0x0a
    syscall

section .data
    print: db 'Enter The Input: ' ;prompt user to enter data
    print_len: equ $-print; saving len in a variable
    ;print user vlaue

    wlc: db 'Welcome, '
    wlc_len: equ $-wlc 

section .bss
    input: resb 0x0b; resb --> reserve as bytes(100 bytes)
