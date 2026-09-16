section .data
msg db "Usage : ./print <string> ",0
len equ $ - msg

section .text

global _start

_start:
mov r8,[rsp]
cmp r8,2
jne usage

mov r8,[rsp + 16]
jmp loop

loop:
cmp byte [r8],0
je exit
jmp print_char

print_char:
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
