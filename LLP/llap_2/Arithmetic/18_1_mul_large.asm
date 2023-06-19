	section .data

	section .text
	globla main

main:
	mov eax,1012345678
	mov ebx,202343456
	mov ecx,30
	mov edx,40

	mul ebx
	;; In this multiplication it is not possible to store multiplication
	;; value in eax only. It will stores the bits in edx too.
