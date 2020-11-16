//
//  NSLayoutConstraint+Adapt.m
//  NucarfProject
//
//  Created by zhaixingxing on 2020/6/15.
//  Copyright © 2020 zhaixingxing. All rights reserved.
//

#import "NSLayoutConstraint+Adapt.h"
#import <objc/runtime.h>

// 基准屏幕宽度
#define kRefereWidth  375.0
// 以屏幕宽度为固定比例关系，来计算对应的值。假设：基准屏幕宽度375，floatV=10；当前屏幕宽度为750时，那么返回的值为20
#define AdaptW(floatValue) (floatValue * [[UIScreen mainScreen] bounds].size.width / kRefereWidth)

#define kRefereHeight 667.0
#define AdaptH(floatValue) (floatValue * [[UIScreen mainScreen] bounds].size.height / kRefereHeight)

@implementation NSLayoutConstraint (Adapt)

//定义常量 必须是C语言字符串
static char *AdapterScreenKey = "AdapterScreenKey";

- (NSInteger)adapterScreen {
    NSNumber *number = objc_getAssociatedObject(self, AdapterScreenKey);
    return number.integerValue;
}

- (void)setAdapterScreen:(NSInteger)adapterScreen {
    NSNumber *number = @(adapterScreen);
    objc_setAssociatedObject(self, AdapterScreenKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    switch (adapterScreen) {
        case 0:
            self.constant = self.constant;
            break;
        case 1:
            self.constant = AdaptW(self.constant);

            break;
        case 2:
            self.constant = AdaptH(self.constant);
            break;

        default:
            break;
    }
}

@end
