section .data
	msg db "Hello world!",10,0

section .text
	global main
	extern print

main:
	push msg
	call printf
	add esp,4
	ret
