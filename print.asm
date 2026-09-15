section .data
msg db "Usage : ./print <string> <type>",0
len equ $ - msg
section .text

global _start

_start:
mov r8,[rsp]
cmp r8,3
jne exit
mov r8,[rsp + 10]
add r8,8

mov rax,60
xor rdi,rdi
syscall


exit:
mov rax,1
mov rdi,1
mov rsi,msg
mov rdx,len
syscall
xor rdi, rdi
mov rax,60
syscall
