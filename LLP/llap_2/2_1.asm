section .data			;
	my_name db "Kiran D. Vijapure",10,0 ;10 = Newline = \n
	my_dept db "Dept. of Computer science"	
	my_desg db "Student"
	
section .text
	global main
	extern puts,printf

main:
	push my_name
	call puts
	add esp,4

	push my_name
	call printf
	add esp,4

	push my_name
	call printf
	add esp,4
	
	push my_name
	call printf
	add esp,4
