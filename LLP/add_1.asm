section .data
	msg db "The addition is : %d",10,0
	msg1 db "Multiplication is : %d",10,0
	input dd "%d",0
	msg3 db "Entered number is : %d",10,0
	msg4 db "Division is : %d",10,0
	a dd 10
	b dd 20

section .bss
	c resd 1
	d resd 1 

section .text
	global main
	extern printf
	extern scanf

main:	
	mov eax,dword[a]
	mov ebx,dword[b]
	add eax, ebx
	
	pusha
	push eax
	push msg
	call printf
	add esp,8
	popa

	
	xor edx,edx
	mul ebx
	
	pusha
	push eax
	push msg1
	call printf
	add esp, 8
	popa
	
	pusha
	push c
	push input
	call scanf
	add esp, 8
	popa

	pusha
	push dword[c]
	push msg3
	call printf
	add esp,8
	popa
	
	pusha
	push d
	push input
	call scanf
	add esp,8
	popa
	
	pusha	
	push dword[d]
	push msg3
	call printf
	add esp, 8
	popa

	mov eax,dword[c]
	mov ebx,dword[d]
	div ebx

	push eax
	push msg4
	call printf
	add esp,8

	ret


