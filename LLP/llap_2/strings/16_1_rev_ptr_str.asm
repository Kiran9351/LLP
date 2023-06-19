	;; Program to display a reverse string using write system call with char by char method
	
section .data
	string db "This is a sample",10,0
	len equ $-string

section .text
	global main

main:

	mov esi,len
	mov ebx,string
	add ebx,len
	dec ebx

lp:	
	pusha
	mov eax,4
	mov ecx,ebx
	mov ebx,1
	mov edx,1
	int 0x80
	popa
	dec ebx
	dec esi
	jnz lp
