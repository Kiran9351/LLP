
section .data
	string1 db "First string ",0
	string2 db "First string",0
	same db "Strings are same",10,0
	notsame db "String are not same",10,0
	
section .text
	global main
	extern puts
main:

	mov esi,string1
	mov edi,string2

	;; We cannot write two memory operands
	;; cmp byte[esi],byte[edi]

lp:	xor eax,eax
	;; al,bl,cl,dl,ah,bh,ch,dh
	mov al,byte[esi]
	cmp al,byte[edi]
	jnz ntsame
	inc esi
	inc edi
	cmp byte[esi],0
	jnz lp

	push same
	call puts
	add esp,4
	jmp lp1

ntsame:
	push notsame
	call puts
	add esp,4
	jmp lp1

lp1:
	ret
