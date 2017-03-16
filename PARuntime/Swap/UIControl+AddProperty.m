//
//  UIControl+AddProperty.m
//  PARuntime
//
//  Created by shuo on 2017/3/16.
//  Copyright © 2017年 shuo. All rights reserved.
//

#import "UIButton+AddProperty.h"
#import <objc/runtime.h>

static char identifier;

@implementation UIButton (AddProperty)

- (NSString *)identifier {
    return objc_getAssociatedObject(self, &identifier);
}

- (void)setIdentifier:(NSString *)identifier {
    return objc_setAssociatedObject(self, &identifier, identifier, OBJC_ASSOCIATION_COPY);
}

@end
