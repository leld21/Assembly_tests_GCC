.intel_syntax noprefix

// HOW TO COMPILE: gcc -Wall hello_world.s -o hello_world.bin


.section .text

.global main
main:
	push    rbp
    mov     rbp, rsp
    sub rsp, 16

    mov rdi, 3 * 4
	call malloc@plt

	mov [rip + vector], rax
.set1:
	mov rcx, 0
.readfor:
	cmp rcx, 5
    je .set2
    mov [rbp - 4], rcx
    // pra multiplicar precisa primeiro colocar o valor do //multiplicando no EAX
    mov eax, 2
    mul rcx
    mov rdx, [rip + vector]
    mov [rdx + rcx * 4], eax
    inc	rcx
    jmp .readfor
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
