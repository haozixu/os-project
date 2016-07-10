#（伪）代码规范

##新事项
有可能的话，遵循ISO C++的风格
参见https://github.com/isocpp/CppCoreGuidelines

## 1.标志符命名
采用下划线命名法
> e.g. int get_property()
 
而不是camelCase或者是PascalCase

*然后我就先随便写了......*

## 2.类型命名：
通常将int* char*一类视为类型
在函数签名中尽量这么写
如果一些兼容C库的东西有些时候这么写
> void *src, void *dst
> 在定义/声明时不同，如：char *p, *q;


## 3.语句
大括号：
函数：
void function
{
	...
}
语句块(lambda同)
if {
	...
}
命名空间
namespace xxx {
	...
}

小括号与空格
if (...) {
	...
}

do (...) {
	...
} while (...);

asm volatile (...);

function_call(...);
binary_function(arg1, arg2);

a = b + c * 2 - d & 3 + e ^ 5;

## 4.其它的：
arch/(ARCH)/include/asm/: 直接的汇编最底层抽象，禁止高阶（包装asm(...)）
include/arch是指向arch/(ARCH)/include/的软链接

还有给文档命名用PascalCase, UTF-8

头文件尽量#pragma once，#ifndef #define #endif组合我也没意见
c的头文件或者无关紧要（都可以）的后缀.h
c++的头文件（只能c++）的后缀.hpp
c源文件.c c++源文件.cpp
