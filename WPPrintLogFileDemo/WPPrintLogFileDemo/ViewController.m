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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger count = 1;
    NSInteger indexx = 1;
    for (NSInteger index = 0; index < 100 ; index ++) {
        WPPrintFileLog(@"shabi",@"asdas,count = %d,index = %d",++count,--indexx);
    }
}


@end
