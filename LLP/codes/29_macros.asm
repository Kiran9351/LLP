

section .data
	msg db "Addition is a %d",10,0
	
section .text
	global main
	extern printf

%macro abc 3
        mov eax,%1 
        mov ebx,%2 
        add eax,ebx     ;;edI check for erro and edj check for error
        mov %3,eax
%endmacro


main:

	push eax
	push msg
	call printf
	abc 3,4,eax
	add esp,8

	ret
