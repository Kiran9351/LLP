section .data
	;msg db "Kiran",10,0
	msg1 db "The number is : %d",10,0
	a dd 20	

section .text
	global main
	extern printf
main:
	;push a 	;This will print address of a.
	push dword[a]	;This will print value of a.
	push msg1
	call printf
	add esp, 8
	ret
