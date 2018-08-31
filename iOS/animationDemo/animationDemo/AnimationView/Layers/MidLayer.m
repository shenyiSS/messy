//
//  MidLayer.m
//  animationDemo
//
//  Created by shenyi on 2018/8/30.
//  Copyright © 2018年 shenyi. All rights reserved.
//

#import "MidLayer.h"
#import <UIKit/UIKit.h>

@interface MidLayer ()

@property (nonatomic, strong) UIBezierPath *circlePath;
@property (nonatomic, strong) UIBezierPath *linePath;

@end

@implementation MidLayer
#pragma mark - initialization
- (instancetype)init {
    self = [super init];
    if (self) {
        self.fillColor = [UIColor clearColor].CGColor;
        self.strokeColor = [UIColor redColor].CGColor;
        self.lineWidth = 10.0;
        self.lineCap = @"round";
        self.path = self.circlePath.CGPath;
        self.strokeEnd = 0;
    }
    return self;
}

#pragma mark - animation
- (void)midAnimation {
    [self circleAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self lineAnimation];
    });
}

- (void)midAnimationBack {
    [self lineAnimationBack];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self circleAnimationBack];
    });
}

- (void)circleAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    animation.beginTime = 0.0;
    animation.duration = 0.25;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self addAnimation:animation forKey:nil];
}

- (void)lineAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = @(0.0);
    animation.toValue = @(0.84);
    animation.duration = 0.25;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self addAnimation:animation forKey:nil];
}

- (void)circleAnimationBack {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(1.0);
    animation.toValue = @(0.0);
    animation.beginTime = 0.0;
    animation.duration = 0.25;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self addAnimation:animation forKey:nil];
}

- (void)lineAnimationBack {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = @(0.84);
    animation.toValue = @(0.0);
    animation.duration = 0.25;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self addAnimation:animation forKey:nil];
}

#pragma mark - setter & getter
- (UIBezierPath *)circlePath {
    if (!_circlePath) {
        _circlePath = [UIBezierPath bezierPath];
        [_circlePath moveToPoint:CGPointMake(100, 0)];
        [_circlePath addArcWithCenter:CGPointMake(100, 100) radius:100 startAngle:-M_PI_2 endAngle:-M_PI_2/4 clockwise:YES];
        [_circlePath addArcWithCenter:CGPointMake(150, 50) radius:50 startAngle:M_PI_4/2 endAngle:M_PI_2 clockwise:YES];
        [_circlePath addLineToPoint:CGPointMake(80, 100)];
    }
    return _circlePath;
}

- (UIBezierPath *)linePath {
    if (!_linePath) {
        _linePath = [[UIBezierPath alloc] init];
        [_linePath moveToPoint:CGPointMake(80, 100)];
        [_linePath addLineToPoint:CGPointMake(120, 100)];
    }
    return _linePath;
}

@end
