
	
section .text
	global myadd

myadd:

	;;We can replace next two instructions with enter 0,0 
;;	push ebp
;;	mov ebp,esp
	enter 0,0
	mov ecx,dword[ebp+8]
	mov edx,dword[ebp+12]
	add ecx,edx
	mov eax,ecx
	leave
;;	mov esp,ebp
;;	pop ebp
		

	ret  
