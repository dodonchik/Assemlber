;VARIANT 18
.686
.model flat,stdcall

.stack 100h

.data
T dw 01231h,05691h,0A893h,015EEh ;0100h
R dw ?
L dd ?
M dd ?
.code
ExitProcess PROTO STDCALL :DWORD
Start:
	;��������� ���������
	xor edx,edx
	xor ecx,ecx
	xor eax,eax
	xor ebx,ebx

	;First Task
	mov ecx,0
	L1: 
	mov bx,T[ecx]
	not bx
	add eax,ebx
	add ecx,2
	cmp ecx,8
	jl L1
	mov L,eax

	;Second Task
	mov bx,T[4]
	not bx
	and eax,ebx
	mov M,eax
	cmp eax,04220h
	jle try1 ;���� M<=4220
	mov ebx,2 ;����� ����� �� 2
	div ebx
	jmp last
	try1:
		not eax ;x = 0100h	
	last: 
		xor ebx,ebx
		mov bl,al
		jp L2
		jmp L3

	L2: ;���� � ��. R ������ ���-�� ������
		call FUN_1
		jmp L4
	L3: ;���� � ��. R �������� ���-�� ������
		call FUN_2
		jmp L4

	L4: ;�����
		mov R,ax
		jmp exit

	FUN_1: ;���1 
		xor eax,0F0F0h
		ret

	FUN_2: ;���2
		inc eax
		ret
exit:
Invoke ExitProcess,1
End Start