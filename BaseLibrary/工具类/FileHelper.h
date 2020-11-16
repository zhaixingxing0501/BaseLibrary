//
//  FileHelper.h
//  Pods
//
//  Created by nucarf on 2020/8/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileHelper : NSObject

/// 获取主目录文件夹
+ (NSString *)homeDir;

/// 获取document 文件夹
+ (NSString *)documentsDir;

/// 获取library 文件夹
+ (NSString *)libraryDir;

///获取Libarary/Preferences文件夹
+ (NSString *)preferencesDir;

/// 获取缓存文件夹
+ (NSString *)cachesDir;

///获取tmp文件夹
+ (NSString *)tmpDir;

/// 判断文件路径是否存在
/// @param path 路径
+ (BOOL)isExistsAtPath:(NSString *)path;

/// 删除文件(夹)
/// @param path 路径
+ (BOOL)removeItemAtPath:(NSString *)path;

/// 判断是否是文件夹
/// @param path 路径
+ (BOOL)isDirectoryAtPath:(NSString *)path;

/// 判断是否是空文件(夹)
/// @param path 路径
+ (BOOL)isEmptyItemAtPath:(NSString *)path;

/// 判断是否是文件
/// @param path 路径
+ (BOOL)isFileAtPath:(NSString *)path;

/// 判断是否可读
/// @param path 路径
+ (BOOL)isReadableItemAtPath:(NSString *)path;

/// 判断是否可写
/// @param path 路径
+ (BOOL)isWritableItemAtPath:(NSString *)path;

/// 判断是否可执行
/// @param path 路径
+ (BOOL)isExecutableItemAtPath:(NSString *)path;

/// 获取文件所在的文件夹
/// @param path 文件路径
+ (NSString *)directoryAtPath:(NSString *)path;

/// 创建文件夹
/// @param path 文件夹路线
+ (BOOL)createDirectoryAtPath:(NSString *)path;

/// 创建文件
/// @param path 文件路径
/// @param overwrite 是否覆盖
+ (BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite;

/// 移动文件
/// @param path 被移动文件路径
/// @param toPath 要移动到的目标文件路径
/// @param overwrite 当要移动到的文件路径文件存在，会移动失败，这里传入是否覆盖
+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;

/// 复制文件(夹)
/// @param path 被复制文件路径
/// @param toPath 要复制到的目标文件路径
/// @param overwrite 当要复制到的文件路径文件存在，会复制失败，这里传入是否覆盖
+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite;

/// 写入内容到文件
/// @param path 文件路径
/// @param content 内容
+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content;

/// 根据URL获取文件名
/// @param path 文件路径
/// @param suffix 是否需要后缀
+ (NSString *)fileNameAtPath:(NSString *)path suffix:(BOOL)suffix;

/// 根据文件路径获取文件扩展类型
/// @param path 文件路径
+ (NSString *)suffixAtPath:(NSString *)path;

/// 遍历文件夹
/// @param path 路径
/// @param deep 是否深遍历  浅遍历：返回当前目录下的所有文件和文件夹;  深遍历：返回当前目录下及子目录下的所有文件和文件夹
+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep;

/// 获取文件创建时间
/// @param path 文件路径
+ (NSDate *)creationDateOfItemAtPath:(NSString *)path;

/// 获取文件修改时间
/// @param path 文件路径
+ (NSDate *)modificationDateOfItemAtPath:(NSString *)path;

/// 清空Cashes文件夹
+ (BOOL)clearCachesDirectory;

/// 清空temp文件夹
+ (BOOL)clearTmpDirectory;

/// 获取文件或者文件夹的大小
/// @param path 路径
+ (NSNumber *)sizeOfItemAtPath:(NSString *)path;

/// 获取文件大小
/// @param path 路径
+ (NSNumber *)sizeOfDirectoryAtPath:(NSString *)path;

+ (NSString *)sizeFormattedOfItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error;

/// 文件大小格式为字节
/// @param size 大小
+ (NSString *)sizeFormatted:(NSNumber *)size;

#pragma mark --  获取文件属性的集合 --
+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error;

+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
