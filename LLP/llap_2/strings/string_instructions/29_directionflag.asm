;;std - set direction flag
;; cld - clear direction flag

;; due to std esi and edi both gets decremented

section .data
	Source db "This is my string",10,0
	len equ $-Source

section .bss
	Destination resb len

section .text
	global main

main:

	mov esi, Source
	mov edi, Destination
	mov ecx,len
	
;; Version 1
	
;;We can replace following 4 lines with one line.
;;lp:
;;	mov al,byte[esi]
;;	mov byte[edi],al
;;	inc esi
;;	inc edi
;;	loop lp

;; Version 2

;;lp:	movsb 
;;	loop lp

;;Version 3
	std		;;This sets direction flag. It changes the direction
	rep movsb	;;Using two instructions in one line.	
			;; rep is used only with string instructions.
	
	mov eax,4
	mov ebx,1
	mov ecx,Destination
	mov edx,len
	int 0x80
