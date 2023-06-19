
section .data
	myname db "Kiran D. Vijapure",10,0
	mydept db "Dept. of Computer science"
	mydesg db "student"
	
section .text
	global main
	extern puts, printf
	
main:
	push myname
	call puts
	add esp,4

	push myname 
	call printf
	add esp,4

	ret

