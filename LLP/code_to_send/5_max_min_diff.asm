;;Diff between max and min

section .data
	input db "%d",0
	msg1 db "Enter size of array : ",0
	msg2 db "Enter elemetns of an array:",10,0
	msg3 db "Diff is %d",10,0

section .bss
	n resd 1
	arr resd 50

section .text	
	global main
	extern printf,scanf

main:
	push msg1
	call printf
	add esp,4	
	
	push n
	push input
	call scanf
	add esp,8

	push msg2 
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
	jz maxmin
	add ebx,4
	jmp lp

maxmin:
	xor ecx,ecx
	mov ebx,arr

	mov esi,dword[ebx]
	mov edi,dword[ebx]
lp1:
	cmp esi,dword[ebx]
	jg chgmin
	cmp edi,dword[ebx]
	jl chgmax
lp3:	inc ecx
	cmp ecx,dword[n]
	jz todiff
	add ebx,4
	jmp lp1

chgmin:
	mov esi,dword[ebx]
	jmp lp3
chgmax:
	mov edi,dword[ebx]
	jmp lp3

todiff:
	sub edi,esi

	push edi
	push msg3
	call printf
	add esp,8
	
	ret
