//
//  WPWriteToFile.m
//  WPPrintLogFileDemo
//
//  Created by liwenhao on 2017/9/30.
//  Copyright © 2017年 liwenhaopro. All rights reserved.
//

#import "WPWriteToFile.h"

@implementation WPWriteToFile

#pragma mark - public
+ (void)printLog:(id)content filename:(NSString *)fileName
{
    NSString *_logfolderPath = [NSString stringWithFormat:@"%@/WPLog", [[self class] LibraryCachesPath]];
    if(!fileName ||!fileName.length ){
        fileName = [NSString stringWithFormat:@"%@",[self currentDate]];
    }
    if(![[NSFileManager defaultManager] fileExistsAtPath:_logfolderPath]){
        [[NSFileManager defaultManager] createDirectoryAtPath:_logfolderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    fileName = [NSString stringWithFormat:@"%@.txt",fileName];
    NSString *_logfilePath = [_logfolderPath stringByAppendingPathComponent:fileName];
    if(![[NSFileManager defaultManager] fileExistsAtPath:_logfilePath]){
        [[NSFileManager defaultManager] createFileAtPath:_logfilePath contents:nil attributes:nil];
    }
    content = [NSString stringWithFormat:@"[%@] %@\r\n\r\n",[self currentDate],content];
    NSFileHandle * fileHandle = [NSFileHandle fileHandleForWritingAtPath:_logfilePath];
    if(fileHandle == nil){
        return;
    }
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile];
}

#pragma mark - pravite
+ (NSString *)currentDate
{
    NSDate *currentDate = [NSDate date];
    static NSDateFormatter *formatter;
    if (formatter == nil) {
        formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    }
    NSString *dateStr = [formatter stringFromDate:currentDate];
    return dateStr;
}

+(NSString *)documentPath
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *document = [searchPaths objectAtIndex: 0];
    return document;
}

+ (NSString *)LibraryPath
{
    return [NSHomeDirectory()stringByAppendingPathComponent:@"Library/"];
}

+ (NSString *)LibraryCachesPath
{
    return [NSHomeDirectory()stringByAppendingPathComponent:@"Library/AAALog/"];
}
@end
