section .text
global main

main:
    xor rax, rax            ; Clear RAX register for the accumulator
    mov rbx, vector1        ; Load the address of the first vector into RBX
    mov rcx, vector2        ; Load the address of the second vector into RCX
    mov rdx, vector_length  ; Load the length of the vectors into RDX
    
dot_product_loop:
    movq xmm0, [rbx]       ; Load 64 bits (1 element) from vector1 into XMM0
    movq xmm1, [rcx]       ; Load 64 bits (1 element) from vector2 into XMM1
    pmulld xmm0, xmm1      ; Multiply the corresponding elements
    paddd xmm2, xmm0       ; Add the result to accumulator in XMM2
    add rbx, 8             ; Move to the next element of vector1 (assuming 64-bit integers)
    add rcx, 8             ; Move to the next element of vector2
    dec rdx                ; Decrement loop counter
    jnz dot_product_loop   ; Continue loop if counter is not zero
    
    ; At this point, the dot product is stored in xmm2
    ; Extract the result from xmm2 if needed

    ret

section .data
    vector1 dq 1, 2, 3, 4   ; Example vector 1 (4 elements of 64-bit integers)
    vector2 dq 5, 6, 7, 8   ; Example vector 2 (4 elements of 64-bit integers)
    vector_length equ ($ - vector1) / 8  ; Calculate the length of the vectors in elements
