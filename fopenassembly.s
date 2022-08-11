.intel_syntax noprefix

// HOW TO COMPILE: gcc -Wall hello_world.s -o hello_world.bin


.section .text

.global main
main:
	push    rbp
	mov     rbp, rsp
	sub rsp, 48

	lea rdi, [rip+arquivo]
	lea rsi , [rip+read]
	call fopen@plt
	mov [rbp-4], rax

	//lea rdi, [rip+arquivosaida]
	//lea rsi , [rip+write]
	//call fopen@plt
	//mov [rbp-8], rax

	mov rdi, [rbp-4]
	lea rsi, [rip+inteiro]
	lea rdx, [rbp-12]
	call fscanf@plt
.set1:
	mov rdx, 0
.for1:
	cmp rdx,[rbp-12]
	je .cont

	mov [rbp-16], rdx

	mov rdi, [rbp-4]
	lea rsi, [rip+inteiro]
	lea rdx, [rbp-20]
	call fscanf@plt

	mov eax, 4
	mul DWORD PTR [rbp-20]

	mov rdi, rax
	call malloc@plt
	mov [rip + vector], rax

	mov rdx, [rbp-16]
	inc rdx
	jmp .for1
.cont:
	lea rdi, [rip+parameter]
	mov rsi, [rbp-12]
	call printf@plt

	xor rax, rax
	leave
	ret

.section .bss
vector:
	.8byte

.section .data
parameter:
	// Printf argument
	.string "Hello world %d\n"
arquivo:
	.string "entrada.txt"
arquivosaida:
	.string "saida.txt"
read:
	.string "r"
write:
	.string "w"
inteiro:
	.string "%i"
