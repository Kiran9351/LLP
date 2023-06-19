
section .data
	input db "%d",0
	msg1 db "Enter number of elements in array:",10,0
	msg2 db "You have entered %d as total number of elements",10,0
	msg3 db "Enter elements of an array:",10,0
	msg4 db "You entered %d at index %d",10,0
	msg5 db "sum is %d",10,0

section .bss
	n resd 1
	arr resd 50
	sum resd 1

section .text
	global main
	extern printf,scanf

main:

	push msg1
	call printf
	add esp,4

	push n
	push input
	call scanf 
	add esp, 8

	push dword[n]
	push msg2
	call printf
	add esp,8

	push msg3
	call printf
	add esp,4
	
	mov ebx,arr
	xor ecx,ecx
lp:
	cmp ecx,dword[n]
	jz print
	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa
	inc ecx
	add ebx,4
	jmp lp		

print:
	xor ecx,ecx
	mov ebx,arr
lp2:
	cmp ecx,dword[n]	
	jz tosum
	
	pusha
	push ecx
	push dword[ebx]
	push msg4
	call printf
	add esp,12
	popa
	
	inc ecx
	add ebx,4
	jmp lp2

tosum:

	xor ecx,ecx
	mov ebx,arr
lp3:
	cmp ecx,dword[n]
	jz printsum
	mov esi,dword[ebx]	
	add dword[sum],esi
		
	add ebx, 4
	inc ecx
	jmp lp3

printsum:
	
	push dword[sum]
	push msg5 
	call printf
	add esp,8

	ret
