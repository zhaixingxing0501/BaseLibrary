//
//  UtilsMacros.h
//  StandardProject-OC
//
//  Created by nucarf on 2020/9/9.
//  Copyright © 2020 zhaixingxing. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

#pragma mark --  设备信息 --

#define kVersion [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]

#define SYSTEM_VERSION_EQUAL_TO(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)             ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//大于等于10.0的ios版本
#define iOS10_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")

//大于等于9.0的ios版本
#define iOS9_OR_LATER  SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")

#pragma mark --  日志信息 --

#ifdef DEBUG

// 只打印目标内容
//#define NSLog(fmt, ...) fprintf(stderr, "\n%s", [[NSString stringWithFormat:fmt, ## __VA_ARGS__] UTF8String])
#define NSLog(fmt, ...) fprintf(stderr, "%s:%d\n%s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:fmt, ## __VA_ARGS__] UTF8String])
#else
#define NSLog(...)
#endif

#pragma mark --  系统单例缩写 --

#define kApplication        [UIApplication sharedApplication]
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kWindow             [UIApplication sharedApplication].keyWindow

#pragma mark --  角度转弧度 --

#define DEGREES_TO_RADIANS(d)   (d * M_PI / 180)

#pragma mark --  颜色 --

#define kcolorRandom        [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]
#define kcolorFromHex(k, ...)   [UIColor colorWithRed:((float)((k & 0xFF0000) >> 16)) / 255.f green:((float)((k & 0xFF00) >> 8)) / 255.f blue:((float)(k & 0xFF)) / 255.f alpha:1.f]
#define rgba(r, g, b, a)        [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define rgb(r, g, b)            [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]

#pragma mark --  时间 --
///  获取当前时间戳
#define getCurentTime       [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]

#pragma mark --  字符串 --
#define kEmptyStr           @""
#define kIntToStr(i)            [NSString stringWithFormat:@"%d", i]
#define kIntegerToStr(i)        [NSString stringWithFormat:@"%ld", i]
#define kStringWithFormat(str)  [NSString stringWithFormat:@"%@",  (!(id)str || (id)str == [NSNull null]) ? @"" : (id)str]
/// 字符串是否为空
#define kStringIsEmpty(str)     ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO)
/// 数组是否为空
#define kArrayIsEmpty(array)    (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
/// 字典是否为空
#define kDictIsEmpty(dic)       (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
/// 是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
                                 || [_object isKindOfClass:[NSNull class]] \
                                 || ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
                                 || ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
/** 判断空对象 */
#define EMPTYOBJECT(k, ...)     (!k || [k isKindOfClass:[NSNull class]] || ([k respondsToSelector:@selector(length)] && [(NSData *)k length] == 0) || ([k respondsToSelector:@selector(count)] && [(NSArray *)k count] == 0))

#pragma mark --  字体 --
#define kFont(x)                [UIFont systemFontOfSize:x]
#define kFontBold(x)            [UIFont boldSystemFontOfSize:x]

#define kFont_regular(x)        [UIFont systemFontOfSize:x weight:UIFontWeightRegular]
#define kFont_medium(x)         [UIFont systemFontOfSize:x weight:UIFontWeightMedium]
#define kFont_weight(x, size)   [UIFont systemFontOfSize:x weight:(size)]

#pragma mark --  图片 --

#define kImageWithpathName(A)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
#define kImageWithName(A)       [UIImage imageNamed:A]

#define WeakObj(o)              try {} @finally {} __weak typeof(o) o ## Weak = o;
/** 弱引用 */
#define WEAKSELF(k, ...)        __weak __typeof(k) weak = k

#endif /* UtilsMacros_h */
