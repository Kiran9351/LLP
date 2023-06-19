section .data
	my_name db "Kiran D. Vijapure"
	my_dept db "Dept. of Computer science"
	my_desg db "Student"

section .text
	global main
	extern puts

main:
	push my_name
	call puts
	add esp,4
