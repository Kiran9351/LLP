section .data
	msg db "this is a string",0
	len equ $-msg
	output db "%d",10,0
	
section .bss
	msg2 reab len

section	.text
	global main
	extern printf,puts

main:
	mov ecx,msg
	mov edx,msg2

while:
	mov al,byte[ecx]
	mov byte[edx],al
	mov byte[ecx],0
	jz endof
	inc ecx
	inc edx
	jmp while

endof:
	push msg2
	call puts
	add esp,4
	ret

