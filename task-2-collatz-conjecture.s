.equ INVALID_NUMBER, -1

.text
.globl steps

steps:
    cmp x0, #1
    b.lt .L_invalid
    b.eq .L_one
    tbz x0, #0, .L_even
.L_odd:
    add x0, x0, x0, lsl #1
    add x0, x0, #1
    b .L_recurse
.L_even:
    lsr x0, x0, #1
.L_recurse:
    str x30, [sp, #-16]!
    bl steps
    ldr x30, [sp], #16
    add x0, x0, #1
    ret
.L_invalid:
    mov x0, INVALID_NUMBER
    ret
.L_one:
    mov x0, #0
    ret
