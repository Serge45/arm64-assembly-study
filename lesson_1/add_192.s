.global _start
_start:
    /*
        x[0:2] += x[3:5]
        0x12341234123412341234123412341234123412341234FFFF + 0x123412341234123412341234123412341234123412340001 
    */
    mov x0, #0xFFFF
    movk x0, #0x1234, lsl #16
    movk x0, #0x1234, lsl #32
    movk x0, #0x1234, lsl #48
    mov x1, #0x1234
    movk x1, #0x1234, lsl #16
    movk x1, #0x1234, lsl #32
    movk x1, #0x1234, lsl #48
    mov x2, #0x1234
    movk x2, #0x1234, lsl #16
    movk x2, #0x1234, lsl #32
    movk x2, #0x1234, lsl #48
    mov x3, #0x0001
    movk x3, #0x1234, lsl #16
    movk x3, #0x1234, lsl #32
    movk x3, #0x1234, lsl #48
    mov x4, #0x1234
    movk x4, #0x1234, lsl #16
    movk x4, #0x1234, lsl #32
    movk x4, #0x1234, lsl #48
    mov x5, #0x1234
    movk x5, #0x1234, lsl #16
    movk x5, #0x1234, lsl #32
    movk x5, #0x1234, lsl #48
    b add_192
add_192:
    adds x0, x0, x3
    adcs x1, x1, x4
    adcs x2, x2, x5
exit:
    mov x0, #0
    mov x8, #93
    svc #0

.data
format: .ascii "%d + %d = %d\n"
