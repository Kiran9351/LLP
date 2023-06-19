;;Assembly program to find if substring exists in a string 

section .data
	first db "this is a string1",0
	second db "string",0
	found db "string found",0	
	notfound db "string not found",0

section .text
	global main	
	extern puts
	
main:
	mov esi,first
	mov ebx,second

while:
	mov al,byte[esi]
	cmp al,0
	jz printfalse
	cmp al,byte[ebx]
	jnz backtozero

	inc ebx
	inc esi
	
	cmp byte[ebx],0
	jz printtrue
	jmp while

backtozero:
	mov ebx,second
	inc esi
	cmp byte[ebx],0
	jz printtrue
	jmp while

printtrue:
	push found
	call puts
	add esp,4
	jmp endof

printfalse:
	push notfound
	call puts
	add esp,4
	jmp endof

endof:
	ret
