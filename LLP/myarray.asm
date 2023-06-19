section .data 
	input dd "%d",0
	msg db "Enter number of elements in array : ",0
	msg1 db "Entered number is : %d",10,0
	msg2 db "Maximum number is : %d",10,0
section .bss 
	n resd 1
	myarray resd 10

section .text 
	global main
	extern printf,scanf,puts

main:
	push msg
	call printf
	add esp,4

	push n
	push input
	call scanf
	add esp,8
	
	push dword[n]
	push msg1
	call printf
	add esp,8

	xor ecx,ecx
lp:	mov ebx,myarray
	mov eax,4
	mul ecx
	add ebx,eax
	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa
	inc ecx
	cmp ecx,dword[n]
	jl lp

	xor ecx,ecx
lp1:	mov ebx,myarray
	mov eax,4
	mul ecx
	add ebx,eax
	pusha
	push dword[ebx]
	push msg1
	call printf
	add esp,8
	popa
	inc ecx
	cmp ecx,dword[n]
	jl lp1

	
	xor ecx,ecx
	mov edx,myarray
lp3:	mov ebx,myarray
	mov eax,4	
	mul ecx
	add ebx,eax
	
	cmp edx,ebx
	jl lp2
lp2: 	mov edx,ebx

	inc ecx
	cmp ecx,dword[n]
	jl lp3
	
	pusha
	push dword[edx]
	push msg2
	call printf
	add esp,8
	popa
	
	ret
