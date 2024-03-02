.global _start
_start:
    /*
        x[0:1] -= x[2:3]
        0x43214321432143211234123412341234 - 0x1234123412341234432143214321
    */
    mov x0, #0x4321
    movk x0, #0x4321, lsl #16
    movk x0, #0x4321, lsl #32
    movk x0, #0x4321, lsl #48
    mov x1, #0x1234
    movk x1, #0x1234, lsl #16
    movk x1, #0x1234, lsl #32
    movk x1, #0x1234, lsl #48
    mov x2, #0x1234
    movk x2, #0x1234, lsl #16
    movk x2, #0x1234, lsl #32
    movk x2, #0x1234, lsl #48
    mov x3, #0x4321
    movk x3, #0x4321, lsl #16
    movk x3, #0x4321, lsl #32
    movk x3, #0x4321, lsl #48
    b sub_128
sub_128:
    sbcs x0, x0, x2
    sbc x1, x1, x3
exit:
    mov x0, #0
    mov x8, #93
    svc #0

