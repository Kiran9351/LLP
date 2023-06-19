
section .data
	msg db "Maximum is %d",10,0
	
section .text
	global main
	extern Max,printf

main:
	mov eax,10
	mov ebx,20

	;; Push the parameters to call the function in c file	
	push eax
	push ebx
	call Max
	add esp,8

	;;eax holds the return value

	push eax
	push msg
	call printf
	add esp,8

	;;Compilation process
	;; First create object file of c function in 32 architecture
	;; for eg. gcc max.c -c -m32 -g -Fdwarf

	;; Then create object file of asm file 
	;; for eg. nasm -felf32 maxcallassembly.asm -g -Fdwarf
	
	;;Then compile together in gcc
	;; for eg. gcc -m32 maxcallassembly.o max.o -g -Fdwarf

	;; then execute the a.out file.
