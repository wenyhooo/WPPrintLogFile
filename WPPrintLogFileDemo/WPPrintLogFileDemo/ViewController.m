//
//  ViewController.m
//  WPPrintLogFileDemo
//
//  Created by liwenhao on 2017/9/30.
//  Copyright © 2017年 liwenhaopro. All rights reserved.
//

#import "ViewController.h"
#import "WPWriteToFile.h"
#import "WPPrintLogFile.h"
#ifdef DEBUG
#import <WPSandBoxPreviewTool/WPSandBoxPreviewTool.h>
#endif

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)printLogAction:(id)sender
{
    for (NSInteger index = 0; index < 100 ; index ++) {
        WPPrintFileLog(@"自定义Log文件",@"哈哈哈哈emoji有点卡,count = %d,index = %d",index,index-100);
    }
}
- (IBAction)lookLogAction:(id)sender 
{
#ifdef DEBUG
    [[WPSandBoxPreviewTool sharedTool] setOpenLog:YES];
    [[WPSandBoxPreviewTool sharedTool] autoOpenCloseApplicationDiskDirectoryPanel];
#endif
}


@end
