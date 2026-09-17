section .text
global _start


_start:
mov r8,[rsp]
cmp r8,4
jne exit
mov r9,[rsp + 16]
mov r10,[rsp + 24]
mov r11,[rsp + 32]
jmp alloc

alloc:
push rbp,rsp
sub rsp,8
cmp [r9],0
sub [r9],48
push [r9]
inc r9



cmp r10,43
je sum

cmp r10,42
je multi

cmp r10,45
je subtract

cmp r10,47
je divide

je exit

sum:


divide:

subtract:

multi:


exit:
xor rdi,rdi
mov rax 60
syscall
