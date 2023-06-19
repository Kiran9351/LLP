section .data
	msg1 db "Input size of an array:",0
	msg2 db "Sorted array is : ",0
	msg3 db "Enter the values:",0
	msg4 db "Entered array values are : ",0
	input db "%d",0
	output db "%d ",0
	newline db 10,0
section .bss
	num resd 1
	arr resd 20
	snum resd 1
	
section .text
	global main
	extern printf,scanf,puts
	
main:
	;;Taking size of input array
	push msg1
	call puts
	add esp,4

	push num
	push input
	call scanf
	add esp,8

	;;Taking input values for array
	push msg3
	call puts
	add esp,4
	
	mov ecx,0
lp:
	mov esi,arr
	mov eax,4
	mul ecx
	add esi,eax
	pusha
	push esi
	push input
	call scanf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[num]
	jnz lp

	push msg4
	call printf
	add esp,4

	
	;;Printing array

	mov ecx,0

lp1:	
	mov esi,arr
	mov eax,4
	mul ecx
	add esi,eax

	pusha
	push dword[esi]
	push output
	call printf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[num]
	jnz lp1

	
	;: Implementing bubble sort on array.	

	;; Bubble sort
	
	;; for(i = 0; i < n; ++i)
	;; {
	;;	for(j = i + 1; j < n; j++)
	;; 	{
	;;		if(arr[i] > arr[j])
	;;		{
	;;			temp = arr[i];
	;;			arr[i] = arr[j];
	;;			arr[j] = temp;
	;;		}
	;;	}
	;; }

	;; for(i = 0; i < n; i++)
	;; edi = a[i]
	;; for(j = 0; j < n; j++)
	;; if(edi > a[j])
	;; 	temp = edi;
	;;	edi = a[j]
	;; 	a[j] = temp;
	;; a[i] = edi;

	xor esi,esi
	
lp2:
	cmp esi,dword[num]
	jz final
	mov edi, dword[arr+esi*4]

	mov ebx,esi
lp3:
	inc ebx
	cmp ebx,dword[num]
	jz outer

	cmp edi,dword[arr+ebx*4]
	jb lp3
	xchg edi,dword[arr+ebx*4]
	jmp lp3

outer:
	mov dword[arr+esi*4], edi
	inc esi
	jmp lp2

final:

	;;Printing sorted array.

	push newline
	call printf
	add esp,4

	push msg2
	call printf
	add esp,4
	
	xor ecx,ecx
final1:
	mov esi,arr
	mov eax,4
	mul ecx
	add esi,eax

	pusha
	push dword[esi]
	push output
	call printf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[num]
	jnz final1

	ret

	
