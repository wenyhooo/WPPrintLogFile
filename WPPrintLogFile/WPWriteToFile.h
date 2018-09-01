//
//  WPWriteToFile.h
//  WPPrintLogFileDemo
//
//  Created by liwenhao on 2017/9/30.
//  Copyright © 2017年 liwenhaopro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPWriteToFile : NSObject

+ (void)printLog:(id)content filename:(NSString *)fileName;

+ (NSString *)documentPath;

+ (NSString *)LibraryPath;

+ (NSString *)LibraryCachesPath;

+ (NSString *)currentDate;

@end
