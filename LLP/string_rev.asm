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
	mov ecx,len
	mov esi,mystring
	mov edi,mydest
	add esi,ecx
	dec esi
	dec esi
lp1: 	xor eax,eax
	mov al, byte[esi]
	mov byte[edi], al
	dec esi
	inc edi
	loop lp1	; Loop internally uses/operates ecx

	push mydest
	call puts
	add esp,4
	
	ret
