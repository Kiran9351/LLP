;;Assembly program to find the frequency of the given character in the string

section .data
	msg db "Enter character: ",0
	input db "%c",0
	mystring db "this is a string",0
	msg2 db "Count of the character %s is %d",10,0

section .bss
	ch resb 1

section .text
	global main
	extern printf,scanf

main:
	pusha
	push msg
	call printf
	add esp,4
	popa

	pusha
	push ch	
	push input
	call scanf
	add esp,8
	popa

	xor ecx,ecx
	mov al,byte[ch]

	mov byte[esi],al
	inc esi
	move byte[esi],0
	dec esi

	mov ebx,mystring
while:
	cmp byte[ebx],0
	jz endof
	cmp byte[ebx],al
	jnz nocount
	inc ecx

nocount:
	inc ebx
	jmp while

endof:
	pusha
	push ecx
	push esi
	push msg2
	call printf
	add esp,12
	
	ret
