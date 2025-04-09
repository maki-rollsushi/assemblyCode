.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	num1 DWORD 15
	num2 DWORD 8

.code
main proc

	;increment decrement
	mov eax, num1
	inc eax
	dec eax


	;num1+num2
	;addition (add)
	mov eax, num1
	mov ebx, num2
	add eax, ebx	;eax = eax+ebx --> 15+8=23 or 17(Hex)
	


	;eax-ebx
	;subtraction (sub)
	sub eax, ebx	;eax = eax-ebx  --> 23-8=15 or F(Hex)

	;eax*ebx
	;unsigned multiplication (mul) , automatically selects eax as the first operand.

	mov eax, -1
	mov ecx, 2
	mul ecx  
	
	;signed multiplication (imul)
	; can have two operads
	mov eax, 0
	mov ecx, 2
	imul ecx, -1

	;quotient is in al remainder in ah
	; you cannot divide a 32-bit integer by a 32-bit you must combine the eax and edx to be divided.
	;cannot have two operands~
	mov eax, 10         ; Dividend in eax
	mov edx, 0          ; Clear edx to make edx:eax = 0x0000000A (10)
	mov ecx, 3          ; Divisor in ecx
	div ecx             ; eax = eax / ecx, edx = remainder

	;this can be mitigated by dividing a 32-bit register by a 16-bit divisor. (combining ex with dx)
	mov eax, 0
	mov edx, 0
	mov ax, 10
	mov dx, 0
	mov cx, 4
	div cx

	;for division of 16-bits by 8-bits it ax suffices
	;qoutient is stored at al and remainder at ah
	xor eax, eax
	mov ax, 11
	mov cl, 2
	div cl
	invoke ExitProcess, 0
main endp

	


end main

