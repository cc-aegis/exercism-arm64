.text
.globl leap_year

leap_year:
    str x30, [sp, #-16]!
    mov x2, x0

    mov x0, #4
    mov x1, x2
    bl is_multiple
    cmp x0, #0
    b.eq .L_false

    mov x0, #100
    mov x1, x2
    bl is_multiple
    cmp x0, #0
    b.eq .L_true

    mov x0, #400
    mov x1, x2
    bl is_multiple
    cmp x0, #0
    b.eq .L_false

    b .L_true

.L_false:
    mov x0, #0
    ldr x30, [sp], #16
    ret
.L_true:
    mov x0, #1
    ldr x30, [sp], #16
    ret

// is_multiple(n, k) = `∃x∈ℕ:x*n=k`
is_multiple:
    str x2, [sp, #-16]!
    udiv x2, x1, x0
    msub x2, x2, x0, x1
    cmp x2, #0
    b.eq .L_multiple
.L_not_multiple:
    mov x0, #0
    ldr x2, [sp], #16
    ret
.L_multiple:
    mov x0, #1
    ldr x2, [sp], #16
    ret
