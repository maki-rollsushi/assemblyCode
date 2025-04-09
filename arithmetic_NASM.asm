; Assemble: nasm -f elf64 <filename>.asm -o <filename>.o
; Link:     ld -o program program.o
; Run:      ./<filename>

section .data
    num1 dq 15
    num2 dq 8

section .text
    global _start

_start:
    ; increment/decrement
    mov rax, [num1]
    inc rax
    dec rax

    ; addition
    mov rax, [num1]
    mov rbx, [num2]
    add rax, rbx        ; rax = rax + rbx (15 + 8 = 23)

    ; subtraction
    sub rax, rbx        ; rax = 23 - 8 = 15

    ; unsigned multiplication (mul)
    mov rax, -1
    mov rcx, 2
    mul rcx             ; RDX:RAX = RAX * RCX (unsigned)

    ; signed multiplication (imul)
    mov rax, 0
    mov rcx, 2
    imul rcx, -1        ; RCX = RCX * -1

    ; 64-bit division (unsigned): RDX:RAX / RCX
    mov rax, 10
    xor rdx, rdx
    mov rcx, 3
    div rcx             ; RAX = quotient, RDX = remainder

    ; 16-bit division: AX / CX
    xor rax, rax
    mov ax, 10
    xor dx, dx
    mov cx, 4
    div cx              ; AX / CX (quotient in AL, remainder in AH)

    ; 8-bit division: AL / CL
    xor rax, rax
    mov ax, 11
    mov cl, 2
    div cl              ; AL = quotient, AH = remainder

    ; Exit using syscall
    mov rax, 60         ; syscall number for exit
    xor rdi, rdi        ; exit code 0
    syscall
