
section .data
	ten dd 10
	output db "%d",10,0
section .bss
	sum resd 1

section .text
	global strong
	extern printf
	
strong:
	
	push ebp
	mov ebp,esp
	mov esi,dword[ten]
	mov ebx,dword[ebp+8]
lp2:
	cmp ebx,0
	jz chkS
	mov eax,ebx
	xor edx,edx
	div esi
	
	mov ecx,eax
	mov edi,edx
	mov eax,1
lp1:
	cmp edi,0
	jz addS 
	mul edi
	dec edi
	jmp lp1

addS:
	add dword[sum],eax
	mov ebx,ecx
	jmp lp2

chkS:
	mov ebx,dword[ebp+8]
	cmp dword[sum],ebx
	jz yes
	jmp no

yes:
	;;pusha
	;;push dword[sum]
	;;push output
	;;call printf
	;;add esp,8
	;;popa
	mov eax,1
	jmp end
no:
	;;pusha
	;;push dword[sum]
	;;push output
	;;call printf
	;;add esp,8
	;;popa
	mov eax,0

end:
	mov esp,ebp
	pop ebp
	
	ret

