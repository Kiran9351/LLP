	section .data

	section .text
	global main

main:
	mov eax,4016
	mov ebx,5
	mov ecx,30
	mov edx,40

	xor edx,edx
	div ebx
	
