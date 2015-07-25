# THINGS TO DO
## There are several parts:
> + **项目基本架构**
> + **初始化**
> + **内存管理**
> + **多任务**
> + **其他/高级**
> + **参考**

### **basic infrastructure:**
+ 关于include文件夹的位置
+ 调整build/kernel.lds的位置？
+ arch系列文件夹架构：补充x86 e.g. x86asm.hpp对底层汇编的封装
+ namespace systearch/cpu?中抽取底层共性：中断等
	+  system::enable_interrupt() 
	+  system::relax_cpu 
	+  cpu::relax() ...
	
+ 杂项或架构性：内存障碍 memory_barrier
	+ system wide(compiler): ~__asm__(:::"memory")
	+ arch related: x86::mfence() x86::sfence()
	+ general: rmb() wmb() etc

+ percpu 一类 针对每个cpu变量 初始化 __percpu
+ compiler.h 增加  (请替换去除符号）诸如此类
> ~define ~__user__ ~__attribute__((noderef, address_space(1)))
> ~define ~__kernel__ ~__attribute__((noderef, address_space(0)))
> ~define ~__mmio__ ~__attribute__((noderef, address_space(2)))
> ~define ~section(x) ~__attribute__((section(x)))
+ 基本C++:cxxabi的事情 utility中的类 atomic,spinlock(已实现) 还有 链表mutex, semaphore等(需要借助cpu/system等中断相关)
+ module模块机制(包括)
> + 更新init.h init/ctor机制(__init __exit __ctor __dtor)
> + 与C++ ABI 协同的 __cxa_finalize __cxa_atexit与__exit __dtor

+ 其他:platform? EFI?

### **initialization:**
+ 利用grub2 光盘? 引导
+ boot代码切换模式(long mode) 开启 SSE执行环境（临时简单）分页
+ kernel::start() 初始化:
> 1. 输出些什么？
> 2. 虚拟内存映射(分页map 不同的zone划分) **important!**
>     还有物理内存(MTRR设置) 以及相关常量/宏
> 3. cpu  identification 初始化 指令集测定
>     APIC中断 异常处理 HPET 
>     多处理器 初始化
> 4. 其他初始化

+ 早期终端console VGA/串口 输出 ring buffer?
+ 日志输出

### **memory management!**
+ 虚拟内存区域（静态 动态 DMA MMIO区域）
+ buddy system 基于链表和zone的页面管理
+ 缺页异常 页面置换算法（LRU，时钟，老化）
+ 动态内存分配 
+ 用户空间页/内存分配

### **multitasking**
+ 线程/进程结构
+ 虚拟内存切换
+ fork
+ 时钟 8254/APIC TIMER/HPET
+ 调度算法
+ 时间片计算

### 其他/高级：
+ ACPI: 涉及APIC HPET 电源管理
+ 以后: 总线设备枚举 硬件驱动 图形 图形服务器？

### 以后参考：
+ linux & nt
+ 《WINDOWS内核原理与实现》
+ GoodQT's CSDN blog