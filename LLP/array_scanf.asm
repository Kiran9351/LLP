	section .data
	input db "%d",0
	msg db "This is sample to demonstrate eol"
	msg1 db "This is second line",10,0
	section .text
	global main
	extern printf,scanf,puts

main:
	push msg
	call puts
	add esp,4
	ret
