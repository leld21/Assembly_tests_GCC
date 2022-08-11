.intel_syntax noprefix

// HOW TO COMPILE: gcc -Wall hello_world.s -o hello_world.bin


.section .text

.global main
main:
	push    rbp
    mov     rbp, rsp
    sub rsp, 16

    mov rdi, 5 * 4
	call malloc@plt

	mov [rip + vector], rax
.set1:
	mov rcx, 0
.readfor:
	cmp rcx, 5
    je .setfor1
    mov [rbp - 4], rcx
    mov eax, 2
    mul rcx
    mov rdx, [rip + vector]
    mov [rdx + rcx * 4], eax
	inc	rcx
    jmp .readfor
 //comeca bubblesort
.setfor1:
	mov rcx, 0
	jmp .for1bubblesort
.for1bubblesort:
	cmp rcx, 5
	je .set2
	jmp .setfor2
.setfor2:
	mov r8,rcx
	inc r8
	mov r9, [rip + vector]
	jmp .for2bubblesort
.for2bubblesort:
	cmp r8, 5
	je .for2done
	//vetor[i]
	mov rsi, [r9 + rcx * 4]
	//vetor[j]
	mov rdi, [r9 + r8 * 4]
	cmp rsi, rdi
	jl .if
	inc r8
	jmp .for2bubblesort
.if:
	mov [r9 + rcx * 4], rdi
	mov [r9 + r8 * 4], rsi
	inc r8
	jmp .for2bubblesort
//termina bubblesort
.for2done:
	inc rcx
	jmp .for1bubblesort
.set2:
	mov rcx, 0
.printfor:
	cmp rcx, 5
	je .cont

	mov [rbp - 8], rcx

	mov rax, 0
	lea rdi, [rip + parameter]
	mov rsi, [rip + vector]
	mov rsi, [rsi + rcx * 4]
	call printf@plt

	mov rcx,[rbp - 8]
	inc	rcx
	jmp .printfor
.cont:

    //free array
	mov rdi, [rip + vector]
	call free@plt
	// free stack and finish
	xor rax, rax
	mov rsp, rbp
	pop rbp
	ret
.section .bss
vector:
	.8byte
.section .data
parameter:
	.string "Hello world %d\n"
