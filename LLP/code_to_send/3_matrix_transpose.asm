section .data
	matrix dd 10,20,30
	       dd 40,50,60
               dd 70,80,90
	msg db "%d ",0
	newline db 10,0

section .text
	global main
	extern printf

main:

	mov ecx,matrix
	mov edi,0
	mov ebx,0
	mov esi,0
	mov eax,4
lp:	
	pusha
	push dword[ecx]
	push msg
	call printf
	add esp,8
	popa

	inc ebx
	cmp ebx,9
	jz end
	add ecx,12
	cmp edi,2
	jz newl
	inc edi
	jmp lp

newl:
	pusha
	push newline
	call printf
	add esp,4
	popa
	mov edi,0
	inc esi
	mul esi
	mov ecx,matrix
	add ecx,eax
	jmp lp

end:
	push newline
	call printf
	add esp,4
	ret
