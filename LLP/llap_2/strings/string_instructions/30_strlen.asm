;; scan string - scas

;;scasb, scasw, scasd
;; Compares byte in memory represented by edi with al register value.
;; Compares with whatever the value in al

section .data
	Source db "This is my string",10,0
	msg db "String length is %d",10,0

section .bss

section .text
	global main
	extern printf

main:
	mov edi, Source
	mov esi,edi
	xor eax,eax
;;	mov al,' '
	repnz scasb

	sub edi,esi
	
	push edi
	push msg
	call printf
	add esp,8
