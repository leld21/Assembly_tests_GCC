.intel_syntax noprefix

// HOW TO COMPILE: gcc -Wall hello_world.s -o hello_world.bin


.section .text

.global main
main:
	push    rbp
    mov     rbp, rsp
    sub rsp, 16

    mov DWORD PTR [rbp-4], 3
    mov rdi, 3 * 4
	call malloc@plt
	mov [rip + vector], rax
	jmp .cont
.for:
	add	DWORD PTR [rbp-4], 1
    add	DWORD PTR [rbp-8], 1
.cont:
	cmp DWORD PTR [rbp-8], 3
    jne .for
	mov rax, 0
	lea rdi, [rip+parameter]
	mov rsi, [rbp-4]
	mov rdx, '!'
	call printf@plt
	xor rax, rax
	leave
	ret
.section .bss
vector:
	.8byte
.section .data
parameter:
	.string "Hello world %d\n"
