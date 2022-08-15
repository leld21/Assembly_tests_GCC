.intel_syntax noprefix

// HOW TO COMPILE: gcc -Wall hello_world.s -o hello_world.bin


.section .text

.global main
main:
	push    rbp
	mov     rbp, rsp
	sub rsp, 64

	mov [rbp - 32], rsi

	add rsi, 8
	mov rdi, rsi

	mov rdi, [rdi]
	lea rsi , [rip+read]
	call fopen@plt

	mov [rbp-4], rax

	//write

	mov rsi, [rbp - 32]
	add rsi, 16

	mov rdi, rsi
	mov rdi, [rdi]
	lea rsi , [rip+write]
	call fopen@plt

	mov [rbp - 40] ,rax

	//scanf 1

	mov rdi, [rbp-4]
	lea rsi, [rip+inteiro]
	lea rdx, [rbp-12]
	call fscanf@plt

	mov r13, [rbp-12]

.setfor1:
	mov r12, 0
.for1:
	cmp r12, r13
	je .cont

	//fscanf(filePointer, "%i", &n);
	mov rdi, [rbp-4]
	lea rsi, [rip+inteiro]
	lea rdx, [rbp-20]
	call fscanf@plt

	mov r15, [rbp-20]

	//fprintf(filePointer2,"[%d] ",i);
	mov rdi, [rbp - 40]
	lea rsi, [rip+numero]
	mov rdx, r12
	call fprintf@plt

	// aloca 4*tamanho do vetor
	// vetor=malloc(sizeof(int)*n);

	mov rax,4
	mul r15
	mov rdi, rax
	call malloc@plt

	mov [rip + vector], rax
	
.setfor21:
	mov r14, 0
.for21:
	cmp r14, r15
	je .setforb1

	//le o array
	mov rdi, [rbp - 4]
	lea rsi, [rip+inteiro]
	mov rdx, [rip + vector]
	lea rdx, [rdx + r14 * 4]
	call fscanf@plt

	inc r14
	jmp .for21
// inicio bubblesort
.setforb1:
	mov rcx, 0
	jmp .for1bubblesort
.for1bubblesort:
	cmp rcx, r15
	je .setfor22
	jmp .setforb2
.setforb2:
	mov r8,rcx
	inc r8
	jmp .for2bubblesort
.for2bubblesort:
	cmp r8, r15
	je .for2done
	mov r9, [rip + vector]
	mov rax, [r9 + rcx * 4]
	mov rsi, [r9 + r8 * 4]
	cmp eax,esi
	jg .if
	inc r8
	jmp .for2bubblesort
.if:
    mov [r9 + rcx * 4],esi
	mov [r9 + r8 * 4],eax
	inc r8
	jmp .for2bubblesort
.for2done:
	inc rcx
	jmp .for1bubblesort

//fim bubblesort
.setfor22: 
	mov r14, 0
	mov [rbp-48], r15
	sub QWORD PTR [rbp-48], 1
.for22:
	cmp r14, r15
	je .fordone

	cmp QWORD PTR [rbp-48], r14
	je .ifpula

	mov rdi, [rbp - 40]
	lea rsi, [rip + numeropadrao]
	mov rdx, [rip + vector]
	mov rdx, [rdx + r14 * 4]
	call fprintf@plt

	inc r14
	jmp .for22
.ifpula:
	mov rdi, [rbp - 40]
	lea rsi, [rip + ultimonumero]
	mov rdx, [rip + vector]
	mov rdx, [rdx + r14 * 4]
	call fprintf@plt

	mov rdi, [rip + vector]
	call free@plt

	inc r14
	jmp .for22
.fordone:
	inc r12
	jmp .for1
.cont:

	mov rdi, [rbp-4]
	call fclose@plt

	mov rdi, [rbp-40]
	call fclose@plt

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
	.string "%li"
numero:
	.string "[%i] "
numeropadrao:
	.string "%i "
ultimonumero:
	.string "%i\n"
