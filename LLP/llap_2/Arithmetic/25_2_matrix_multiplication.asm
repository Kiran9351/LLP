section .data
	matrix1 dd 1,2,3
	        dd 4,5,6
	        dd 7,8,9
	matrix2 dd 1,2,3
	        dd 4,5,6
	        dd 7,8,9
	
	msg db "%d ",0
	newline db 10,0
	firstmatrix db "The first matrix is:",10,0
	secondmatrix db "This second matrix is:",10,0
	transpose2 db "Transpose of second matrix is:",10,0

section .bss
	matrix3 resd 9

section .text
	global main
	extern printf

main:

	;; Printing first matrix
	pusha
	push firstmatrix
	call printf
	popa
	
	mov ecx,matrix1
	mov ebx,0
	mov edi,0
	
lp1:	
	pusha
	push dword[ecx]
	push msg
	call printf
	add esp,8
	popa

	inc ebx
	cmp ebx,9
	jz printsecond
	add ecx,4
	cmp edi,2
	jz newl
	inc edi
	jmp lp1

newl:
	pusha
	push newline
	call printf
	add esp,4
	popa
	mov edi,0
	jmp lp1

printsecond:
	pusha
	push newline
	push newline
	call printf
	add esp,12
	popa

	
	pusha
	push secondmatrix
	call printf
	add esp,4
	popa

	mov ecx,matrix2
	mov ebx,0
	mov edi,0
lp2:	
	pusha
	push dword[ecx]
	push msg
	call printf
	add esp,8
	popa

	inc ebx
	cmp ebx,9
	jz printtranspose
	add ecx,4
	cmp edi,2
	jz newl2
	inc edi
	jmp lp2

newl2:
	pusha
	push newline
	call printf
	add esp,4
	popa
	mov edi,0
	jmp lp2

printtranspose:
	
	;; 1 2 3
	;; 4 5 6
	;; 7 8 9

	pusha
	push newline
	push newline
	call printf
	add esp,8
	popa

	pusha
	push transpose2
	call printf
	add esp,4
	popa

	mov ecx,matrix2
	mov ebx,0
	mov edi,0
	mov esi,0
	mov eax,4
lp3:	
	pusha
	push dword[ecx]
	push msg
	call printf
	add esp,8
	popa

	inc ebx
	cmp ebx,9
	jz mult
	add ecx,12
	cmp edi,2
	jz newl3
	inc edi
	jmp lp3

newl3:
	pusha
	push newline
	call printf
	add esp,4
	popa
	mov edi,0
	mov ecx,matrix2
	inc esi
	mul esi
	add ecx,eax
	jmp lp3

mult:
	;; 1 2 3 	1 2 3
	;; 4 5 6	4 5 6
	;; 7 8 9	7 8 9

	mov edi,0
	mov edx,0
	mov ecx,matrix1
	mov ebx,matrix2
	mov esi,matrix3

lp4:
	mov eax,dword[ecx]
	mul dword[ebx]
	add dword[esi],eax

	add ecx,4
	add ebx,12
	cmp edi,2
	jz adj
	inc edi
	jmp lp4
	
adj:
	inc edx
	mov ebx,matrix2
	mov eax,4
	mul edx
	add ebx,eax
	mov edi,0
	
