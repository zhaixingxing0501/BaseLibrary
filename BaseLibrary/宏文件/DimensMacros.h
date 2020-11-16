//
//  DimensMacros.h
//  StandardProject-OC
//
//  Created by nucarf on 2020/9/9.
//  Copyright © 2020 zhaixingxing. All rights reserved.
//

#ifndef DimensMacros_h
#define DimensMacros_h

#define IS_PhoneXAll \
    ({ BOOL IS_PhoneXAll = NO; \
       if (@available(iOS 11.0, *)) { \
           IS_PhoneXAll = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0; \
       } \
       (IS_PhoneXAll); })

/// 屏幕宽、高
#define kScreenWidth         [UIScreen mainScreen].bounds.size.width
#define kScreenHeight        [UIScreen mainScreen].bounds.size.height

/// 比例尺寸
#define kScale               ([UIScreen mainScreen].bounds.size.width) / 375.0
#define kHeightScale         ([UIScreen mainScreen].bounds.size.height) / 667.0

/// 1个像素的宽度
#define SINGLE_LINE_WIDTH    (1.0f / [UIScreen mainScreen].scale)
/// 线条高度
#define kLineHeight          (IS_PhoneXAll ? 0.5 : 1)
/// 状态栏高度
#define kStateBarHeight      [[UIApplication sharedApplication] statusBarFrame].size.height
/// 导航栏高度
#define kNavigationBarHeight kStateBarHeight + 44
/// 底部tabbar高度
#define kTabBarHeight        (IS_PhoneXAll ? (49.0 + 34.0) : 49.0)
/// 底部安全距离
#define kSafeBottomHeight    (IS_PhoneXAll ? 34.0 : 0)

#pragma mark - 油站端定义

/// 顶部弹出框的高度
#define kTopPopViewHeight    214
/// 顶部弹出框的高度
#define kBottomPopViewHeight 214

#endif /* DimensMacros_h */
