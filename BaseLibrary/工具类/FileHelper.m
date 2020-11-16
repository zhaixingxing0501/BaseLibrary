//
//  FileHelper.m
//  Pods
//
//  Created by nucarf on 2020/8/19.
//

#import "FileHelper.h"
#import <UIKit/UIKit.h>

@implementation FileHelper

#pragma mark --  获取系统文件夹  --

/// 获取主目录文件夹
+ (NSString *)homeDir {
    return NSHomeDirectory();
}

/// 获取document 文件夹
+ (NSString *)documentsDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

/// 获取library 文件夹
+ (NSString *)libraryDir {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

///获取Libarary/Preferences文件夹
+ (NSString *)preferencesDir {
    NSString *libraryDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    return [libraryDir stringByAppendingPathComponent:@"Preferences"];
}

/// 获取缓存文件夹
+ (NSString *)cachesDir {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

///获取tmp文件夹
+ (NSString *)tmpDir {
    return NSTemporaryDirectory();
}

#pragma mark -- 文件夹判断操作 --

#pragma mark --  判断文件路径是否存在 --
/// 判断文件路径是否存在
/// @param path 路径
+ (BOOL)isExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

#pragma mark --  删除文件(夹)是否存在 --

/// 删除文件(夹)
/// @param path 路径
+ (BOOL)removeItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

#pragma mark -- 判断是否是文件夹  --
/// 判断是否是文件夹
/// @param path 路径
+ (BOOL)isDirectoryAtPath:(NSString *)path {
    return ([FileHelper attributeOfItemAtPath:path forKey:NSFileType error:nil] == NSFileTypeDirectory);
}

#pragma mark --  判断是否是空文件(夹) --
/// 判断是否是空文件(夹)
/// @param path 路径
+ (BOOL)isEmptyItemAtPath:(NSString *)path {
    return ([FileHelper isExistsAtPath:path] &&
            [[FileHelper sizeOfItemAtPath:path] intValue] == 0) ||
           ([FileHelper isDirectoryAtPath:path] &&
            [[FileHelper listFilesInDirectoryAtPath:path deep:NO] count] == 0);
}

#pragma mark --  判断是否是文件 --
/// 判断是否是文件
/// @param path 路径
+ (BOOL)isFileAtPath:(NSString *)path {
    return ([FileHelper attributeOfItemAtPath:path forKey:NSFileType error:nil] == NSFileTypeRegular);
}

#pragma mark --  判断是否可读 --
/// 判断是否可读
/// @param path 路径
+ (BOOL)isReadableItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isReadableFileAtPath:path];
}

#pragma mark --  判断是否可写 --
/// 判断是否可写
/// @param path 路径
+ (BOOL)isWritableItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isWritableFileAtPath:path];
}

#pragma mark --  判断是否可执行 --
/// 判断是否可执行
/// @param path 路径
+ (BOOL)isExecutableItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isExecutableFileAtPath:path];
}

#pragma mark --  文件夹操作 --

#pragma mark --  获取文件所在的文件夹 --
/// 获取文件所在的文件夹
/// @param path 文件路径
+ (NSString *)directoryAtPath:(NSString *)path {
    return [path stringByDeletingLastPathComponent];
}

#pragma mark --  创建文件夹 --
/// 创建文件夹
/// @param path 文件夹路线
+ (BOOL)createDirectoryAtPath:(NSString *)path {
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isSuccess = [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    return isSuccess;
}

#pragma mark --  创建文件夹 --
/// 创建文件
/// @param path 文件路径
/// @param overwrite 是否覆盖
+ (BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite {
    // 如果文件夹路径不存在，那么先创建文件夹
    NSString *directoryPath = [self directoryAtPath:path];
    if (![self isExistsAtPath:directoryPath]) {
        // 创建文件夹
        if (![self createDirectoryAtPath:directoryPath]) {
            return NO;
        }
    }
    // 如果文件存在，并不想覆盖，那么直接返回YES。
    if (!overwrite) {
        if ([self isExistsAtPath:path]) {
            return YES;
        }
    }
    BOOL isSuccess = [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];

    return isSuccess;
}

#pragma mark --  移动文件 --

/// 移动文件
/// @param path 被移动文件路径
/// @param toPath 要移动到的目标文件路径
/// @param overwrite 当要移动到的文件路径文件存在，会移动失败，这里传入是否覆盖
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite {
    // 先要保证源文件路径存在，不然抛出异常
    if (![self isExistsAtPath:path]) {
        [NSException raise:@"非法的源文件路径" format:@"源文件路径%@不存在，请检查源文件路径", path];
        return NO;
    }
    //获得目标文件的上级目录
    NSString *toDirPath = [self directoryAtPath:toPath];
    if (![self isExistsAtPath:toDirPath]) {
        // 创建移动路径
        if (![self createDirectoryAtPath:toDirPath]) {
            return NO;
        }
    }
    // 判断目标路径文件是否存在
    if ([self isExistsAtPath:toPath]) {
        //如果覆盖，删除目标路径文件
        if (overwrite) {
            //删掉目标路径文件
            [self removeItemAtPath:toPath];
        } else {
            //删掉被移动文件
            [self removeItemAtPath:path];
            return YES;
        }
    }
    // 移动文件，当要移动到的文件路径文件存在，会移动失败
    BOOL isSuccess = [[NSFileManager defaultManager] moveItemAtPath:path toPath:toPath error:nil];

    return isSuccess;
}

#pragma mark --  复制文件(夹) --

/// 复制文件(夹)
/// @param path 被复制文件路径
/// @param toPath 要复制到的目标文件路径
/// @param overwrite 当要复制到的文件路径文件存在，会复制失败，这里传入是否覆盖
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite {
    // 先要保证源文件路径存在，不然抛出异常
    if (![self isExistsAtPath:path]) {
        [NSException raise:@"非法的源文件路径" format:@"源文件路径%@不存在，请检查源文件路径", path];
        return NO;
    }
    //获得目标文件的上级目录
    NSString *toDirPath = [self directoryAtPath:toPath];
    if (![self isExistsAtPath:toDirPath]) {
        // 创建复制路径
        if (![self createDirectoryAtPath:toDirPath]) {
            return NO;
        }
    }
    // 如果覆盖，那么先删掉原文件
    if (overwrite) {
        if ([self isExistsAtPath:toPath]) {
            [self removeItemAtPath:toPath];
        }
    }
    // 复制文件，如果不覆盖且文件已存在则会复制失败
    BOOL isSuccess = [[NSFileManager defaultManager] copyItemAtPath:path toPath:toPath error:nil];

    return isSuccess;
}

#pragma mark --  按照文件路径向文件写入内容，内容可为数组、字典、NSData等等  --

/// 写入内容到文件
/// @param path 文件路径
/// @param content 内容
+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content {
    //判断文件内容是否为空
    if (!content) {
        [NSException raise:@"非法的文件内容" format:@"文件内容不能为nil"];
        return NO;
    }
    //判断文件(夹)是否存在
    if ([self isExistsAtPath:path]) {
        if ([content isKindOfClass:[NSMutableArray class]]) {//文件内容为可变数组
            [(NSMutableArray *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSArray class]]) {//文件内容为不可变数组
            [(NSArray *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSMutableData class]]) {//文件内容为可变NSMutableData
            [(NSMutableData *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSData class]]) {//文件内容为NSData
            [(NSData *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSMutableDictionary class]]) {//文件内容为可变字典
            [(NSMutableDictionary *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSDictionary class]]) {//文件内容为不可变字典
            [(NSDictionary *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSJSONSerialization class]]) {//文件内容为JSON类型
            [(NSDictionary *)content writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSMutableString class]]) {//文件内容为可变字符串
            [[((NSString *)content) dataUsingEncoding:NSUTF8StringEncoding] writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[NSString class]]) {//文件内容为不可变字符串
            [[((NSString *)content) dataUsingEncoding:NSUTF8StringEncoding] writeToFile:path atomically:YES];
        } else if ([content isKindOfClass:[UIImage class]]) {//文件内容为图片
            [UIImagePNGRepresentation((UIImage *)content) writeToFile:path atomically:YES];
        } else if ([content conformsToProtocol:@protocol(NSCoding)]) {//文件归档
            [NSKeyedArchiver archiveRootObject:content toFile:path];
        } else {
            [NSException raise:@"非法的文件内容" format:@"文件类型%@异常，无法被处理。", NSStringFromClass([content class])];

            return NO;
        }
    } else {
        return NO;
    }
    return YES;
}

#pragma mark --  根据URL获取文件名 --
/// 根据URL获取文件名
/// @param path 文件路径
/// @param suffix 是否需要后缀
+ (NSString *)fileNameAtPath:(NSString *)path suffix:(BOOL)suffix {
    NSString *fileName = [path lastPathComponent];
    if (!suffix) {
        fileName = [fileName stringByDeletingPathExtension];
    }
    return fileName;
}

#pragma mark --  根据文件路径获取文件扩展类型 --
/// 根据文件路径获取文件扩展类型
/// @param path 文件路径
+ (NSString *)suffixAtPath:(NSString *)path {
    return [path pathExtension];
}

#pragma mark --  遍历文件夹 --
/// 遍历文件夹
/// @param path 路径
/// @param deep 是否深遍历  浅遍历：返回当前目录下的所有文件和文件夹;  深遍历：返回当前目录下及子目录下的所有文件和文件夹
+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep {
    NSArray *listArr;
    NSError *error;
    NSFileManager *manager = [NSFileManager defaultManager];
    if (deep) {
        // 深遍历
        NSArray *deepArr = [manager subpathsOfDirectoryAtPath:path error:&error];
        if (!error) {
            listArr = deepArr;
        } else {
            listArr = nil;
        }
    } else {
        // 浅遍历
        NSArray *shallowArr = [manager contentsOfDirectoryAtPath:path error:&error];
        if (!error) {
            listArr = shallowArr;
        } else {
            listArr = nil;
        }
    }
    return listArr;
}

#pragma mark --  获取文件创建时间 --
/// 获取文件创建时间
/// @param path 文件路径
+ (NSDate *)creationDateOfItemAtPath:(NSString *)path {
    return (NSDate *)[self attributeOfItemAtPath:path forKey:NSFileCreationDate error:nil];
}

#pragma mark --  获取文件修改时间 --
/// 获取文件修改时间
/// @param path 文件路径
+ (NSDate *)modificationDateOfItemAtPath:(NSString *)path {
    return (NSDate *)[self attributeOfItemAtPath:path forKey:NSFileModificationDate error:nil];
}

#pragma mark 清空Cashes文件夹
/// 清空Cashes文件夹
+ (BOOL)clearCachesDirectory {
    NSArray *subFiles = [FileHelper listFilesInDirectoryAtPath:[FileHelper cachesDir] deep:YES];
    BOOL isSuccess = YES;

    for (NSString *file in subFiles) {
        NSString *absolutePath = [[FileHelper cachesDir] stringByAppendingPathComponent:file];
        isSuccess &= [FileHelper removeItemAtPath:absolutePath];
    }
    return isSuccess;
}

#pragma mark 清空temp文件夹
/// 清空temp文件夹
+ (BOOL)clearTmpDirectory {
    NSArray *subFiles = [FileHelper listFilesInDirectoryAtPath:[FileHelper tmpDir] deep:YES];
    BOOL isSuccess = YES;

    for (NSString *file in subFiles) {
        NSString *absolutePath = [[FileHelper tmpDir] stringByAppendingPathComponent:file];
        isSuccess &= [FileHelper removeItemAtPath:absolutePath];
    }
    return isSuccess;
}

#pragma mark --  获取文件或者文件夹的大小 --
/// 获取文件或者文件夹的大小
/// @param path 路径
+ (NSNumber *)sizeOfItemAtPath:(NSString *)path {
    return (NSNumber *)[self attributeOfItemAtPath:path forKey:NSFileSize error:nil];
}

/// 获取文件大小
/// @param path 路径
+ (NSNumber *)sizeOfDirectoryAtPath:(NSString *)path {
    if ([FileHelper isDirectoryAtPath:path]) {
        //深遍历文件夹
        NSArray *subPaths = [FileHelper listFilesInDirectoryAtPath:path deep:YES];
        NSEnumerator *contentsEnumurator = [subPaths objectEnumerator];

        NSString *file;
        unsigned long long int folderSize = 0;

        while (file = [contentsEnumurator nextObject]) {
            NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[path stringByAppendingPathComponent:file] error:nil];
            folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
        }
        return [NSNumber numberWithUnsignedLongLong:folderSize];
    }
    return nil;
}

+ (NSString *)sizeFormattedOfItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    //先获取NSNumber类型的大小
    NSNumber *size = [self sizeOfItemAtPath:path];
    if (size) {
        //将文件大小格式化为字节
        return [self sizeFormatted:size];
    }
    return nil;
}

/// 文件大小格式为字节
/// @param size 大小
+ (NSString *)sizeFormatted:(NSNumber *)size {
    /*
     NSByteCountFormatterCountStyle枚举
     *NSByteCountFormatterCountStyleFile 字节为单位，采用十进制的1000bytes = 1KB
     *NSByteCountFormatterCountStyleMemory 字节为单位，采用二进制的1024bytes = 1KB
     *NSByteCountFormatterCountStyleDecimal KB为单位，采用十进制的1000bytes = 1KB
     *NSByteCountFormatterCountStyleBinary KB为单位，采用二进制的1024bytes = 1KB
     */
    return [NSByteCountFormatter stringFromByteCount:[size unsignedLongLongValue] countStyle:NSByteCountFormatterCountStyleFile];
}

#pragma mark --  获取文件属性的集合 --
+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return [[NSFileManager defaultManager] attributesOfItemAtPath:path error:error];
}

+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError *__autoreleasing *)error {
    return [[FileHelper attributesOfItemAtPath:path error:error] objectForKey:key];
}

@end
