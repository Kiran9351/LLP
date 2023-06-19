	;; Using puts

section .rodata
	msg db "This is a sample",10,0

section .text
	global main
	extern puts

main:
	push msg
	call puts
	add esp,4
