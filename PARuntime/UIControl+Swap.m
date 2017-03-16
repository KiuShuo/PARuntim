//
//  UIControl+Category.m
//  PARuntime
//
//  Created by shuo on 2017/3/14.
//  Copyright © 2017年 shuo. All rights reserved.
//

#import "UIControl+Category.h"
#import "PARuntimeKit.h"

@implementation UIControl (Category)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [PARuntimeKit methodSwapWithClass:[self class] method1:@selector(sendAction:to:forEvent:) method2:@selector(pa_sendAction:to:forEvent:)];
    });
}

- (void)pa_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    // 1.先执行原来的方法
    [self pa_sendAction:action to:target forEvent:event];
    // 在做自己的操作
    NSLog(@"点击了button");
}

@end
