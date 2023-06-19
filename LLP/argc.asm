section .data
	msg1 db "Insufficient parameters/arguments",10,0
	msg2 db "envp[%d] = %s and argv[%d] = %s",10,0
	msg3 db "%s",10,0

section .bss
	
section .text
	global main
	extern printf,puts

main:
	push ebp
	mov ebp, esp
	mov ecx, [ebp + 4]
	mov ecx, [ebp + 8]
	cmp ecx, 2
	jb endl		;; jb = jump if below

	xor edx,edx
lp:	push edx
	mov esi, [ebp + 12]		;; argv
	mov edi, [ebp + 16]		;; envp
	push dword[esi + edx * 4]	;; argv[i]
	push edx			;; i
	push dword[esi + edx * 4]	;; envp[i]
	push edx			;; i
	push msg2
	call printf
	add esp,20
	pop edx
	inc edx
	cmp edx,12
	jb lp

	jmp terminate

endl:
	push msg1
	call printf
	add esp,4

terminate:
	mov esi,[ebp + 12]		;;argv
	mov edx, dword[esi + 4]
	
	push edx
	call atoi
	add esp,4
	
	mov edx, 10
	add edx, eax	
		
	mov esp, ebp
	pop ebp
	ret

	

