section .data
	mynum dd 10
	msg db "Sum from 1 to %d is %d",10,0
	
section .bss
	sum resd 1

section .text
	global main
	extern printf

main:
	mov ecx,dword[mynum]
	xor esi,esi

	xor edx,edx

	;; for(i=0;i<n;++i)sum = sum + i;
lp:	
	add edx,esi
	inc esi
	cmp esi,ecx
	jle lp

	push edx
	push ecx
	push msg
	call printf
	add esp,12

	ret
	
