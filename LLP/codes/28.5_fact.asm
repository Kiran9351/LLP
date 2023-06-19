section .text
	global fact

fact:
	push ebp		;;saving previous value of ebp
	push ebp,esp		;;copying stack pointer

	mov eax,1
	mov ecx,dword[ebp+8]	;;copying first element from the stack tha parameter evcx = n; from int fact(int n)

lp:
	mul ecx
	cmp ecx,1
	jz endof
	dec ecx
	jmp lp
	
	;;loop lp	will do same work as above 4 lines

endof:	
	mov esp,ebp
	pop ebp
	ret
