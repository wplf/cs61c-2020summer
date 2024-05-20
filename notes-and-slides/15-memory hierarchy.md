

![[Pasted image 20231030204631.png]]


**Memory Cache**, hold a copy of a subset of main memory

cache 四问：
1. 内存中的数据放哪
2. 怎么知道cache中是不是有这个数据
3. 怎么快速找到数据
4. 怎么交换cache和内存中的数据

- INDEX
- TAG
- OFFSET

8位的标志位
【TAG】【OFFSET】 

cache 的 bit 位计算方法：
cache总大小  =  256 B
data block一共 8 块
每块 data = 256 / 8 = 32B
data需要的offset = log 2 (32) = 5 bit

一般请款下 一个cache的block是32个bit，和word size大小相同。
offset表示在block中的偏移

main memory 16-128 bytes（block）
l2 cache  8-32bytes（block）
l1 cache 4-8 bytes（word）


offset:  标记一个block中的偏移
index：memory的block 到 cache的映射
tag：   确定是哪一个block到cache 映射
![[Pasted image 20231101152134.png]]

block size （offset）
cache size （2 ^ offset * 8）


![[Pasted image 20231101163724.png]]
![[Pasted image 20231101173749.png]]