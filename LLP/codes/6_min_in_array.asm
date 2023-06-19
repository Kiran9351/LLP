section .data
	getN db "Enter number of elements: ",0
	input db "%d",0
	output db "Minimum number is %d",10,0

section .bss
	array resd 10
	n resd 1

section .text
	global main
	extern printf, scanf

main:
	;;printf("Enter number of elements: ");
	push getN
	call printf
	add esp,4
	
	;;scanf("%d",&n);
	push n
	push input
	call scanf
	add esp,4
	

;;Getting n elements from user

	;;i = 0;
	;;for(i = 0; i < n; i++)
	;;{
	;;	scanf("%d",&array[i]);
	;;}

	;;i = 0
	xor ecx, ecx

scan:
	;; ebx = address of array

	mov ebx, array 		;;(array + 0)
	mov eax, 4		;; sizeof(int)
	mul ecx 		;; sizeof(int) * i
	add ebx,eax 		;; (array + 0) + (sizeof(int) * i)

	;;scanf("%d",&array[i]);
	pusha
	;;&array[i]
	push ebx
	;;%d
	push input
	;;scanf()
	call scanf
	add esp,8
	popa

	;;i++
	inc ecx
	
	;;i < n
	cmp ecx, dword[n]
	
	;;for()
	jl scan

;;Finding minimum

	;;i = 0;
	;;min = array[0];
	;;for(i = 0; i < n; i++)
	;;{
	;;	if(array[i] < min)
	;;	{
	;;		min = array[i];
	;;	}	
	;;}

	;; i = 0
	xor ecx, ecx

	;; min = array[0]
	mov esi, dword[array]

while:
	;;getting address of array
	;; ebx = address of array

	mov ebx, array		;;(array + 0)
	mov eax,4 		;;sizeof(int)
	mul ecx 		;;(sizeof(int) * i)
	add ebx,eax		;;(array + 0) + (sizeof(int) * i)

	;;if(array[i] < min)
	cmp dword[ebx],esi
	jnl noupdate
	mov esi, dword[ebx]

noupdate:
	
	;; i++
	inc ecx
	
	;;i < n
	cmp ecx,dword[n]
	
	;;for()
	jl while

endof:
	;;printf("Minimum number is %d",min);

	pusha
	push esi
	push output
	call printf
	add esp,8
	popa
	
	ret
