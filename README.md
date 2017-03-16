#Runtime
参考资料：  
[官方文档翻译](http://www.jianshu.com/p/158c5d118937)  
[iOS runtime 之 Class 和 MetaClass](http://www.jianshu.com/p/8036f15c91c6)  
[iOS开发之Runtime常用示例总结](http://www.cocoachina.com/ios/20170301/18804.html)  
[OC最实用的runtime总结，面试、工作你看我就足够了！](http://www.jianshu.com/p/ab966e8a82e2)  
[RunTime应用实例--关于埋点的思考
](http://www.jianshu.com/p/69859d580354)

######...是什么？
Runtime是OC底层的一套C语言API，编译器最终都会将OC代码转化为运行时代码。  

引用runtime官方API的一段介绍：  
You typically don't need to use the Objective-C runtime library directly when programming in Objective-C. This API is useful primarily for developing bridge layers between Objective-C and other languages, or for low-level debugging.  
大致意思就是说 runtime作为Objective-C和其他语言之间的桥梁，在平时的OC开发中一般是用不到的。  

但是还是要了解一下runtime，因为利用runtime可以做一些OC不容易实现的功能。

######...能做什么？  
* 获取某个类的所有成员变量、成员方法
* 动态的为对象添加成员变量和成员方法
* 动态交换两个方法和实现（特别是交换系统自带的方法）

######...常用方法  
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

######...什么时候用？
1. 通过分类添加属性值；  
	* 如果在分类的声明中写@property 只能为其生成get 和 set 方法的声明，但无法生成成员变量，就是虽然点语法能调用出来，但程序执行后会crash.
	* 通过@property声明属性，默认会自动生成一个成员变量，并且生成setter、getter方法；
	* 通过runtime的方式在分类中添加属性。
2. 交换两个方法的实现，拦截系统自带的方法调用功能；  
3. 获取一个类的所有成员变量；
	* 获取model中所有成员变量和类型；
	* 利用runtime获取所有属性，来重写归档解归档方法；  
	* 利用runtime获取所有属性，进行字典转model；

######...用起来
1. 使用Runtime进行埋点操作；
2. 使用Runtime获取所有属性，进行归档解归档操作；
3. 使用Runtime获取所有属性，进行字典转model操作。

[ObjCRuntimeDemo](https://github.com/lizelu/ObjCRuntimeDemo)  
[XHRuntimeDemo](https://github.com/XHTeng/XHRuntimeDemo)  
[LogByRunTime](https://github.com/MikeFighting/LogByRunTime)

