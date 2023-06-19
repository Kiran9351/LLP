	;; Reverse string

section .data
	string db "This is a sample",10,0
	len equ $-string 
	msg db "%c",0
section .text
	global main
	extern printf

main:

	mov esi,len
	dec esi
	dec esi
	dec esi
lp:	
	mov ebx,string
	mov eax,1
	mul esi
	add ebx,eax
	pusha
	push dword[ebx]
	push msg
	call printf
	add esp,8
	popa

	dec esi
	cmp esi,-1
	jg lp
	
