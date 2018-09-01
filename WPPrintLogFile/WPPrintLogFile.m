//
//  WPPrintLogFile.m
//  WPPrintLogFileDemo
//
//  Created by liwenhao on 2017/9/30.
//  Copyright © 2017年 liwenhaopro. All rights reserved.
//

#import "WPPrintLogFile.h"
#import "WPWriteToFile.h"

@implementation WPPrintLogFile

#pragma mark - 只在debug下生效
void WPPrintFileLog(NSString *fileName, NSString *log,...)
{
#ifndef DEBUG
    return ;
#endif
    va_list argList;
    va_start(argList, log);
    NSString *message = [(NSString *)[NSString alloc] initWithFormat:log arguments:argList];
    
    NSLog(@"%@",message);
    va_end(argList);
    if (!fileName || !fileName.length) {
        return;
    }
    dispatch_queue_t serialQueue = creatQueue();
    dispatch_async(serialQueue, ^{
        [WPWriteToFile printLog:message filename:fileName];
    });
}

/**
 日志写入到沙盒cache file, 不打印到控制台
 @param fileName 日志文件名
 @param log 日志
 */
void WPPrintFileLog1(NSString *fileName, NSString *log,...)
{
#ifndef DEBUG
    return ;
#endif
    va_list argList;
    va_start(argList, log);
    NSString *message = [(NSString *)[NSString alloc] initWithFormat:log arguments:argList];
    va_end(argList);
    if (!fileName || !fileName.length) {
        return;
    }
    dispatch_queue_t serialQueue = creatQueue();
    dispatch_async(serialQueue, ^{
        [WPWriteToFile printLog:message filename:fileName];
    });
}

#pragma mark -  release和debug 模式下同时生效
/**
 日志写入到沙盒cache file, 并打印到控制台
 @param fileName 日志文件名
 @param log 日志
 */
void WPReleasePrintFileLog(NSString *fileName, NSString *log,...)
{
    va_list argList;
    va_start(argList, log);
    NSString *message = [(NSString *)[NSString alloc] initWithFormat:log arguments:argList];
    
    NSLog(@"%@",message);
    va_end(argList);
    if (!fileName || !fileName.length) {
        return;
    }
    dispatch_queue_t serialQueue = creatQueue();
    dispatch_async(serialQueue, ^{
        [WPWriteToFile printLog:message filename:fileName];
    });
}

#pragma mark - queue
dispatch_queue_t creatQueue()
{
    static dispatch_once_t onceToken;
    static dispatch_queue_t serialQueue;
    dispatch_once(&onceToken, ^{
        serialQueue = dispatch_queue_create("WPPrintLogToFieQueue", DISPATCH_QUEUE_SERIAL);
    });
    return serialQueue;
}
@end
