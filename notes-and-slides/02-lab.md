
1. 对于C语言来说， malloc 返回的是 `void *`, 需要用 强制类型转化将其转换成对应类型
2. 将堆上内存free
3. 不要将指针指向局部变量
4. 创建对象是，并且未初始化时，其值无法控制
6. malloc 只开辟内存
7. cmalloc 开辟内存并且初始化为0
8. realloc 可以将指针重新分配到更大的地方。
9. 不要泄露内存， 注意free掉所有malloc的内存
10.  gcc -c 是只进行编译阶段，不进行链接， gcc -o 是生成 out文件
	1. gcc -c -ggdb -Wall -std=c99 vector.c
	2. gcc -c -ggdb -Wall -std=c99 vector_test.c
	3. gcc -ggdb -Wall -std=c99 -g -o vector_test  vector.o vector_test.o