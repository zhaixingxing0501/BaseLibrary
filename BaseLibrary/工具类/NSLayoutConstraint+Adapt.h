//
//  NSLayoutConstraint+Adapt.h
//  NucarfProject
//
//  Created by zhaixingxing on 2020/6/15.
//  Copyright © 2020 zhaixingxing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*
 xib 文件适配
 
 */

@interface NSLayoutConstraint (Adapt)

///  默认0,  宽度适应1  高度适应2   高度按宽度比例适应
@property (nonatomic, assign) IBInspectable NSInteger adapterScreen;

@end

NS_ASSUME_NONNULL_END
