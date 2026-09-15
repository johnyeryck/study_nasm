section .text
path db "/usr/bin/sleep",0
size equ $ - msg

global _start:

_start:
mov r8,[rsp+16]
mov 
mov rax,57
mov rdi,0
mov rsi,0
mov rdx,0
syscall

cmp rax,0
je  son
xor rdi,rdi
mov rax,60
syscall

son:
mov rax,59
mov rdi,path
mov rsi,[path]
mov rdx,
syscall


