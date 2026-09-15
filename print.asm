section .data
msg db "Usage : ./print <string> <string length>",0
len equ $ - msg
section .text

global _start

_start:
mov r8,[rsp]
cmp r8,3
jne exit
mov r8,[rsp + 18] // argv[1]
mov r9,r8 + 8

cmp [r9],0
jg 


mov rax,60
xor rdi,rdi
syscall

print_char:
mov rax,1
mov rdi,1
mov rsi,[r8]
mov rdx,1
inc r9
syscall
ret

exit:
mov rax,1
mov rdi,1
mov rsi,msg
mov rdx,len
syscall
xor rdi, rdi
mov rax,60
syscall
