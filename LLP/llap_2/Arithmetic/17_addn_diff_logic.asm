section .data
	input db "%d",0
	msg1 db "Enter the number of elements:",10,0
	four dd 4
	msg2 db "Element is : %d",10,0
	msg3 db "Sum is : %d",10,0
	
section .bss
	n resd 1
	numarray resd 50
	sum resd 1

section .text
	global main
	extern printf,scanf

main:
	;; for(i=0;i<n;++i) sum = sum + a[i];
	;; Address = Base + index * size
	;; address = 100 + 0*4 = 100
	;; address = 100 + 1*4 = 104
	
	push msg1
	call printf
	add esp,4

	push n
	push input
	call scanf
	add esp,8

	xor ecx,ecx
	mov esi,dword[n]

lp:	 
	mov ebx,numarray
	mov eax,dword[four]
	mul ecx
	add ebx,eax

	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa

	inc ecx
	cmp ecx,esi
	jl lp


	xor ecx,ecx
lp1:	
	mov ebx,numarray
	mov eax,dword[four]

	mul ecx
	add ebx,eax

	pusha
	push dword[ebx]
	push msg2
	call printf
	add esp,8
	popa

	inc ecx
	cmp ecx,esi
	jl lp1

	xor ecx,ecx		;1 = 0
	xor edi,edi		;sum = 0

	;; for(i=0;i<n;++i)sum = sum + arr[i]
lp2:	
	mov ebx,numarray
	mov eax,dword[four]

	mul ecx
	add ebx,eax

	add edi,dword[ebx]

	inc ecx
	cmp ecx,esi
	jl lp2

	;; mov dword[sum],edi
	;; push dword[sum]
	push edi
	push msg3
	call printf
	add esp,8
	
	ret
