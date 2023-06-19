section .data
	myString db "this is a sample",0
	msg db "Length of string is %d",10,0
section .text
	global str_len
	extern printf,puts
str_len:
	xor ecx,ecx
	mov edx,myString
while:
	cmp byte[edx],0
	jz gotoend
	inc ecx
	inc edx
	jmp while
gotoend:
	push ecx
	push msg
	call printf
	add esp,8

	ret	
