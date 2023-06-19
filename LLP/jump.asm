	section .text
	global main

main:
	mov eax,10
	mov ebx, 20
a:	mov ecx, 30
	mov edx, 40
	mul ebx
	div ecx
	;; jmp a
	;; jz a 			;jump zero : If above flag is zero then only jump.
	jnz a			;jump non zero : if above flag is not zero.
	xchg eax, ebx
	ret
	
