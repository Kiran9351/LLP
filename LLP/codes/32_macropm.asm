%macro xor 2
	xor eax,%2
        mov eax,%1
        mov ebx, %2
        add eax,ebx
%endmacro

%macro xor 2
        mov ebx, %1
        mov eax,%2
        sub eax,ebx
%endmacro

section .text
        global main
         
main:
        xor 10,20
        xor 10,20
    	xor esi,esi

	;;
    
        ret
