

1. register has name and no type （x0-x31）
2. we have one special register x0

## basic Arithmetic instruction
- 格式:  `op dst , src1, src2`
- addw和add的区别， word在riscv中特指32bit， 如果系统不是32bit的话， addw是只加32低位，而add是加整个位宽

## Immediate Instructions
- 格式：`opi dst, src, imm`
- add, addi

## Data Transfer
- load byte ： lb
- load word： lw
- load half ： lf

- 格式： `memop reg, off(baseAddr)`, 这里面的off是以字节为单位的
- 内存是以byte为单位的，每个word（固定32位）都有4个byte
- load: memory  to register  (lw)： lw t0, 12(s3)   # t0=A[3]  , 如果A是int[]的话
- store: register to memory  (sw) : sw t0, 40(s3)    # A[10]=A[3] + b
- Sign Extension： 对于sign 来说，我们存储数的方式是以补码的形式存放， 直接extend符号位就可以完美解决entension问题，因为不管extend多少，数的表示都是一样的

- store word： `M[R[rs1]+imm](31:0) = R[rs2](31:0)`
- store byte: `M[R[rs1] + imm](7:0) = R[rs2](7:0)`
- load byte(signed): `R[rd] = {24'b M[](7) , M[R[Rs1]+imm](7:0)` # 24位sign extension + byte from memory

## Control Flow Instructions

control flow 意味着条件判断。
在C中， 条件判断用来确定接下来执行哪个代码块。
RISCV中， 没有代码块， 只有label， 判断好了条件，直接jump into对应的label。
- Branch if Equal    (beq)
	- beq reg1, reg2, label
- Branch if Not Equal  (bne)
	- bne reg1, reg2, label
- Jump (j)
	- j label
	- unconditional jump to label


```bash
if ()
then {}
else {}
fi


# if else
bne/beq s0, s1, else
then:  # 这个then 不需要
add s2, s3, x0
j end # 直接跳到end
else:
sub s2, x0, s3
end:

# for
```assembly
for_loop:
    # 执行循环体操作（在这里加上循环计数 t1 到累积和 t0）
    add t0, t0, t1

    # 增加循环计数
    addi t1, t1, 1

    # 检查循环条件，如果 t1 <= 10，继续循环；否则跳出循环
    bge t1, 11, end_loop

    # 回到循环起始处
    j for_loop

end_loop:
```



``` assembly
.data
source:
	.word 3
	.word 1
	.word 4
.text
main:
	la t1, source
	lw t2, 0(t1)
	lw t3, 4(t1)
```

## Shifting Instructions
- logical shift : 直接填0
- arithmetic shift ： 考虑了 有符号的问题， 保留原数的正负性
- sll
- slli
- srl
- srli
- sra
- srai （算数右移只有右移）
我们可以使用移位和lw，sw来表示lb和sb

## multiply extension
- multiplication
- division


## summary

- RISC Design Principles
	- Smaller is faster, keep it simple
- RISC-V Registers:  s0-s11, t0-t6, x0, a1
- RISC-V Instructions
	- Arithmetic:   add, sub, addi
	- Data Transfer: lw, sw
		- Memory is byte-addressed (which means the offset is byte based)
	- Control Flow: beq, bne, j


![[Pasted image 20231026150127.png]]![[Pasted image 20231026151703.png]]
![[Pasted image 20231026150930.png]]
![[Pasted image 20231026151541.png]]


![[Pasted image 20231026160153.png]]
