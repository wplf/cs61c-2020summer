.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    addi t1, a0, 0   # t1 = n
    addi a0, x0, 1  # s0 = 1
    jal ra, factorial
    

finish:
    addi a1, a0, 0 # a1 = a0
    addi a0, x0, 1 # a0 = 1
    ecall # Print Result

    addi a1, x0, '\n' # a1 = '\n'
    addi a0, x0, 11   # a0 = '11'
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial: # a0 = n
    beq t1, x0, finish
    mul a0, a0, t1
    addi, t1, t1, -1
    j factorial
    