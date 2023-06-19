section .data
	mystring db "Low level Assembly Program",0
	len equ $-mystring
	msg db "Length is %d",10,0

section .bss
	mydest resb len
	
section .text
	global main
	extern printf

main:
	push len
	push msg
	call printf
	add esp,8
	
	xor ecx,ecx
	mov esi,mystring
lp1:	cmp byte[esi],0
	jz lp
	inc ecx
	inc esi
	jmp lp1

lp:	push ecx
	push msg
	call printf
	add esp,8
	
	ret
