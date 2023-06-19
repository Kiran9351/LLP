	section .text
	global main

main:
	mov eax, 10
	mov ebx, 20
	mov ecx, 30
	mov edx, 40
	mul ebx
	div ecx
	ret
