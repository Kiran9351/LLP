

section .data
	student db "n20112038, SHUBHAM KOUL, M, MCA",0
		db "n20112023, MANSI MANDHARE, F, MCA",0
		db "n20111009, VISHESH MALIK, M, MSC",0
		db "n20112002, SAGAR KIVALE, M, MCA",0
		db "n20112024, MAYURI GULDAGAD, F, MCA",0
		db "n20112003, DURGA PATIL, F, MCA",0
		db "n20112015, CHETAN BISHT, M, MCA",0,-1
	len equ $-student
	msg db "%s",0
	newl db 10
	
section .bss
	
section .text
	global main
	extern puts,printf

main:

	mov edi,student
	mov ecx,len
lp:	
	cmp byte[edi],-1
	jz terminate
	mov esi,edi
	mov al,','
	repne scasb
	
	mov edx,edi
	dec edx
	sub edx,esi
	mov al,','
	repne scasb
	inc edi
	cmp byte[edi],'M'
	jz lp1
	mov al,0
	repne scasb
	jmp lp
lp1:
	pusha
	mov ecx,esi
	mov eax,4
	mov ebx,1
	int 0x80
	popa
	pusha
	mov ecx,newl
	mov ebx,1
	mov eax,4
	mov edx,1
	int 0x80
	popa
	mov al,0
	repne scasb
	jmp lp

terminate:
	ret
