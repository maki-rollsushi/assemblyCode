.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
includelib kernel32.lib

.data

.code
main proc
    mov ecx, 18
    cmp ecx, 18
    jl less_than
    jg greater_than
    je equal

less_than:
    mov eax, -1
    jmp _exit

greater_than:
    mov eax, 1
    jmp _exit

equal:
    mov eax, 0
    jmp _exit

_exit:
    invoke ExitProcess, eax
main endp

end main
