.intel_syntax noprefix

bubblesort:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-24], rdi
        mov     DWORD PTR [rbp-28], esi
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L6:
        mov     eax, DWORD PTR [rbp-4]
        add     eax, 1
        mov     DWORD PTR [rbp-8], eax
        jmp     .L3
.L5:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        lea     rcx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rcx
        mov     eax, DWORD PTR [rax]
        cmp     edx, eax
        jle     .L4
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rbp-12], eax
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     edx, DWORD PTR [rbp-4]
        movsx   rdx, edx
        lea     rcx, [0+rdx*4]
        mov     rdx, QWORD PTR [rbp-24]
        add     rdx, rcx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rdx], eax
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-24]
        add     rdx, rax
        mov     eax, DWORD PTR [rbp-12]
        mov     DWORD PTR [rdx], eax
.L4:
        add     DWORD PTR [rbp-8], 1
.L3:
        mov     eax, DWORD PTR [rbp-8]
        cmp     eax, DWORD PTR [rbp-28]
        jl      .L5
        add     DWORD PTR [rbp-4], 1
.L2:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-28]
        jl      .L6
        nop
        nop
        pop     rbp
        ret
.LC0:
        .string "r"
.LC1:
        .string "w"
.LC2:
        .string "%i"
.LC3:
        .string "[%d] "
.LC4:
        .string "%d\n"
.LC5:
        .string "%d "
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     DWORD PTR [rbp-52], edi
        mov     QWORD PTR [rbp-64], rsi
        mov     rax, QWORD PTR [rbp-64]
        add     rax, 8
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC0
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-64]
        add     rax, 16
        mov     rax, QWORD PTR [rax]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-32], rax
        lea     rdx, [rbp-44]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        mov     DWORD PTR [rbp-4], 0
        jmp     .L8
.L15:
        lea     rdx, [rbp-48]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        mov     eax, DWORD PTR [rbp-48]
        cdqe
        sal     rax, 2
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-40], rax
        mov     edx, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC3
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     DWORD PTR [rbp-8], 0
        jmp     .L9
.L10:
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-40]
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        add     DWORD PTR [rbp-8], 1
.L9:
        mov     eax, DWORD PTR [rbp-48]
        cmp     DWORD PTR [rbp-8], eax
        jl      .L10
        mov     edx, DWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, edx
        mov     rdi, rax
        call    bubblesort
        mov     DWORD PTR [rbp-12], 0
        jmp     .L11
.L14:
        mov     eax, DWORD PTR [rbp-48]
        sub     eax, 1
        cmp     DWORD PTR [rbp-12], eax
        jne     .L12
        mov     eax, DWORD PTR [rbp-12]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC4
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        jmp     .L13
.L12:
        mov     eax, DWORD PTR [rbp-12]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, OFFSET FLAT:.LC5
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
.L13:
        add     DWORD PTR [rbp-12], 1
.L11:
        mov     eax, DWORD PTR [rbp-48]
        cmp     DWORD PTR [rbp-12], eax
        jl      .L14
        add     DWORD PTR [rbp-4], 1
.L8:
        mov     eax, DWORD PTR [rbp-44]
        cmp     DWORD PTR [rbp-4], eax
        jl      .L15
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    fclose
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    fclose
        mov     eax, 0
        leave
        ret