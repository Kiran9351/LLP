	;; Display string using write system call
section .data
	msg db "This is a sample",10,0
	len equ $-msg

section .text
	global main

main:
	;; Whenever one uses system call use registers as described below

	mov eax,4		;add system call number in eax i.e. 4
	mov ebx,1		;First parameter value of sys call.
	mov ecx,msg		;Second parameter value of sys call.
	mov edx,len		;Third parameter value of sys call
	;; Instruction to be used to execute interrupt
	;; All of the suystem call undet unistd_32.h can handle using this
	int 0x80

	mov eax,1		;Exit system call
	int 0x80
