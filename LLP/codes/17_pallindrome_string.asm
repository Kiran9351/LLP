;;Assembly program for pallindrome string determination

section .data
	palindrome db "String is palindrome",0
	nopalindrome db "String is not palindrome",0
	msg db "madam2",0
	len equ $-msg

section .bss
	msg2 resb len

section .text
	global main
	extern printf,puts

main:
	mov ebx,msg
	mov edx,msg2
	add ebx,len
	dec ebx
	dec ebx
	xor ecx,ecx
	inc ecx
	inc ecx

while:
	mov al,byte[ebx]
	mov byte[edx],al
	
	cmp ecx,len
	jnl checking
	inc ecx
	
	dec ebx
	inc edx

	jmp while

checking:
	mov ebx,msg
	mov edx,msg2

while2:
	mov al,byte[ebx]
	cmp al,byte[edx]
	jnz notpalindrome
	cmp al,0
	jmp isPalindrome
	inc ebx
	inc edx
	jmp while2

isPalindrome:
	push palindrome
	call puts
	add esp,4
	jmp endof
	
notpalindrome:
	push nopalindrome
	call puts
	add esp,4
	
endof:
	ret
