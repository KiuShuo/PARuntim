//
//  PARuntimeKit.m
//  PARuntime
//
//  Created by shuo on 2017/3/14.
//  Copyright © 2017年 shuo. All rights reserved.
//

#import "PARuntimeKit.h"
#import <objc/runtime.h>

@implementation PARuntimeKit


/**
 方法交换
 */
+ (void)methodSwapWithClass:(Class)class method1:(SEL)method1 method2:(SEL)method2 {
    // 获取类对应的实例方法
    Method firstMethod = class_getInstanceMethod(class, method1);
    Method secondMethod = class_getInstanceMethod(class, method2);
    // 交换两个方法的内部实现 注：AMethod、BMethod交换后想要
    method_exchangeImplementations(firstMethod, secondMethod);
}

@end
