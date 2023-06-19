section .data
	matrix dd 10,20,30
	       dd 40,50,60
	       dd 70,80,90
	msg db "%d ",0
	newline db 10,0
	;; Print given matrix
	;; Print transpose of matrix

section .text
	global main
	extern printf
	
main:	
	mov ecx,matrix
	mov edx,0
	mov ebx,0
lp:	
	pusha
	push dword[ecx]
	push msg
	call printf
	add esp,8
	popa
	inc ebx
	cmp ebx,9
	jz terminate
	add ecx,4
	cmp edx,2
	jz newl
	inc edx
	jmp lp

newl:
	pusha
	push newline
	call printf
	add esp,4
	popa
	mov edx,0
	jmp lp		

terminate:
	push newline
	call printf
	add esp,4
	ret
