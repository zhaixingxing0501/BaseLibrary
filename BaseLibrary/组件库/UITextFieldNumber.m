//
//  UITextFieldNumber.m
//  BaseLibrary
//
//  Created by nucarf on 2020/11/17.
//

#import "UITextFieldNumber.h"


@interface UITextFieldNumber ()<UITextFieldDelegate>

@end

@implementation UITextFieldNumber

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        
        
    }
    return self;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
    
    
    return [UITextFieldNumber textField:textField lengthLimit:5 range:range replacementString:string];
    
    
//
//    BOOL isHaveDian;
//    if ([textField.text rangeOfString:@"."].location == NSNotFound) {
//        isHaveDian = NO;
//    } else {
//        isHaveDian = YES;
//    }
//
//    if ([string length] > 0) {
//        unichar single = [string characterAtIndex:0];    //当前输入的字符
//        if ((single >= '0' && single <= '9') || single == '.') {    //数据格式正确
//            //首字母不能为0和小数点
//            if ([textField.text length] == 0) {
//                if (single == '.') {
//                    //[self showError:@"亲，第一个数字不能为小数点"];
//                    textField.text = @"0";
//                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
//                    return YES;
//                }
//                //                if (single == '0') {
//                //[self showError:@"亲，第一个数字不能为0"];
//                //                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
//                //                    return NO;
//                //                }
//            }
//
//            //输入的字符是否是小数点
//            if (single == '.') {
//                if (!isHaveDian) {    //text中还没有小数点
//                    isHaveDian = YES;
//                    return YES;
//                } else {
//                    //[self showError:@"亲，您已经输入过小数点了"];
//                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
//                    return NO;
//                }
//            } else {
//                if (isHaveDian) {    //存在小数点
//                    //判断小数点的位数
//                    NSRange ran = [textField.text rangeOfString:@"."];
//                    if (range.location - ran.location <= 2) {
//                        return YES;
//                    } else {
//                        //[self showError:@"亲，您最多输入两位小数"];
//                        return NO;
//                    }
//                } else {
//                    return YES;
//                }
//            }
//        } else {    //输入的数据格式不正确
//            //[self showError:@"亲，您输入的格式不正确"];
//            [textField.text stringByReplacingCharactersInRange:range withString:@""];
//            return NO;
//        }
//    } else {
//        return YES;
//    }
}


+ (BOOL)textField:(UITextField *)textField lengthLimit:(NSInteger)limit range:(NSRange)range replacementString:(NSString *)string {
    
    BOOL isHaveDian;
    if ([textField.text rangeOfString:@"."].location == NSNotFound) {
        isHaveDian = NO;
    } else {
        isHaveDian = YES;
    }
    
   // string.length == 0 是删除
    if (string.length != 0 && textField.text.length >= limit) {
        return NO;
    }
    
    
    if ([string length] <= 0) return YES;
    // 当前输入字符
    unichar single = [string characterAtIndex:0];    //当前输入的字符
    
    
  
    // 字符格式判断
    if ((single >= '0' && single <= '9') || single == '.') {//数据格式正确
        
        //首字母不能为0和小数点
        if ([textField.text length] == 0) {
            if (single == '.') {
                //[self showError:@"亲，第一个数字不能为小数点"];
                textField.text = @"0";
                [textField.text stringByReplacingCharactersInRange:range withString:@""];
                return YES;
            }
            //                if (single == '0') {
            //[self showError:@"亲，第一个数字不能为0"];
            //                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
            //                    return NO;
            //                }
        }
        
        //输入的字符是否是小数点
        if (single == '.') {
            if (!isHaveDian) {    //text中还没有小数点
                isHaveDian = YES;
                return YES;
            } else {
                //[self showError:@"亲，您已经输入过小数点了"];
                [textField.text stringByReplacingCharactersInRange:range withString:@""];
                return NO;
            }
        } else {
            if (isHaveDian) {    //存在小数点
                //判断小数点的位数
                NSRange ran = [textField.text rangeOfString:@"."];
                if (range.location - ran.location <= 2) {
                    return YES;
                } else {
                    //[self showError:@"亲，您最多输入两位小数"];
                    return NO;
                }
            } else {
                return YES;
            }
        }
    } else {
        [textField.text stringByReplacingCharactersInRange:range withString:@""];
    }
    
    return NO;
}



@end
