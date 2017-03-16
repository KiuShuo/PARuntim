# Runtime
参考资料：  

###### ...是什么？
Runtime是OC底层的一套C语言API，编译器最终都会将OC代码转化为运行时代码。  

引用runtime官方API的一段介绍：  
You typically don't need to use the Objective-C runtime library directly when programming in Objective-C. This API is useful primarily for developing bridge layers between Objective-C and other languages, or for low-level debugging.  
大致意思就是说 runtime作为Objective-C和其他语言之间的桥梁，在平时的OC开发中一般是用不到的。  

但是还是要了解一下runtime，因为利用runtime可以做一些OC不容易实现的功能。

###### ...能做什么？  
* 获取某个类的所有成员变量、成员方法
* 动态的为对象添加成员变量和成员方法
* 动态交换两个方法和实现（特别是交换系统自带的方法）

###### ...常用方法  
```
/// 获取指定类的成员变量 成员变量+非动态属性之外的所有成员属性对应的成员变量

// 获取成员变量名称对应的C语言字符串数组
Ivar * class_copyIvarList(Class cls, unsigned int *outCount);
// 获取成员变量名称对应的C语言字符串
const char * ivar_getName(Ivar v);
// 获取成员变量对应类型名称的C语言字符串
const char * ivar_getTypeEncoding(Ivar v);
// 通过UTF8转码将C语言类型字符串转换为NSString类型
+ (instancetype)stringWithUTF8String:(const char *)nullTerminatedCString;

/// 获取指定类的成员属性  包含动态属性在内的所有成员属性

// 获取成员属性对应的C语言字符串数组
objc_property_t * class_copyPropertyList(Class cls, unsigned int *outCount);
// 获取成员属性名称对应的C语言字符串
const char * property_getName(objc_property_t property);
// 通过UTF8转码将C语言类型字符串转换为NSString类型
+ (instancetype)stringWithUTF8String:(const char *)nullTerminatedCString;

```
***
```
/// 动态添加属性

// 给对象设置关联属性值
void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
// 获取对象的关联属性值
id objc_getAssociatedObject(id object, const void *key);
```
***

```
/// 方法交换

// 获取某个类的类方法
Method class_getClassMethod(Class cls, SEL name)
// 获取某个类的实例方法
Method class_getInstanceMethod(Class cls, SEL name)
// 交换两个方法
Void method_exchangeImplementations(Method m1, Method m2)
```
***

