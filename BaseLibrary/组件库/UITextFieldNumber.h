//
//  UITextFieldNumber.h
//  BaseLibrary
//
//  Created by nucarf on 2020/11/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextFieldNumber : UITextField

// 0 为不限制
@property (nonatomic, assign) NSInteger limitLength;

@end

NS_ASSUME_NONNULL_END
