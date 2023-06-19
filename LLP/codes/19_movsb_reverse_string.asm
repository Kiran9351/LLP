;; Reverse string using movsb

section .data
	msg db "Hello world!",10,0
	len equ $-msg

section .bss
	reversedmsg resb len
	
section .text
	global main
	
main:
	mov esi,msg
	mov edi,reversedmsg
	mov ecx,len	
	add esi,len		;;go to last character of msg (at 10)
	dec esi			;;go to last character of msg (at !)

while:	
	std			;;set esi direction in revers
	lodsb			;;copy character form esi to AL
	cld 			;;paste character from AL to edi
	loop while		;;decrement ecx and jmp to while

	;;print the msg

	mov eax,4
	mov ebx,1
	mov ecx,reversedmsg
	mov edx,len
	int 0x80

	ret
