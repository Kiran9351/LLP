section .data
	msg db "%d",0
	msg1 db "Enter number of elements in array: ",10,0
	msg2 db "You have entered %d as total number of elements",10,0
	msg3 db "You enetered no %d at index %d",10,0
	msg4 db "Sum of array elements is %d",10,0
	
section .bss
	n resd 1
	numarray resd 50
	sum resd 1
	
section .text
	global main
	extern printf,scanf

main:
	push msg1
	call printf
	add esp,4
	
	push n
	push msg
	call scanf
	add esp,8

	push dword[n]
	push msg2
	call printf
	add esp,8

	;; for(i = 0, i < n; ++i)scanf("%d",&a[i])

	mov ebx,numarray
	xor ecx,ecx		;ecx = 0
	
repeatsum:	

	cmp ecx,dword[n]
	jz gotoend
	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa
	inc ecx
	add ebx,4
	jmp repeatsum

gotoend:
	xor ecx,ecx
	mov ebx,numarray
repeatsum1:	
	cmp ecx,dword[n]
	jz gotoend1
	pusha
	;; push ebx this will add address not values
	push ecx
	push dword[ebx]
	push msg3
	call printf
	add esp,12
	popa
	inc ecx
	add ebx,4
	jmp repeatsum1

gotoend1:	

	mov dword[sum],0
	xor ecx,ecx
	mov ebx,numarray
lp:	
	cmp ecx,dword[n]
	jz end

	mov edx,dword[ebx]
	add dword[sum],edx
	inc ecx
	add ebx,4
	jmp lp

end:
	push dword[sum]
	push msg4
	call printf
	add esp,8
	ret
