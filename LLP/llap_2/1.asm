section .data
	;; everything which is initialized
	;; db = byte[1], dw = word[2], dd = double[4], dq = quad[8], dt = ten[10]
	a db 'a'
	b db 10
	a1 dw 'ab'
	b1 dw 10
	a2 dd 'abcd'
	b2 dd 10

section .rodata		;read only data
	;; Read only data, this can not be manipulated
	msg db "This is a sample",10,0

section .bss
	;; Containing uninitialized variables/identifiers
	;; resb,resw,resd,resq,rest -> res stands for reserve 
	;; identifier res(b/w/d/q/t) size/count = size/count * (b/w/d/q/t)

	a3 resb 10		;10 bytes reserved
	b3 resw 10		;20 bytes reserved
	c4 resd 10		;40 bytes reserved
	d4 resq 10		;80 bytes reserved

	section .text
	global main
	extern printf

main:
	push msg 		; 4bytes - IA-32 architecture
	call printf
	add esp,4
