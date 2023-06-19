section .data
	first db "this is a complete string",0
	second db "complete",0
	notfound db "Substring not found",10,0
	stringfound db "Substring found",10,0
	
section .text
	global main
	extern puts
	
main:

	mov esi,first
	mov edi,second
lp:	
	xor eax,eax
	mov al,byte[esi]
	cmp al,byte[edi]
	jz compare
	cmp byte[esi],0
	jz terminate
	inc esi
	jmp lp

compare:
	inc esi
	inc edi
	cmp byte[esi],0
	jz terminate
	cmp byte[edi],0
	jz successful
	mov al,byte[esi]
	cmp al,byte[edi]
	jnz lp
	jmp compare

successful:
	push stringfound
	call puts
	add esp,4
	jmp end
	
terminate:
	push notfound
	call puts
	add esp,4
	
end:	ret
	
