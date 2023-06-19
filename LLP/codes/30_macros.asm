%macro mycopy 2
	mov esi,%1
	mov edi,%2
;;lp:				;;change for %%lp
%%lp:	
	cmp byte[esi],0
;;	jz myend		;;change for %%myend
	jz %%myend	
	mov al,byte[esi]
	mov byte[edi],al
	inc esi
	inc edi
;;	jmp lp			;;change for %%lp
	jmp %%lp		
;;myend: 			;;change for %%myend
%%myend:
	nop

%endmacro

section .data
	msg db "This is a program for macro",0
	len equ $-msg

section .bss
	msg1 resb len

section .text
	global main
	extern printf,puts

main:
	mycopy msg,msg1
	push msg1
	call puts
	add esp,4
	ret
	

