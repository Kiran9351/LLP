

section .data
	input db "%d",0
	output db "%d ",0
	newl db 10
	msg db "Enter size of arrays : ",0
	msg1 db "Enter first array:",10,0
	msg2 db "Enter second array:",10,0
	msg3 db "First matrix is : ",0
	msg4 db "Second matrix is : ",0
	msg5 db "Sum array is : ",0

section .bss
	n resd 1
	arr1 resd 50
	arr2 resd 50
	arr3 resd 50

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
	jz secondarr
	jmp lp

secondarr:

	push msg2
	call printf
	add esp,4
		
	xor ecx,ecx
	mov ebx,arr2
lp2:
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
	jmp lp2

toprint:

	push msg3
	call printf
	add esp,4

	xor ecx,ecx
	mov ebx,arr1
lp3:
	pusha
	push dword[ebx]
	push output
	call printf
	add esp,8	
	popa
	
	inc ecx
	add ebx,4
	cmp ecx,dword[n]
	jz secondprint
	jmp lp3

secondprint:

	push newl
	call printf
	add esp,4
	
	push msg4
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
	jz tosum 
	jmp lp4

tosum:

	xor ecx, ecx
	mov esi, arr1
	mov edi, arr2
	mov ebx,arr3
lp5:
	mov edx,dword[esi]
	add dword[ebx],edx
	mov edx,dword[edi]
	add dword[ebx],edx

	inc ecx
	add esi,4
	add edi,4
	add ebx,4
	cmp ecx,dword[n]
	jz printsum
	jmp lp5

printsum:
	push newl
	call printf
	add esp,4

	push msg5
	call printf
	add esp,4
	
	xor ecx,ecx
	mov ebx, arr3
lp6:
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
	jmp lp6

end:
	ret

