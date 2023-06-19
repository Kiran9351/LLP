section .data
	getN db "Enter number of elemets: ",0
	input db "%d",0
	output db "Addition of array is %d",10,0

section .bss
	array resd 10
	n resd 1
	
section .text
	global main
	extern printf,scanf

main:
	;;printing getN message
	;;printf("Enter number of elements: ");
	
	push getN
	call printf
	add esp,4

	;;get number from user
	;; scanf("%d",&n);
	
	push n
	push input
	call scanf 
	add esp,8
	
	;; Get n elements from user
	
	;; for(i = 0; i < n; i++)
	;; {
	;; 	scanf("%d",&array[i]);
	;; }
	
	;;for i using ecx
	xor ecx,ecx 		;;making ecx = 0 as i = 0

scan:	
	;;get pointer to the address of first element i.e. start of array
	
	mov ebx,array
	mov eax,4  	;;using eax = 4 as integer takes 4 bytes
	mul ecx		;;multiplying ecx for getting address of ith element ecx is i
	add ebx,eax

	;;scanf("%d",&array[i]);
	
	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa

	;;i++
	inc ecx
	
	;;i < n
	cmp ecx,dword[n]
	jl scan

	;;Now we will do addition
	
	;;for(i = 0;i < n; i++)
	;;{
	;;	sum = sum + array[i];
	;;}
	
	;; i = 0
	xor ecx,ecx

	;;sum = 0
	xor esi,esi
	
while:
	;;ebx = array (address)
	mov ebx, array
	
	;; eax = 4 (size of integer)
	mov eax,4
	
	;;i * sizeof(int) to get address of next element
	mul ecx
	
	;;array address + (i * sizeof(int))
	add ebx,eax
	
	;; sum = sum + array[i]
	add esi,dword[ebx]
	 
	;;i++
	inc ecx

	;;i < n
	cmp ecx, dword[n]
	
	;; for()
	jl while	
	
endof:
	;;printf("addition of array is: %d",sum);
	
	pusha
	push esi
	push output
	call printf
	add esp,8
	popa

	ret		
