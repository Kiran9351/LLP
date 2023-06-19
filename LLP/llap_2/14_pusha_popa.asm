;; pusha : push all general purpose registers on stack eax,ecs,edx,ebx,esp,ebp,esi,edi
;; popa : pop all general purpose registers from stack in reverse order i.e. edi,esi,ebp,esp,ebx,edx,ecx,eax

section .data
	msg db "This is an overview of PUSHA and POPA instructions",10,0
	
section .text
	global main
	extern printf
	
main:
	pusha
	push msg
	call printf
	add esp,4
	popa
	
