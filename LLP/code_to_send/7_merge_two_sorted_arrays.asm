
section .data
	input db "%d",0
	output db "%d ",0
	newl db 10,0
	msg4 db "Enter size of first array: ",0
	msg5 db "Enter size of second array: ",0
	msg1 db "Enter first sorted array: ",0
	msg2 db "Enter second sorted array: ",0
	msg3 db "Merged array is : ",10,0
	msg6 db "First array is: ",0
	msg7 db "Second array is: ",0
	
section .bss
	n1 resd 1
	n2 resd 1
	n3 resd 1
	arr resd 20
	brr resd 20
	marr resd 40

section .text
	global main
	extern printf,scanf

main:
	push msg4
	call printf
	add esp,4
	
	push n1
	push input
	call scanf
	add esp,8

	push msg1
	call printf
	add esp,4

	xor ecx,ecx
	mov ebx,arr
lp0:
	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[n1]
	jz take2nd	
	add ebx,4
	jmp lp0

take2nd:
	
	push msg5
	call printf	
	add esp,4
	
	push n2
	push input
	call scanf
	add esp,4

	push msg2
	call printf
	add esp,4
	
	xor ecx,ecx
	mov esi,brr
lp1:
	pusha
	push esi
	push input
	call scanf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[n2]
	jz toprint
	add esi,4
	jmp lp1

toprint:
	
	push msg6
	call printf
	add esp,4
	
	xor ecx,ecx
	mov ebx,arr
lp2:	
	pusha
	push dword[ebx]	
	push output
	call printf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[n1]
	jz print2nd
	add ebx,4
	jmp lp2

print2nd:

	push newl
	call printf
	add esp,4
	
	push msg7
	call printf
	add esp,4

	xor ecx,ecx
	mov esi,brr
lp3:
	pusha
	push dword[esi]
	push output
	call printf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[n2]
	jz merge
	add esi,4
	jmp lp3
	
merge:
	push newl
	call printf
	add esp,4

	xor ecx,ecx
	xor edx,edx

	mov ebx,arr
	mov esi,brr
	mov edi,marr
lp4:
	mov eax,dword[ebx]	
	cmp eax,dword[esi]
	jl pick1st
	mov eax,dword[esi]
	mov dword[edi],eax
	inc edx
	cmp edx,dword[n2]
	jz add1sttomarr
	add esi,4
	add edi,4
	jmp lp4
	
pick1st:
	mov dword[edi],eax
	inc ecx
	cmp ecx,dword[n1]
	jz add2ndtomarr
	add ebx,4
	add edi,4
	jmp lp4 

add1sttomarr:
	
lp5:
	mov eax,dword[ebx]
	mov dword[edi],eax
	inc ecx
	cmp ecx,dword[n1]
	jz printmarr
	add ebx,4
	add edi,4
	jmp lp5

add2ndtomarr:
	
lp6:
	mov eax,dword[esi]
	mov dword[edi],eax
	inc edx
	cmp edx,dword[n2]
	jz printmarr
	add edi,4
	add esi,4
	jmp lp6

printmarr:

	mov eax,dword[n1]
	add eax,dword[n2]
	add dword[n3],eax

	xor ecx,ecx
	mov edi,marr
	
lp7:
	pusha
	push dword[edi]
	push output
	call printf
	add esp,8
	popa
	
	inc ecx
	cmp ecx,dword[n3]
	jz end
	add edi,4
	jmp lp7
	
end:
	ret
