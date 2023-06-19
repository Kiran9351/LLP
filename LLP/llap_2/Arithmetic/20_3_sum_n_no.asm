	;; loop inbuilt instruction
	;; Works with ecx gpr.
	;; This is to replace jz instruction.

section .data
	input db "%d",0
	msg db "Sum from 1 to %d is %d",10,0
	
section .bss
	sum resd 1
	mynum resd 1

section .text
	global main
	extern printf,scanf

main:
	push mynum
	push input
	call scanf
	add esp,8
	
	mov ecx,dword[mynum]
	mov dword[sum],0

	;; for(i=0;i<n;++i)sum = sum + i

	;; cmp ecx,0
	;; jz final
	
lp:	add dword[sum],ecx
	;; dec ecx
	;; jmp lp
	loop lp			;Here we are assuming that 0 is not input

final:	
	push dword[sum]
	push dword[mynum]
	push msg
	call printf
	add esp,12

	ret
	
