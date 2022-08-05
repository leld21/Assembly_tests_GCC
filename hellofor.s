.intel_syntax noprefix

// HOW TO COMPILE: gcc -Wall hello_world.s -o hello_world.bin


.section .text

.global main
main:
	push    rbp
    mov     rbp, rsp
    sub rsp, 16

    mov DWORD PTR [rbp-4], 5
    mov DWORD PTR [rbp-8], 0
    cmp DWORD PTR [rbp-8], 5
    jmp .cont
.for:
	add	DWORD PTR [rbp-4], 1
    add	DWORD PTR [rbp-8], 1
.cont:
	cmp DWORD PTR [rbp-8], 5
    jne .for
	mov rax, 0
	lea rdi, [rip+parameter]
	mov rsi, [rbp-4]
	mov rdx, '!'
	call printf@plt
	xor rax, rax
	leave
	ret


	
.section .data
parameter:
	// Printf argument
	.string "Hello world %d %c\n"
