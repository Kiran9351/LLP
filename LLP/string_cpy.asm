section .data
	mystring db "Low level Assembly Program",0
	len equ $-mystring
	msg db "Length is %d",10,0

section .bss
	mydest resb len
	
section .text
	global main
	extern printf,puts

main:
	push len
	push msg
	call printf
	add esp,8
	
	mov ecx,len
	mov esi,mystring
	mov edi,mydest
lp1: 	xor eax,eax
	mov al, byte[esi]
	mov byte[edi], al
	inc esi
	inc edi
	loop lp1	; Loop internally uses/operates ecx.

lp:	push ecx
	push msg
	call printf
	add esp,8

	push mydest
	call puts
	add esp,4
	
	ret
