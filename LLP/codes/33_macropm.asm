;;Nested macro defination

%macro xor 2
        add eax,%2
        mov eax,%1
        mov ebx, %2
        add eax,ebx

%macro xor 2
        mov ebx, %1
        mov eax,%2
        sub eax,ebx
%endmacro

	add eax,ebx
	mov %3,eax
%endmacro

section .text
        global main
             
main:
        xor 10,20
        xor 10,20
        xor esi,esi

        ;;These codes do not work
	;; This should not be done.

  
            
        ret 
~             
