section .data
	msg db "Enter number: ",0
	input db "%d",0
	msg1 db "Given number is armstrong number",10,0
	msg2 db "Given number is not armstrong number",10,0
	ten dd 10
section .bss
	num resd 1

section .text
	global main
	extern printf,scanf

main:
	;;printf("Enter number: ");
	push msg	
	call printf
	add esp,4

	;;scanf("%d",&num);
	push num
	push input
	call scanf
	add esp,8
	
	;;find_digit(int num)
	;;{
	;;	temp = num;
	;;	num = num / 10;
		
	;;	return temp - (num * 10);
	;;}
	
	;;int temp = num
	;;int sum = 0, digit = 0;

	;;while(num != 0)
	;;{	
	;;	digit = find_digit(num);
	;;	sum = sum + (digit * digit * digit);
	;;	num = num / 10;
	;;}

	;;if(sum == temp)
	;;{
	;;	printf("armstrong");
	;;}
	;;else
	;;{
	;;	printf("Not armstrong");
	;;}

	mov edx,dword[num]	;;temp = num
	
	xor ebx,ebx		;;sum = 0

	xor ecx,ecx		;; digit = 0
	
	;;while()
lp:
	cmp edx,0
	jnz rem			;;find_digit() function call
lp1:
	mov eax,ecx
	
	mul eax
	mul eax
	
	add ebx,eax

	mov eax,edx
	div dword[ten]
	cmp eax,0
	jz check
	mov edx,eax
	jmp lp
rem:
	mov eax,edx
	div dword[ten]
	mul dword[ten]
	mov ecx,edx
	sub ecx,eax
	jmp lp1

check:
	cmp ebx,dword[num]
	jz armstrong
	jmp notarmstrong

armstrong:
	pusha
	push msg1
	call printf
	add esp,4
	popa
	jmp endof

notarmstrong:
	pusha
	push msg2
	call printf
	add esp,4
	popa
	jmp endof

endof:

	ret
