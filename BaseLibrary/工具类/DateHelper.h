//
//  DateHelper.h
//  Pods
//
//  Created by zhaixingxing on 2020/8/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 根据项目需求添加
typedef NS_ENUM (NSInteger, DateFormatType) {
    /// 年月日时分秒   yyyy-MM-dd HH:mm:ss
    DateFormatYearMonthDayHourMinuteSecond,
    /// 年月日时分 yyyy-MM-dd HH:mm
    DateFormatYearMonthDayHourMinute,
    /// 月日时分 MM-dd HH:mm
    DateFormatMonthDayHourMinute,
    /// 年月日  yyyy-MM-dd
    DateFormatYearMonthDay,
    /// 日时分  dd HH:mm
    DateFormatDayHourMinute,
    /// 年月 yyyy-MM
    DateFormatYearMonth,
    /// 月日 MM-dd
    DateFormatMonthDay,
    /// 时分秒 HH:mm:ss
    DateFormatHourMinuteSecond,
    /// 时分  HH:mm
    DateFormatHourMinute
};

@interface DateHelper : NSObject

#pragma mark - 秒及毫秒

/// 获取当前时间戳(秒)
+ (NSString *)nowTimestamp;
/// 获取当前时间戳(毫秒)
+ (NSString *)nowMillisecondTimestamp;

/// 毫秒转秒
/// @param millisecond 毫秒
+ (NSString *)MillisecondToimestampWithTimestamp:(NSString *)millisecond;

/// 秒转毫秒
/// @param timeStamp 秒
+ (NSString *)timestampToMillisecondWithTimestamp:(NSString *)timeStamp;

#pragma mark - 日期NSDate

/// 时间戳转日期(NSDate)
/// @param timeStamp  时间戳
+ (NSDate *)timeStampToDateWithTimeStamp:(NSString *)timeStamp;

/// 时间转日期Date
/// @param time 时间字符串
/// @param format 格式
+ (NSDate *)stringToDateWithTime:(NSString *)time format:(NSDateFormatter *)format;

/// 时间转日期Date
/// @param time 时间字符串
/// @param formatType 格式
+ (NSDate *)stringToDateWithTime:(NSString *)time formatType:(DateFormatType)formatType;

#pragma mark - 字符串日期

/// 获取当前时间(毫秒)
+ (NSString *)nowTimeWithformatType:(DateFormatType)formatType;

/// 日期转时间
/// @param date 日期
/// @param format 格式
+ (NSString *)dateToStringWithDate:(NSDate *)date format:(NSDateFormatter *)format;

/// 日期转时间
/// @param date 日期
/// @param formatType 格式
+ (NSString *)dateToStringWithDate:(NSDate *)date formatType:(DateFormatType)formatType;

/// 时间戳转时间
/// @param timeStamp 时间字符串
/// @param format 格式
+ (NSString *)timeStampToTimeWithTimeStamp:(NSString *)timeStamp format:(NSDateFormatter *)format;

/// 时间戳转时间
/// @param timeStamp 时间字符串
/// @param formatType 格式
+ (NSString *)timeStampToTimeWithTimeStamp:(NSString *)timeStamp formatType:(DateFormatType)formatType;

#pragma mark - 时间间隔

/// 距离date几个月的时间
/// @param date 当前时间/相对时间
/// @param month 相差几个月 负数代表之前时间
+ (NSDate *)timeIntervalWithDate:(NSDate *)date month:(NSInteger)month;

/// 距离date几天的时间
/// @param date 当前时间/相对时间
/// @param day 相差几个天 负数代表之前时间
+ (NSDate *)timeIntervalWithDate:(NSDate *)date day:(NSInteger)day;

/// 距离date几年的时间
/// @param date 当前时间/相对时间
/// @param year 相差几个年 负数代表之前时间
+ (NSDate *)timeIntervalWithDate:(NSDate *)date year:(NSInteger)year;

@end

NS_ASSUME_NONNULL_END
