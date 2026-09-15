section .data
msg db "Usage : ./print <string> <string length>",0
len equ $ - msg
section .text

global _start

_start:
mov r8,[rsp]
cmp r8,3
jne exit
mov  r8,[rsp + 16]
mov  r9,[rsp + 24]
mov r10,0

loop:
cmp [r9],r10
jg print_char

mov rax,60
xor rdi,rdi
syscall

print_char:
mov rax,1
mov rdi,1
mov rsi,[r8]
mov rdx,1
inc r10
syscall
call loop

exit:
mov rax,1
mov rdi,1
mov rsi,msg
mov rdx,len
syscall
xor rdi, rdi
mov rax,60
syscall
