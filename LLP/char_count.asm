section .data
	mystring db "Low level Assembly Program",0
	len equ $-mystring
	msg db "Space count is %d",10,0
	input db "%c",0
	msg1 db "Enter the character to search : ",10,0

section .bss
	mydest resb len
	a resb 1
	b resb 1
	
section .text
	global main
	extern printf,scanf,puts

main:
	push msg1
	call printf
	add esp,4
			
	push a
	push input
	call scanf 
	add esp,8
	
	mov b,byte[a] - 32
	
	xor ecx,ecx
	mov esi, mystring
lp:	xor eax,eax
	cmp byte[esi],0
	jz lp1
	mov al,byte[a]
	cmp byte[esi],al
	jnz lp2
	inc ecx
lp2:	inc esi
	jmp lp

lp1: 	push ecx
	push msg
	call printf
	add esp,8
	

	ret
