;;Assembly program to copy first and third word in the string and print in reverse order

section .data
	msg db "Kiran Dharmaraj Vijapure",0
	len equ $-msg

section .bss
	fname resb len
	flen resd 1
	
	lname resb len
	llen resd 1

section .text
	global main

main:
	mov edi,msg
	mov al,' ' 
	repnz scasb		;;move edi till first space

	mov edx,edi
	mov esi,msg
	sub edx,esi		;;sub from first space to start char to get len of first word

	;;copy msg string into fname and copy len till first space

	mov dword[fname],esi
	mov dword[flen],edx

	;;edi is pointing at first space to till second space

	mov al,' '
	repnz scasb

	;;copy address of first character of third word into temp

	mov esi,edi

	;;go to end
	mov al,0
	repnz scasb

	;;sub from first char to last to get len of third word
	mov edx,edi
	sub edx,esi

	;;copy into lname
	mov dword[lname],esi
	mov dword[llen],edx

	;;print last word
	mov eax,4
	mov ebx,1
	mov ecx,dword[lname]
	mov edx,dword[llen]
	int 0x80

	;;print first word
	mov eax,4
	mov ebx,1
	mov ecx,dword[fname]
	mov edx,dword[flen]
	int 0x80

	ret

