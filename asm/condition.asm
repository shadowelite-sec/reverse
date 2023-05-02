global _start

section .text

_start:
    
    jmp prom1

prom1:
    
    mov rax, 1
    mov rdi, 1
    mov rsi, mesg1
    mov rdx, len_mesg1
    syscall

main:
    mov rax, 0
    mov rdi, 0
    mov rsi, user_key
    mov rdx, 64
    syscall

cmp_key:
    cmp rax, len_key
    jne access_denied

    ;we need to move key --> rsi and user_key --> rdi
    mov rsi, key
    mov rdi, user_key
    mov rcx, len_key
    repe cmpsb
    je access_granted
    jne access_denied

access_granted:
    mov rax, 1
    mov rdi, 1
    mov rsi, granted
    mov rdx, len_grant
    syscall
    jmp exit

access_denied:
    mov rax, 1
    mov rdi, 1
    mov rsi, denied
    mov rdx, len_denied
    syscall

exit:
    mov rax, 60
    mov rdi, 20
    syscall

section .data
    
    ;prompt user to enter data
    mesg1: db "Enter The Key: "
    len_mesg1: equ $-mesg1
    
    ;print access granted
    granted: db "Access Granted !", 0xa; newlline
    len_grant: equ $-granted

    ;print access denied
    denied db "Access Denied !", 0xa;newline
    len_denied: equ $-denied

    ;key value

    key: db "1234-1049-2288 "
    len_key: equ $-key

section .bss

    user_key: resb 64
