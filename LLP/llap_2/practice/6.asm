

section .data
	input db "%d",0
	output db "%d ",0
	newl db 10,0
	msg db "Enter size of arrays : ",0
	msg1 db "Enter first array:",10,0
	msg2 db "First array is : ",0
	msg3 db "Reversed array is : ",0

section .bss
	n resd 1
	arr1 resd 50
	arr2 resd 50

section .text
	global main	
	extern printf,scanf

main:

	push msg 
	call printf
	add esp,4
	
	push n
	push input
	call scanf
	add esp,8
	
	push msg1
	call printf
	add esp,4

	xor ecx,ecx
	mov ebx,arr1
lp:
	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa
	
	inc ecx
	add ebx,4
	cmp ecx,dword[n]
	jz toprint
	jmp lp

toprint:

	push msg2
	call printf
	add esp,4

	xor ecx,ecx
	mov ebx,arr1
lp2:
	pusha
	push dword[ebx]
	push output
	call printf
	add esp,8	
	popa
	
	inc ecx
	add ebx,4
	cmp ecx,dword[n]
	jz toreverse
	jmp lp2

toreverse:

	xor ecx,ecx
	mov esi,arr1
	mov edi,arr2
	mov eax,4
	mul dword[n]
	add edi,eax
	sub edi,4
lp3:
	mov ebx,dword[esi]
	mov dword[edi],ebx
	
	inc ecx
	add esi,4
	sub edi,4
	cmp ecx,dword[n]
	jz print2
	jmp lp3

print2:
	
	push newl
	call printf
	add esp,4
	
	push msg3
	call printf
	add esp,4
	
	xor ecx,ecx
	mov ebx,arr2
lp4:
	pusha
	push dword[ebx]
	push output
	call printf
	add esp,8	
	popa

	inc ecx
	add ebx,4
	cmp ecx,dword[n]
	jz end
	jmp lp4

end:
	ret

