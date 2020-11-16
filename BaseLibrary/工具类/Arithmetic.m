//
//  Arithmetic.m
//  NucarfProject
//
//  Created by zhaixingxing on 2020/4/15.
//  Copyright © 2020 zhaixingxing. All rights reserved.
//

#import "Arithmetic.h"

#define kArithmetic(floatNum) [NSString stringWithFormat:@"%f", A]

@implementation Arithmetic

bool blankString(NSString *str)
{
    if (!str) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [str stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}

+ (CGFloat)sumFloatWithA:(CGFloat)A B:(CGFloat)B {
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:kArithmetic(A)];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:kArithmetic(B)];
    NSDecimalNumber *result = [number1 decimalNumberByAdding:number2];
    return result.floatValue;
}

+ (CGFloat)subFloatWithA:(CGFloat)A B:(CGFloat)B {
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:kArithmetic(A)];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:kArithmetic(B)];
    NSDecimalNumber *result = [number1 decimalNumberBySubtracting:number2];
    return result.floatValue;
}

+ (CGFloat)mulFloatWithA:(CGFloat)A B:(CGFloat)B {
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:kArithmetic(A)];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:kArithmetic(B)];
    NSDecimalNumber *result = [number1 decimalNumberByMultiplyingBy:number2];
    return result.floatValue;
}

+ (CGFloat)divFloatWithA:(CGFloat)A B:(CGFloat)B {
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:kArithmetic(A)];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:kArithmetic(B)];
    NSDecimalNumber *result = [number1 decimalNumberByDividingBy:number2];
    return result.floatValue;
}

+ (NSString *)sumWithA:(NSString *)A B:(NSString *)B {
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:A];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:B];
    NSDecimalNumber *result = [number1 decimalNumberByAdding:number2];
    return result.stringValue;
}

+ (NSString *)subWithA:(NSString *)A B:(NSString *)B {
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:A];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:B];
    NSDecimalNumber *result = [number1 decimalNumberBySubtracting:number2];
    return result.stringValue;
}

+ (NSString *)mulWithA:(NSString *)A B:(NSString *)B {
    if (blankString(A)) return A;
    if (blankString(B)) return B;

    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:A];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:B];
    NSDecimalNumber *result = [number1 decimalNumberByMultiplyingBy:number2];
    return result.stringValue;
}

+ (NSString *)divWithA:(NSString *)A B:(NSString *)B {
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:A];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:B];
    NSDecimalNumber *result = [number1 decimalNumberByDividingBy:number2];
    return result.stringValue;
}

@end
