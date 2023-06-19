section .data
	first db "This is a source string containing string",0
	lenfirst equ $-first
	second db "string",0
	lensecond equ $-second
	found db "sub-string found",10,0
	notfound db "sub-string not found",10,0

section .text
	global main
	extern puts

main:
	mov esi,first
	mov edi,second
lp:	mov al,byte[edi]
	cmp al,byte[esi]
	jnz lp1
	inc esi
	inc edi
	cmp byte[esi],0
	jz towardsend
	jmp lp

lp1:	
	inc esi
	cmp byte[esi],' '
	jz lp2
	jmp lp1
	
lp2: 	
	cmp byte[edi],10
	jz towardsendother
	inc esi
	mov edi,second
	jmp lp
	
towardsend:	
	
	push notfound
	call puts
	add esp,4
	jmp endofpg

towardsendother: 
	
	push found
	call puts	
	add esp,4

endofpg: ret
	
	

