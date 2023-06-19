section .data
	input db "%d",0
	msg db "Min number is : %d",10,0
	
section .bss
	n resd 1
	numarray resd 50
	min resd 1
	
section .text
	global main
	extern printf,scanf

main:
	push n
	push input
	call scanf
	add esp,8

	;; for(i = 0;i<n;++i)scanf("%d",&arr[i]);

	xor esi,esi
	mov ebx,numarray
lp:	
	cmp esi,dword[n]
	jz findmin
	
	push ebx
	push input
	call scanf
	add esp,8

	inc esi
	add ebx,4
	jmp lp

findmin:
	xor esi,esi
	mov ebx,numarray
	mov ecx,dword[ebx]

lp1:	
	cmp esi,dword[n]
	jz end

	mov edx,dword[ebx]

	cmp ecx,edx
	jl skip

	mov ecx,edx

skip:
	inc esi
	add ebx,4
	jmp lp1

end:
	mov dword[min],ecx
	push dword[min]
	push msg
	call printf
	add esp,8

	ret
