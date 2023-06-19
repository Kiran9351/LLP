
section .data
	input db "%d",0
	msg db "Enter size of array: ",0
	msg1 db "Enter array elements:",10,0
	msg2 db "Diff is %d",10,0

section .bss
	n resd 1
	arr resd 50
	evenSum resd 1
	oddSum resd 1

section .text
	global main
	extern printf,scanf
	
main:
	push msg	
	call printf
	add esp,4

	push n
	push input
	call scanf
	add esp,8
	
	push msg1
	call printf
	add esp,4

	xor ecx,ecx
	mov ebx,arr	
lp:
	pusha
	push ebx
	push input	
	call scanf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[n]
	jz tosum
	add ebx,4
	jmp lp

tosum:
	xor ecx,ecx
	mov ebx,arr
lp1:
	xor edx,edx
	mov eax,dword[ebx]
	mov esi,2
	div esi
	cmp edx, 0
	jz addtoeven
	jmp addtoodd
lp2:	cmp ecx,dword[n]	
	jz todiff
	add ebx,4
	inc ecx
	jmp lp1

addtoeven:
	mov edi,dword[ebx]	
	add dword[evenSum],edi
	jmp lp2

addtoodd:
	mov edi,dword[ebx]
	add dword[oddSum],edi
	jmp lp2

todiff:
	mov edi,dword[evenSum]
	sub edi,dword[oddSum]

	pusha
	push edi
	push msg2
	call printf
	add esp,8
	popa
	
	ret


