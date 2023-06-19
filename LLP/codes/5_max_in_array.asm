section .data
	getN db "Enter number of elements: ",0
	input db "%d",0
	output db "Maximum element is: %d",10,0

section .bss
	array resd 10
	n resd 1
	
section .text
	global main
	extern printf,scanf

main:
	;;printf("Enter number of elements: ");
	
	push getN
	call printf
	add esp, 4

	;; scanf("%d",&n)
	push n
	push input
	call scanf
	add esp, 8
	
	;; Getting n elements from user

	;;for(i = 0; i < n; i++)
	;;{
	;;	scanf("%d",&array[i]);
	;;}

	;;i = 0
	xor ecx,ecx
	
scan:
	;;ebx = address of array[0]
	
	mov ebx, array	;;(array + 0) 
	mov eax, 4	;;sizeof(int)
	mul ecx		;;sizeof(int) * i
	add ebx, eax	;;(array + i)
	
	;;scanf("%d",&array[i]);

	pusha
	push ebx
	push input
	call scanf
	add esp, 8
	popa

	;;i++
	inc ecx
	
	;;i < n
	cmp ecx, dword[n]
	
	;;for()
	jl scan

;;Now we will find maximum

	;;i = 0;
	;;max = array[0];
	;;for(i = 0; i < n; i++)
	;;{
	;;	if(max < array[i])
	;;	{
	;;		max = array[i];
	;;	}
	;;}

	;; i = 0
	xor ecx, ecx
	
	;; max = array[0]
	mov esi, dword[array]

while:
	;; ebx = address of array i.e. (array + 0)

	mov ebx, array	;;(array + 0)
	mov eax, 4 	;;sizeof(int)
	mul ecx		;;sizeof(int) * i
	add ebx,eax  	;;(array + 0) + (sizeof(int) * i)

	;; if(array[i] < max)
	cmp dword[ebx],esi
	jng noupdate
	mov esi,dword[ebx]

noupdate:
		
	;;i++
	inc ecx
	
	;;i < n
	cmp ecx,dword[n]
	
	;;for()
	jl while

endof:
	;;printf("Maximum number is %d",max);

	pusha
	push esi
	push output
	call printf
	add esp, 8
	popa

	ret
