
section .data
	string1 db "madam"
	len equ $-string1
	pallindrome db "Yes",10,0
	notpallindrome db "No",10,0
	char db "%c",0
	newline db 10
	
section .bss
	revstr resb len

section .text
	global main
	extern puts,printf
	
main:
	;; Printing string1

	mov ebx,string1
	mov ecx,len
	
lp4:	pusha
	push dword[ebx]
	push char
	call printf
	add esp,8
	popa
	inc ebx
	dec ecx
	cmp ecx,0
	jg lp4
	
	mov ebx,newline
	push dword[ebx]
	push char
	call printf
	add esp,8
	
	
	xor eax,eax
	mov esi,string1
	mov edi,revstr
	mov ecx,len
	add esi,len
	dec esi
lp:	mov al,byte[esi]
	mov byte[edi],al
	dec esi
	inc edi
	loop lp

	mov ebx,revstr
	mov ecx,len
	
lp5:	pusha
	push dword[ebx]
	push char
	call printf
	add esp,8
	popa
	inc ebx
	dec ecx
	cmp ecx,0
	jg lp5
	
	mov ebx,newline
	push dword[ebx]
	push char
	call printf
	add esp,8

	mov esi,string1
	mov edi,revstr
	mov ecx,len
	xor eax,eax
lp2:	mov al,byte[esi]
	cmp al,byte[edi]
	jnz lp1
	inc esi
	inc edi
	dec ecx
	jnz lp2

	push pallindrome
	call puts
	add esp,4
	jmp lp3
	
lp1:
	push notpallindrome
	call puts
	add esp,4
	
lp3:	ret
