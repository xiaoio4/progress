//
//  ViewController.m
//  ProgressView
//
//  Created by liuxin on 15/3/6.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import "ViewController.h"
#import "CWProgressView.h"
#define kEdgeW 15

#define kScreemW [UIScreen mainScreen].bounds.size.width
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    CWProgressView *mainProgress = [[CWProgressView alloc] initWithFrame:CGRectMake(kEdgeW, 300, kScreemW-2*kEdgeW, 10)];
    mainProgress.backViewColor = UIColorFromRGB(0xEDEDED);
    mainProgress.proGressColor = UIColorFromRGB(0xEE0000);
    mainProgress.isAnimation = YES;
    mainProgress.progress = 80;
    [self.view addSubview:mainProgress];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
