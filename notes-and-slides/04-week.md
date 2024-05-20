


high level language   register, clock

创建能执行功能的电路。

## 什么是CPU？
- datapath
- control



## 创建CPU

### R-type
	- add t0, t2, t3
	- ![[Pasted image 20231028170750.png]]
	- ![[Pasted image 20231030105629.png]]
###  I-Type
- ![[Pasted image 20231030110820.png]]
### Load I-Type
	- `lw rd, (0)rs
	- ![[Pasted image 20231030111120.png]]

#### A few notes:
![[Pasted image 20231030112138.png]]

### S-Type 
	- ![[Pasted image 20231030112956.png]]
### SB-Type
	- ![[Pasted image 20231030113639.png]]
-  Jumping I-Type
	- ![[Pasted image 20231030113830.png]]
### J-Type
	![[Pasted image 20231030114702.png]]


## CPU clocking
![[Pasted image 20231030143548.png]]![[Pasted image 20231030144411.png]]
![[Pasted image 20231030144510.png]] 


# RV32I Datapath
![[Pasted image 20231030144943.png]]

# Pipeline register
![[Pasted image 20231030163128.png]]

缓冲register
![[Pasted image 20231030163153.png]]

![[Pasted image 20231030164434.png]]

# pipeline可能会有什么问题

问题是
1.  每个阶段之后都需要 寄存器将他们存起来，比较方便， PC很特殊，需要+4
3.  control logic也需要存下来，也需要pipelined，因为memory stage需要找到 rd，
4. 每个阶段的control logic是不一样的，是需要存下来的。

[[Pasted image 20231030165000.png]]
[[Pasted image 20231030170816.png]]
[[Pasted image 20231030171203.png]]
[[Pasted image 20231030170901.png]]
[[Pasted image 20231030170230.png]]


# pipeline的缺点

## pipelining hazards

### structural hazard
	-  在一个pipeline中， decode阶段和write阶段都需要reg， 如何解决这个冲突
		1. 调控reg，开放两个接口，使得他同时可以干很多事
		2. 读取reg很快，可以double pumping，意思是 上升沿管一个reg，下降沿管另一个，可以节省一个clock circle
### data hazard
- R-type
> 问题：如果在同一个pipeline中， 有人在写t0， 有人在读t0，怎么办？
> 回答：简单来说，just stall，等写完之后再读。
> 回答： 如何stall，添加语句： （add x0 x0 x0）
> `一般情况下 double pumping是写是上升沿，读是下降沿，所以两个可以在一个circle中完成
> 
> 第二种方法： forwarding， 在上一个指令计算完alu之后就去 扔进下一个alu计算，
> use result when it is computed.



[[Pasted image 20231030173502.png]]
![[Pasted image 20231030174250.png]]
![[Pasted image 20231030191754.png]]
![[Pasted image 20231030191856.png]]

- Load-Type
> 上一个指令是load，如果是把x load进t0， 下一个指令是读t0， 不能forward，只能stall
> 这时候 编译器无法进行stall，只能从硬件上实现
> 可以通过添加 nop指令实现，叫做 **load delay slot**， 
> 编译器甚至可以避免出现load delay slot！，可以通过重排指令避免这个slot
> ![[Pasted image 20231030193908.png]]

### control hazard

> branch 必须stall，等到获得下一个PC指令才能前进。 
> 那么stall多少呢？ 必须stall 2个周期，等alu之后才知道执行哪一个
> branch的时候，需要进行下一个操作，那么需要执行哪一个命令呢？ 都要执行！
> 
> branch可能会带来新的data hazard，非常复杂

>现在的解决方案是： branch prediction
>分支预测在比较深的pipeline中惩罚非常严重。
> **动态预测** （根据以前的结果查表）
> **eager execution**（执行自己认为对的部分），这是个非常复杂的话题
> *branch target buffer, branch history table, geometric predictor*
> *local vs global branching*
> CS152有更多这个内容。
 




# superscalar processors

如何增加处理器性能？
1. clock rate  (时钟频率)
2. pipelining (流水线)
3. multi-issue  *super-scalar* processor (**超标量处理器**)
> 乱序执行中，可以并行执行里面好几条指令
	![[Pasted image 20231030202057.png]]
	![[Pasted image 20231030202326.png]]