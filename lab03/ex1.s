.data
.word 2, 4, 6, 8
n: .word 9

.text
main:   
    add t0, x0, x0 # t0 = 0
    addi t1, x0, 1 # t1 = 1
    la t3, n       # 想要将n的值读取到寄存器中，需要执行两步，1 读取地址 2. 读取word（offset=0）
                   # 前面定义了2，4，6，8四个数， 所以现在的n的偏移为8
                   # 这个命令拆成了 auipc x28 65536; addi x28 x28 8
    lw t3, 0(t3)   # load address 可以分解成
fib:    
    beq t3, x0, finish # t3 = 9
    add t2, t1, t0     # t2 = t1 + t0
    mv t0, t1          # t0 = t1
    mv t1, t2          # t1 = t2
    addi t3, t3, -1    # 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233  4181
    j fib
finish: 
    addi a0, x0, 1
    addi a1, t0, 0
    ecall # print integer ecall
    addi a0, x0, 10
    ecall # terminate ecall
