section .text
	global main
	extern myadd
main:
	mov eax, 10
	mov ebx, 20
	
	push eax
	push ebx
	call myadd
	add esp,8
