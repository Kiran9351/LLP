
section .data
	msg db "This is sample string",10,0
	len equ $-msg
	
section .text
	global main
	
main:
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len

	int 0x80

	mov eax, 1
	int 0x80
