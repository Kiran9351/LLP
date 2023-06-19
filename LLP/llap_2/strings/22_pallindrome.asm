section .data
	string1 db "madam"
	len equ $-string1
	pallindrome db "Yes",10,0
	notpallindrome db "No",10,0

section .bss
	revstr resb len

section .text
	global main
	extern puts
	
main:
	xor eax,eax
	mov esi,string1
	mov edi,revstr
	mov ecx,len
	add esi,len
	dec esi
lp:	mov al,byte[esi]
	mov byte[edi],al
	dec esi
	inc edi
	loop lp

	push revstr
	call puts
	add esp,4
