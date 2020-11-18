//
//  ScreenButton.m
//  BaseLibrary
//
//  Created by nucarf on 2020/11/17.
//

#import "ScreenButton.h"

@implementation ScreenButton
                                    
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)createUI {


}


- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [UILabel new];
    }
    return _titleLable;
}
@end
