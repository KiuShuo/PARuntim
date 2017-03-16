//
//  UIControl+AddProperty.m
//  PARuntime
//
//  Created by shuo on 2017/3/16.
//  Copyright © 2017年 shuo. All rights reserved.
//

#import "UIControl+AddProperty.h"
#import <objc/runtime.h>

static char kIdentifier;


@implementation UIControl (AddProperty)

//@dynamic identifier;

- (void)setIdentifier:(NSString *)identifier {
    /**
     void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     通过给定的key值和关联策略来给对象设置关联值；
     
     object 设置关联值的对象
     key 关联key值；一个属性对应一个key值，可以通过key值取出关联属性，key可以是任何类型 double、int等，通常使用char类型节省字节；
     value 给属性设置的值
     policy 关联策略(assign return strong copy)
     */
    return objc_setAssociatedObject(self, &kIdentifier, identifier, OBJC_ASSOCIATION_COPY);
}


- (NSString *)identifier {
    /**
     id objc_getAssociatedObject(id object, const void *key);
     通过key获取指定对象的关联属性值
     
     Parameters
     object 关联对象；
     key 关联key值；
     Returns key值对应的关联属性值；
     */
    return objc_getAssociatedObject(self, &kIdentifier);
}


@end
