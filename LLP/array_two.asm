section .data
	input db "%d",0
	msg db "Enter count required:",0
	msg1 db "Entered Number is:%d",10,0

section .bss
	;; resd - reserve double
	n resd 1
	myarray1 resd 10
	myarray2 resd 10

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
lp:	mov ebx,myarray1
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
lp1:    mov ebx,myarray1
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
lp2:	mov ebx,myarray2
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
	jl lp2
	
	xor ecx,ecx
lp3:	mov ebx,myarray2
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
	jl lp3
	
	ret
