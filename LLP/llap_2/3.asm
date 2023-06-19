	;; WHy we need add esp,4?
section .data
	my_name db "Kiran D. Vijapure",10,0
	my_dept db "Dept. of Computer science"
	my_desg db "Student"

section .text
	global main
	extern puts,printf
	
main:
	push my_name
	call puts
