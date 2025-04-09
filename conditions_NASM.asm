section .data
    msg1 db 'Less than!', 0xa
    len1 equ $ - msg1
    msg2 db 'Greater than!', 0xa
    len2 equ $ - msg2
    msg3 db 'Equal!', 0xa
    len3 equ $ - msg3

section .text
    global _start

_start:
    mov ecx, 16         ; Load value into ecx
    cmp ecx, 16         ; Compare ecx with 16
    jl less_than        ; Jump to less_than if ecx < 16
    jg greater_than     ; Jump to greater_than if ecx > 16
    je equal            ;jump to equal funtion
    jmp _exit

less_than:
    ; Print "Less than!"
    mov edx, len1       ; Length of message
    mov ecx, msg1       ; Pointer to message
    mov ebx, 1          ; File descriptor (stdout)
    mov eax, 4          ; System call number for sys_write
    int 0x80            ; Make syscall
    jmp _exit

greater_than:
    ; Print "Greater than!"
    mov edx, len2       ; Length of message
    mov ecx, msg2       ; Pointer to message
    mov ebx, 1          ; File descriptor (stdout)
    mov eax, 4          ; System call number for sys_write
    int 0x80            ; Make syscall
    jmp _exit

equal:
    ;print equal
    mov edx, len3       ; Length of message
    mov ecx, msg3       ; Pointer to message
    mov ebx, 1          ; File descriptor (stdout)
    mov eax, 4          ; System call number for sys_write
    int 0x80            ; Make syscall
    jmp _exit

_exit:
    ; Exit the program
    mov eax, 1          ; System call number for sys_exit
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; Make syscall
