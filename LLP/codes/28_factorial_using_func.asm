section .data
	msg db "factorial is %d",10,0
	
section .text
	global main
	extern printf,fact

main:
	mov eax,5	;;n = 5
	
	push eax
	call fact
	add esp,4	;;fact(5);
	
	;;result of fact(5) will be in eax

	push eax 
	push msg
	call printf
	add esp,8
	
	ret
