section .data
	msg db "Enter number: ",0
	input db "%d",0
	msg1 db "Given number is armstrong number",10,0
	msg2 db "Given number is not armstrong number",10,0
	ten dd 10
section .bss
	num resd 1
	sum resd 1
	
section .text
	global main
	extern printf,scanf

main:
	push msg
	call printf
	add esp,4
	
	push num
	push input
	call scanf
	add esp,8
	
	mov ebx,dword[num]
	mov ecx,10
	
	cmp ebx,0
	jz chkarm
	mov eax,ebx
	xor edx,edx
	div ecx
	mov ebx,eax
	jmp cube
	
