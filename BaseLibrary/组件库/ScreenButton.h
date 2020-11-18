//
//  ScreenButton.h
//  BaseLibrary
//
//  Created by nucarf on 2020/11/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef enum : NSUInteger {
    ScreenButtonNormal,
    ScreenButtonSelected,
    ScreenButtonDidSelected,
} ScreenButtonStatus;


@interface ScreenButton : UIControl

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIImageView *topImageView;
@property (nonatomic, strong) UIImageView *bottomImageView;
@property (nonatomic, assign) ScreenButtonStatus selectStyle;

@end
    

NS_ASSUME_NONNULL_END
