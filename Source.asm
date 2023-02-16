;VARIANT 18
.686
.model flat,stdcall

.stack 100h

.data
x db 16
y db 57
z db 68
.code
ExitProcess PROTO STDCALL :DWORD
Start:
	xor edx,edx
	xor ecx,ecx
	mov al,y 
	inc al
	mov cl,2
	div cx

	mov bl,x ;+X'
	inc bl
	add al,bl

	mov bl,z ;+Z'
	inc bl
	add al,bl

	mov bl, x
	mov cl, z
	and bl,cl
	mov cl, y
	or bl,cl
	add al,bl
exit:
Invoke ExitProcess,1
End Start