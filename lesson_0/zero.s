.global _start
_start:
    b exit
exit:
    mov x0, #0
    mov x8, #93
    svc #0
