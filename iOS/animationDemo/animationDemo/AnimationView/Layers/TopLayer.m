//
//  TopLayer.m
//  animationDemo
//
//  Created by shenyi on 2018/8/30.
//  Copyright © 2018年 shenyi. All rights reserved.
//

#import "TopLayer.h"
#import <UIKit/UIKit.h>

@interface TopLayer ()

@property (nonatomic, strong) UIBezierPath *beginPath;
@property (nonatomic, strong) UIBezierPath *endPath;

@end

@implementation TopLayer

#pragma mark - initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fillColor = [UIColor clearColor].CGColor;
        self.strokeColor = [UIColor redColor].CGColor;
        self.lineWidth = 10.0;
        self.lineCap = @"round";
        self.path = self.beginPath.CGPath;
    }
    return self;
}

#pragma mark - animation
- (void)topAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(self.beginPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(self.endPath.CGPath);
    animation.beginTime = 0.0;
    animation.duration = 0.5;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self addAnimation:animation forKey:nil];
}

- (void)topAnimationBack {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(self.endPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(self.beginPath.CGPath);
    animation.beginTime = 0.0;
    animation.duration = 0.5;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self addAnimation:animation forKey:nil];
}

#pragma mark - setter & getter
- (UIBezierPath *)beginPath {
    if (!_beginPath) {
        _beginPath = [UIBezierPath bezierPath];
        [_beginPath moveToPoint:CGPointMake(80, 120)];
        [_beginPath addLineToPoint:CGPointMake(120, 80)];
    }
    return _beginPath;
}

- (UIBezierPath *)endPath {
    if (!_endPath) {
        _endPath = [UIBezierPath bezierPath];
        [_endPath moveToPoint:CGPointMake(80, 80)];
        [_endPath addLineToPoint:CGPointMake(120, 80)];
    }
    return _endPath;
}

@end
