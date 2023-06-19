

section .data
	mystring db "India is my contry, all indians are my brothers and sisters",0
	len equ $-mystring
	newl db 10

section .bss
	tempstring resb len
	
section .text
	global main
	extern puts

main:

	mov edi, mystring
	mov ecx, len
	
	mov esi,edi
	cmp byte[edi],0
	jz terminate
	mov al,' '
	repne scasb
	mov edx,edi
	sub edx,esi
	dec edx
	cmp edx,4
	jnz lp
	pusha
	mov ecx,esi
	mov eax,4
	mov ebx,0
	int 0x80
	
	mov eax,4
	push edx
	mov ebx,0
	mov ecx,newl
	mov edx,1
	int 0x80
	pop edx
	
	popa
	jmp lp

terminate:
	ret

