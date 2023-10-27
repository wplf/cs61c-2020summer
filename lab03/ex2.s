.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0

.text
main:
    addi t0, x0, 0 # t0 = 0
    addi s0, x0, 0 # s0 = 0
    la s1, source  # s1 = &source
    la s2, dest    # s2 = &dest
loop:
    slli s3, t0, 2 # s3 = t0 * 4, t0 是位置偏移
    add t1, s1, s3 # t1 = s1 + s3， t1 是s1的位置偏移后的位置
    lw t2, 0(t1)   # t2 = source[0]
    beq t2, x0, exit  # source[i] == 0
    add a0, x0, t2    # a0 = t2 = source[0]
    addi sp, sp, -8   # sp stack pointer， 分配8个byte
    sw t0, 0(sp)      # save word,  t0 存起来
    sw t2, 4(sp)      # t2 存起来， 所有的temp 变量存起来
    jal square
    lw t0, 0(sp)     # t0 读出来
    lw t2, 4(sp)     # t2 读出来
    addi sp, sp, 8   # 释放栈空间
    add t2, x0, a0   # t2 = a0
    add t3, s2, s3   # t3 是 dest 的i新地址
    sw t2, 0(t3)     # t2 = dest[0]
    add s0, s0, t2   # s0 = s0 + t[2]
    addi t0, t0, 1   # t0 += 1
    jal x0, loop     # 
square:
    add t0, a0, x0
    add t1, a0, x0
    addi t0, t0, 1
    addi t2, x0, -1
    mul t1, t1, t2
    mul a0, t0, t1 
    jr ra           # jr 用于函数返回时，无条件跳转
exit:
    add a0, x0, s0
    add a1, x0, x0
    ecall # Terminate ecall