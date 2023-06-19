section .data
	string db "this is a string containing words",0
	space db " ",0
	msg db "No. of words: %d",10,0
	
section .text
	global main
	extern printf
	
main:
	xor eax,eax
	mov edx,0
	mov esi,string
	xor eax,eax
	mov al,byte[space]
lp:
	cmp byte[esi],al
	jz increment
	cmp byte[esi],0
	jz increment
	inc esi
	jmp lp

increment:
	inc edx
	cmp byte[esi],0
	jz end
	inc esi
	jmp lp

end:
	push edx
	push msg
	call printf
	add esp,8

	ret
