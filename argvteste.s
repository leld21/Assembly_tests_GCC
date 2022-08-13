
.intel_syntax noprefix

// HOW TO COMPILE: gcc -Wall hello_world.s -o hello_world.bin


.section .text

.global main
main:
	push    rbp
    mov     rbp, rsp
    sub 	rsp, 32

    add rsi,8
    mov rdx, rsi
    add rdx,8

    lea rdi, [rip+parameter]
    mov rsi, [rsi]
    mov rdx, [rdx]
    call printf@plt

	xor rax, rax
	leave
	ret

	
.section .data
parameter:
	// Printf argument
	.string "Hello world  %s %s \n"
