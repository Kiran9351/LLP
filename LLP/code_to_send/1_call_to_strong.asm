
section .data
	input db "%d",0
	msg db "Enter number : ",0
	YES db "Yes it is strong number",10,0
	NO db "No it is not strong number",10,0
	
section .bss
	n resd 1

section .text
	global main	
	extern printf,scanf,strong

main:
	pusha
	push msg
	call printf
	add esp,4
	popa
	
	
	push n
	push input	
	call scanf
	add esp,8
	
	push dword[n]
	call strong
	add esp,4
	
	cmp eax,1
	jz yes	
	jmp no

yes:
	pusha
	push YES
	call printf
	add esp,4
	popa
	jmp end
	
no:
	pusha
	push NO
	call printf
	add esp,4
	popa

end:
	ret

	
