//
//  UIControl+Swap.m
//  PARuntime
//
//  Created by shuo on 2017/3/14.
//  Copyright © 2017年 shuo. All rights reserved.
//

#import "UIControl+Swap.h"
#import "PARuntimeKit.h"

@implementation UIControl (Swap)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [PARuntimeKit methodSwapWithClass:[self class] method1:@selector(sendAction:to:forEvent:) method2:@selector(pa_sendAction:to:forEvent:)];
    });
}

- (void)pa_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    // 1.先执行原来的方法 因为已经交换，所以要值行原来的方法就必须掉用交换后的方法名
    [self pa_sendAction:action to:target forEvent:event];
    // 2.再做自己的操作
    NSLog(@"UIControl统一的点击操作");
}

@end
