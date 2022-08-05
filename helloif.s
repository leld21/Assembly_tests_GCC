
.intel_syntax noprefix

// HOW TO COMPILE: gcc -Wall hello_world.s -o hello_world.bin


.section .text

.global main
main:
	push    rbp
    mov     rbp, rsp
    sub rsp, 16

    mov DWORD PTR [rbp-4], 5
    cmp DWORD PTR [rbp-4], 5
    jne .if
	mov rax, 0
	lea rdi, [rip+parameter]
	mov rsi, [rbp-4]
	mov rdx, '!'
	call printf@plt
.if:
	mov rax, 0
	lea rdi, [rip+parameter]
	mov rsi, 5
	mov rdx, '?'
	call printf@plt
	xor rax, rax
	leave
	ret

	
.section .data
parameter:
	// Printf argument
	.string "Hello world %d %c\n"
