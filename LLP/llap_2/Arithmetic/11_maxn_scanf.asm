
section .data
	input dd "%d",0
	msg db "Enter the no. of elements in array:",10,0
	msg1 db "No. of elements in an array : %d",10,0
	msg2 db "Enter array elements:",10,0
	msg3 db "Enter element at index %d:",10,0
	msg4 db "Element at index %d: %d",10,0
	msg5 db "Max elements is : %d",10,0
	
section .bss
	n resd 1
	numarray resd 50
	max resd 1

section .text
	global main
	extern printf,scanf

main:
	pusha
	push msg
	call printf
	add esp,4
	popa

	push n
	push input
	call scanf
	add esp,8
	
	pusha
	push dword[n]
	push msg1
	call printf
	add esp,8
	popa
	
	pusha
	push msg2
	call printf
	add esp,4
	popa
	;; for(i = 0; i < n; ++i)printf("Enter element at index %d:",i);scanf("%d",&arr[i]);

	xor esi,esi
	mov ebx,numarray
lp:	
	cmp esi,dword[n]
	jz printarr
	
	push esi
	push msg3
	call printf
	add esp,4

	push ebx
	push input
	call scanf
	add esp,4

	inc esi
	add ebx,4
	jmp lp

printarr:

	xor esi,esi
	mov ebx,numarray

	;; for(i=0;i<n;++i)printf("Element at index %d:%d",i,arr[i]);
lp1:	
	cmp esi,dword[n]
	jz findmax
	
	pusha
	push dword[ebx]
	push esi
	push msg4
	call printf
	add esp,12
	popa

	inc esi
	add ebx,4
	jmp lp1


findmax:
	xor esi,esi
	mov ebx,numarray

	;; max = arr[0]
	;; for(i = 1;i<n;++i)if(max<arr[i])max = arr[i]
	xor edi,edi
	
lp2:
	cmp esi,dword[n]
	jz gotoend
	mov edx,dword[ebx]

	cmp edi,edx
	jl chgmax

	inc esi
	add ebx,4 
	jmp lp2

chgmax:
	mov edi,edx
	inc esi
	add ebx,4
	jmp lp2

gotoend:
	mov dword[max],edi
	push dword[max]
	push msg5
	call printf
	add esp,8
	
	ret
