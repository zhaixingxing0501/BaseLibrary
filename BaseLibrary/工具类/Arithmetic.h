//
//  Arithmetic.h
//  NucarfProject
//
//  Created by zhaixingxing on 2020/4/15.
//  Copyright © 2020 zhaixingxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Arithmetic : NSObject


+ (CGFloat)sumFloatWithA:(CGFloat)A B:(CGFloat)B;
+ (CGFloat)subFloatWithA:(CGFloat)A B:(CGFloat)B;
+ (CGFloat)mulFloatWithA:(CGFloat)A B:(CGFloat)B;
+ (CGFloat)divFloatWithA:(CGFloat)A B:(CGFloat)B;

+ (NSString *)sumWithA:(NSString *)A B:(NSString *)B;
+ (NSString *)subWithA:(NSString *)A B:(NSString *)B;
+ (NSString *)mulWithA:(NSString *)A B:(NSString *)B;
+ (NSString *)divWithA:(NSString *)A B:(NSString *)B;


@end

NS_ASSUME_NONNULL_END
