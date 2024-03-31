%include "io64.inc"

section.data
length dq 0
sdot dot_product_loop 0.0
output_format db "%lf ",10 ,0

section. bss
vector_A resq 100
Vector_B resq 100

section.text
global main
extern printf

main:
GET_DEC 8, length
mov rdi,vector_A
mov rdi, vector_B

mov rsi, length
xor eax,eax
xorps xmm0,xmm0

read_vector:


