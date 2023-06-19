	;; This is how we take the multiple line in single variable
section .data
	RegistrationStudents db "Kiran Vijapure,n21112011",10,0
			     db "Vaibhav Vijapure,n20202020",0
	len equ $-RegistrationStudents
	
section .text
	global main

main:	
	mov eax,4
	mov ebx,1
	mov ecx,RegistrationStudents
	mov edx,len
	int 0x80
	
