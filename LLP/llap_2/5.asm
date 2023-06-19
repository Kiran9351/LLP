	;; Using puts

section .rodata
	msg db "This is a sample",10,0

section .text
	global main
	extern printf

main:
	push msg
	call printf
	add esp,4
