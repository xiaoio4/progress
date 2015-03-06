//
//  CWProgressView.m
//  ProgressView
//
//  Created by liuxin on 15/3/6.
//  Copyright (c) 2015年 liuxin. All rights reserved.
//

#import "CWProgressView.h"

#define CORNERRADIUS 6.0f

@implementation CWProgressView


- (id)initWithFrame:(CGRect)frame
{
    self.backgroundColor = _backViewColor;
    self = [super initWithFrame:frame];
    if (self) {
        //圆角
        self.layer.cornerRadius = CORNERRADIUS;
        self.layer.masksToBounds = YES;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //进度条该变量
    CGFloat with = _currentProgress*self.frame.size.width/100;
    _currentProgress=_currentProgress<0.0?0.0:_currentProgress;
    _currentProgress=_currentProgress>100.0?100.0:_currentProgress;
    [_proGressColor set];
    //绘制进度条
    UIBezierPath *maskPath = [UIBezierPath bezierPath];
    maskPath.lineWidth = self.frame.size.width;
    maskPath.lineJoinStyle = kCGLineCapRound;
    [maskPath moveToPoint:CGPointMake(0, 0)];
    [maskPath addLineToPoint:CGPointMake(with, 0)];
    [maskPath stroke];
}


#pragma setter
- (void)setBackViewColor:(UIColor *)backViewColor
{
    _backViewColor = backViewColor;
    self.backgroundColor = _backViewColor;
}
- (void)setProGressColor:(UIColor *)proGressColor
{
    _proGressColor = proGressColor;
    
}
- (void)setIsAnimation:(BOOL)isAnimation
{
    _isAnimation = isAnimation;
    if (_isAnimation) {
    }
}
- (void)setProgress:(float)progress
{
    _progress = progress;
    if (_isAnimation) {
        if (animationTimer) {
            [animationTimer invalidate];
        }
        animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(incrementAnimatingProgress) userInfo:nil repeats:YES];
    }else{
        _currentProgress = progress;
    }
}

//用定时器累加进度 知道等于实际进度
- (void)incrementAnimatingProgress {
    if (_currentProgress >= _progress-0.4 && _currentProgress <= _progress+0.4) {
        _currentProgress = _progress;
        [animationTimer invalidate];
        [self setNeedsDisplay];
    } else {
        _currentProgress = (_currentProgress < _progress) ? _currentProgress + 0.4 : _currentProgress - 0.4;
        [self setNeedsDisplay];
    }
}


@end
