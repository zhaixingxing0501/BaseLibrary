//
//  DateHelper.m
//  Pods
//
//  Created by zhaixingxing on 2020/8/19.
//

#import "DateHelper.h"

@interface DateHelper ()<NSCopying, NSMutableCopying>

@property (nonatomic, strong) NSCalendar *calender;

@end

static DateHelper *manager = nil;

@implementation DateHelper

#pragma mark - 秒及毫秒

/// 获取当前时间戳(秒)
+ (NSString *)nowTimestamp {
    return [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
}

/// 获取当前时间戳(毫秒)
+ (NSString *)nowMillisecondTimestamp {
    return [NSString stringWithFormat:@"%ld", (long)([[NSDate date] timeIntervalSince1970] * 1000)];
}

/// 毫秒转秒
/// @param millisecond 毫秒
+ (NSString *)MillisecondToimestampWithTimestamp:(NSString *)millisecond {
    if (millisecond.length == 13) {
        return [NSString stringWithFormat:@"%ld", (long)[millisecond longLongValue] / 1000];
    }
    return millisecond;
}

/// 秒转毫秒
/// @param timeStamp 秒
+ (NSString *)timestampToMillisecondWithTimestamp:(NSString *)timeStamp {
    if (timeStamp.length == 11) {
        return [NSString stringWithFormat:@"%ld", (long)[timeStamp longLongValue] * 1000];
    }
    return timeStamp;
}

#pragma mark - 日期NSDate

/// 时间戳转日期(NSDate)
/// @param timeStamp  时间戳(秒)
- (NSDate *)timeStampToDateWithTimeStamp:(NSString *)timeStamp {
    return [[NSDate alloc] initWithTimeIntervalSince1970:[timeStamp longLongValue]];
}

/// 时间转日期Date
/// @param time 时间字符串
/// @param format 格式
- (NSDate *)stringToDateWithTime:(NSString *)time format:(NSDateFormatter *)format {
    return [format dateFromString:time];
}

/// 时间转日期Date
/// @param time 时间字符串
/// @param formatType 格式
- (NSDate *)stringToDateWithTime:(NSString *)time formatType:(DateFormatType)formatType {
    [self setDateFormatType:formatType];
    return [self.dateFormatter dateFromString:time];
}

#pragma mark - 字符串日期

/// 获取当前时间(毫秒)
- (NSString *)nowTimeWithformatType:(DateFormatType)formatType {
    [self setDateFormatType:formatType];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [self.dateFormatter stringFromDate:datenow];
    return currentTimeString;
}

/// 日期转时间
/// @param date 日期
/// @param formate 格式
- (NSString *)dateToStringWithDate:(NSDate *)date format:(NSDateFormatter *)formate {
    return [formate stringFromDate:date];
}

/// 日期转时间
/// @param date 日期
/// @param formatType 格式
- (NSString *)dateToStringWithDate:(NSDate *)date formatType:(DateFormatType)formatType {
    [self setDateFormatType:formatType];
    return [self.dateFormatter stringFromDate:date];
}

/// 时间戳转时间
/// @param timeStamp 时间字符串
/// @param format 格式
- (NSString *)timeStampToTimeWithTimeStamp:(NSString *)timeStamp format:(NSDateFormatter *)format {
    NSDate *date = [self timeStampToDateWithTimeStamp:timeStamp];
    return [format stringFromDate:date];
}

/// 时间戳转时间
/// @param timeStamp 时间字符串
/// @param formatType 格式
- (NSString *)timeStampToTimeWithTimeStamp:(NSString *)timeStamp formatType:(DateFormatType)formatType {
    [self setDateFormatType:formatType];
    return [self timeStampToTimeWithTimeStamp:timeStamp format:self.dateFormatter];
}

#pragma mark - 时间间隔

/// 距离date几年的时间
/// @param date 当前时间/相对时间
/// @param year 相差几个年 负数代表之前时间
- (NSDate *)timeIntervalWithDate:(NSDate *)date year:(NSInteger)year {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:year];
    NSDate *mDate = [self.calender dateByAddingComponents:comps toDate:date options:0];
    return mDate;
}

/// 距离date几个月的时间
/// @param date 当前时间/相对时间
/// @param month 相差几个月 负数代表之前时间
- (NSDate *)timeIntervalWithDate:(NSDate *)date month:(NSInteger)month {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSDate *mDate = [self.calender dateByAddingComponents:comps toDate:date options:0];
    return mDate;
}

/// 距离date几天的时间
/// @param date 当前时间/相对时间
/// @param day 相差几个天 负数代表之前时间
- (NSDate *)timeIntervalWithDate:(NSDate *)date day:(NSInteger)day {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:day];
    NSDate *mDate = [self.calender dateByAddingComponents:comps toDate:date options:0];
    return mDate;
}

#pragma mark - setter and getter

- (void)setDateFormatType:(DateFormatType)dateFormatType {
    _dateFormatType = dateFormatType;

    switch (_dateFormatType) {
        case DateFormatYearMonthDayHourMinuteSecond:
            _dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
            break;
        case DateFormatYearMonthDayHourMinute:
            _dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
            break;
        case DateFormatMonthDayHourMinute:
            _dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
            break;
        case DateFormatYearMonthDay:
            _dateFormatter.dateFormat = @"yyyy-MM-dd";
            break;
        case DateFormatDayHourMinute:
            _dateFormatter.dateFormat = @"dd HH:mm";
            break;
        case DateFormatYearMonth:
            _dateFormatter.dateFormat = @"yyyy-MM";
            break;
        case DateFormatMonthDay:
            _dateFormatter.dateFormat = @"yyyy-MM-dd";
            break;
        case DateFormatHourMinuteSecond:
            _dateFormatter.dateFormat = @"HH:mm:ss";
            break;
        case DateFormatHourMinute:
            _dateFormatter.dateFormat = @"HH:mm";
            break;

        default:
            _dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
            break;
    }
}

- (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    return _dateFormatter;
}

- (NSCalendar *)calender {
    if (_calender) {
        _calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    return _calender;
}

#pragma mark --  单例标准初始化 --

+ (instancetype)shareManager {
    return [[self alloc] init];
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [super init];
    });
    return manager;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [super allocWithZone:zone];
    });
    return manager;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return manager;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    return manager;
}

@end
