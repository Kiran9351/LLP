section .data
	getN db "Enter number of elements: ",0
	input db "%d",0
	getNum db "Enter number to search: ",0
	output db "Frequency is %d",10,0

section .bss
	array resd 10	
	n resd 1
	num resd 1

section .text
	global main
	extern printf, scanf

main:
	;;printf("Enter number of elements in array: ");
	push getN
	call printf
	add esp, 4
	
	;;scanf("%d",&n)
	push n
	push input
	call scanf
	add esp,8

;;getting n numbers from user

	;;i = 0;
	;;for(i = 0; i < n; i++)
	;;{
	;;	scanf("%d",&array[i]);
	;;}

	;; i = 0
	xor ecx,ecx

scan:
	;; getting address of elements
	mov ebx, array		;;(array + 0)	
	mov eax,4		;; (sizeof(int))
	mul ecx			;; sizeof(int) * i
	add ebx,eax		;; (array + 0) + (sizeof(int) * i)

	;;scanf("%d",&array[i]);
	pusha
	push ebx
	push input
	call scanf
	add esp, 8
	popa

	;;i++
	inc ecx
	
	;; i < n
	cmp ecx, dword[n]
	
	;; for()
	jl scan

;;Finding frequency

	;;i = 0;
	;;freq = 0;
	;;for(i = 0; i < n; i++)
	;;{
	;;	if(num == array[i])
	;;	{
	;;		freq++;
	;;	}
	;;}

	;; i = 0;
	xor ecx, ecx
	
	;; freq = 0;	
	xor esi, esi
	
	mov edi, dword[num]

while:
	;;getting address of array in ebx for traversing
	mov ebx, array		;;(array + 0)
	mov eax			;;(sizeof(int))
	mul ecx			;; sizeof(int) * i
	add ebx,eax		;; (array + 0) + (sizeof(int) * i)

	cmp dword[ebx],edi
	jnz noincrement
	inc esi

noincrement:
	
	;;i++
	inc ecx
	
	;; i<n
	cmp ecx,dword[n]
	
	;;for()
	jl while

endof:
	;;printf("Frequency is %d",freq);

	pusha
	push esi
	push output
	call printf
	add esp,8
	popa

	ret
