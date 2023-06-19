section .data
	input db "%d",0
	msg db "Occurence of %d is : %d",10,0

section .bss
	n resd 1
	numarray resd 50
	num resd 1
	cnt resd 1

	
section .text
	global main
	extern printf,scanf

main:

	;; Take n for an array elements
	push n
	push input
	call scanf
	add esp,8

	;; take input of an array
	;; for(i=0;i<n;++i)scnaf("%d",&arr[i]);

	xor esi,esi
	mov ebx,numarray
lp:	
	cmp esi,dword[n]
	jz takenum
	
	push ebx
	push input
	call scanf
	add esp,8

	inc esi
	add ebx,4
	jmp lp

takenum:
	push num
	push input
	call scanf
	add esp,8

	;; Counting occurence
	;; for(i=0;i<n;++i)if(num == arr[i])cnt++;
	xor esi,esi
	xor edi,edi
	mov ebx,numarray
	mov ecx,dword[num]

lp1:	
	cmp esi,dword[n]
	jz end

	mov edx,dword[ebx]

	cmp ecx,edx
	jnz skip
	inc edi

skip:
	inc esi
	add ebx,4
	jmp lp1

end:
	mov dword[cnt],edi
	
	push dword[cnt]
	push dword[num]
	push msg
	call printf
	add esp,12

	ret
