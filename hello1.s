
.intel_syntax noprefix

// HOW TO COMPILE: gcc -Wall hello_world.s -o hello_world.bin


.section .text

.global main
main:
	push    rbp
    mov     rbp, rsp
	mov rax, 0
	lea rdi, [rip+parameter]
	mov rsi, 5
	mov rdx, '!'
	call printf@plt

	mov rax, 0
	pop rbp
	ret

	
.section .data
parameter:
	// Printf argument
	.string "Hello world %d %c\n"
