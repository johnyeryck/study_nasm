section .data
msg db "Usage : ./print <string> <type>",0
len equ $ - msg

section .text

global _start

_start:
mov r8,[rsp]
cmp r8,3
jne usage

mov qword r8,[rsp + 16]
mov qword r9,[rsp + 24]

sub byte [r9],48
mov r10,[r9]
call loop

loop:
cmp byte [r8],0
je exit
cmp  r10,1
je print_char
pop r10
cmp  r10,2
je print_dec
call exit

print_char:
mov rax,1
mov rdi,1
mov rsi,r8
mov rdx,1
syscall
inc r8
jmp loop

print_dec:
sub [r8],48
mov rax,1
mov rdi,1
mov rsi,r8
mov rdx,1
syscall
inc r8
jmp loop

usage:
mov rax,1
mov rdi,1
mov rsi,msg
mov rdx,len
syscall
jmp exit

exit:
xor rdi, rdi
mov rax,60
syscall
