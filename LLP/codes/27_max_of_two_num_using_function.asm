;;Assembly program for finding max of two numbers

section .data
	msg db "Maximum is %d",10,0
	
section .text
	global main
	extern printf,max
	
main:
	mov eax,25	;;int a = 25
	mov ebx,30	;;int b = 30
	
	push eax 
	push ebx
	call max	;;calling eax = max(a,b);
	add esp,8
	
	;;max will be stored in eax
	;; printing max value

	push eax
	push msg 
	call printf
	add esp,8

	ret
