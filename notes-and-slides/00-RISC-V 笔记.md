> 用于寄存器-寄存器操作的 R 类型指令，
> 用 于短立即数和访存 load 操作的 I 型指令，
> 用于访存 store 操作的 S 型指令，
> 用于条件跳转操 作的 B 类型指令，
> 用于长立即数的 U 型指令
> 用于无条件跳转的 J 型指令。

[[RISC-V-Reader-Chinese-v2p1.pdf#page=25&selection=110,0,150,4|RISC-V-Reader-Chinese-v2p1, page 25]]


> 为了满足汇编 语言程序员和编译器编写者，RV32I 有 31 寄存器加上一个值恒为 0 的 x0 寄存器。与之相 比，ARM-32 只有 16 个寄存器，x86-32 甚至只有 8 个寄存器。

[[RISC-V-Reader-Chinese-v2p1.pdf#page=28&selection=248,2,292,5|RISC-V-Reader-Chinese-v2p1, page 28]]


## RISCV-- How many Registers?
- tradeoff between speed and availability
- RISCV has 32 registers (X0 - X31)
![[Pasted image 20231020165239.png]]


riscV : 包含了寄存器、 汇编指令集

RISCV instructions 
op dst，src1, src2 

![[Pasted image 20231020180002.png]]


对于 sign number来说， load word extend sign extension
对于 unsigned number来说， load 直接extend 0




# lab03
