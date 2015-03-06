//
//  CWProgressView.h
//  ProgressView
//
//  Created by liuxin on 15/3/6.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface CWProgressView : UIView
{
    NSTimer         *animationTimer;//定时器
    
}

@property (nonatomic, retain) UIColor *backViewColor;   //背景颜色
@property (nonatomic, retain) UIColor *proGressColor;   //进度条颜色
@property (nonatomic, assign) BOOL    isAnimation;      //是否有动画
@property (nonatomic, assign) float   progress;         //进度
@property (nonatomic, assign) float   currentProgress;  //动画进度

@end
