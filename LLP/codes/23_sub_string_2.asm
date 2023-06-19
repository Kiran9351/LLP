;; Assembly program to find if substring exists in a string with spaces

section .data
	msg db "this is a string",0
	len equ $-msg
	msg2 db "string",0
	found db "substring found",0
	notfound db "substring not found",0

section .text
	global main
	extern printf

main:
	mov esi,msg
	mov edi,msg2
lp:
	mov al,byte[esi]
	cmp byte[esi],al
	jnz movetospace

	inc esi
	inc edi
	
	cmp byte[edi],0
	jz printtrue
	
	cmp byte[esi],0
	jz printfalse

	jmp lp

movetospace:
	mov edi,msg2
	cmp byte[esi],' '
	jz gobacktolp
	cmp byte[esi],0
	jz printfalse
	inc esi
	jmp movetospace

gobacktolp:
	inc esi
	jmp lp

printtrue:
	pusha
	push found
	call printf
	add esp,4
	popa
	jmp endof

printfalse:
	pusha
	push notfound
	call printf
	add esp,4
	popa
	jmp endof

endof:
	ret
