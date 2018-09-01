//
//  WPPrintLogFile.h
//  WPPrintLogFileDemo
//
//  Created by liwenhao on 2017/9/30.
//  Copyright © 2017年 liwenhaopro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPPrintLogFile : NSObject

#pragma mark - 只在debug下生效
/**
 日志写入到沙盒cache file, 同时打印到控制台
 @param fileName 日志文件名
 @param log 日志
 */
void WPPrintFileLog(NSString *fileName, NSString *log,...);

/**
 日志写入到沙盒cache file, 不打印到控制台
 @param fileName 日志文件名
 @param log 日志
 */
void WPPrintFileLog1(NSString *fileName, NSString *log,...);


#pragma mark -  release和debug 模式下同时生效
/**
 日志写入到沙盒cache file, 并打印到控制台
 @param fileName 日志文件名
 @param log 日志
 */
void WPReleasePrintFileLog(NSString *fileName, NSString *log,...);
@end
