	section .data
	a dd 10
	b db 10
	msg db "Value of a is %d",10,0
	msg1 db "Valud of b is %c",10,0
	section .text
	global main
	extern printf

main:
	;; printf("Value of a is %d\n",a);
	;; push a 	here we are pushing address of a not value of a.
	push dword [a]		;here we have to tell size.
	push msg	
	call printf
	add esp,8		;for one push 4 bytes. therefore 8.
	
	;push byte [a] This will give us error because push needs 4 bytes
	push dword [b]
	push msg1
	call printf
	add esp,8
	ret

	
