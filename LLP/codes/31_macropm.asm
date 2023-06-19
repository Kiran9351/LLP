
%macro mymacro 3 ;;2
	mov eax,%1
	mov ebx, %2
	add eax,ebx
	mov %3,eax
	add eax,ebx
%endmacro

%macro mymacro 2
	mov ebx, %1
	mov eax,%2
	sub eax,ebx
%endmacro

section .text
	global main
	
main:
	mymacro	10,20,edx	;;mymacro 123,345
	mymacro 10,20
		
	;;If names of macros are same then mymacro calling will be differentiated by number of inputs
	;;If inputs are also same then recent defination (here second) will be considered when macro is called.
	
	ret

