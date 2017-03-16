//
//  PARuntimeKit.h
//  PARuntime
//
//  Created by shuo on 2017/3/14.
//  Copyright © 2017年 shuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PARuntimeKit : NSObject

+ (void)methodSwapWithClass:(Class)class method1:(SEL)method1 method2:(SEL)method2;

@end
