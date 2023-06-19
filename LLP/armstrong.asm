section .data
	msg db "Enter the number : ",0
	input dd "%d",0
	armstrong db "Number is armstrong",10,0
	notarmstrong db "Number is not armstrong",10,0
	ten dd 10
section .bss
	num resd 1

section .text
	global main
	extern printf,scanf

main:
	push msg
	call printf
	add esp,4

	push num
	push input
	call scanf
	add esp, 8

	mov eax,dword[num]

	xor edx,edx
	xor ecx,ecx

	div dword[ten]

	mov ebx,eax
	
	mov eax,edx
		
	mul eax
	mul eax
	
	add ecx,eax
