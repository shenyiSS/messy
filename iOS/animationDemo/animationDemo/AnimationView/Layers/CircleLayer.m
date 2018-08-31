//
//  CircleLayer.m
//  animationDemo
//
//  Created by shenyi on 2018/8/30.
//  Copyright © 2018年 shenyi. All rights reserved.
//

#import "CircleLayer.h"

@interface CircleLayer ()

@property (nonatomic, strong) UIBezierPath *circleBigPath;
@property (nonatomic, strong) UIBezierPath *circleSmallPath;

@property (nonatomic, strong) CAShapeLayer *halfCircleLayer;
@property (nonatomic, strong) CAShapeLayer *midLayer;

@end

@implementation CircleLayer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.fillColor = [UIColor clearColor].CGColor;
        self.strokeColor = [UIColor redColor].CGColor;
        self.lineWidth = 10;
        self.lineCap = @"round";
        self.path = self.circleBigPath.CGPath;
    }
    return self;
}

- (void)shrinkAnimation {
    CABasicAnimation *shrinkanimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    shrinkanimation.fromValue = @(1.0);
    shrinkanimation.toValue = @(0.0);
    shrinkanimation.beginTime = 0.0;
    shrinkanimation.duration = 0.5;
    shrinkanimation.removedOnCompletion = NO;
    shrinkanimation.fillMode = kCAFillModeForwards;
    
    [self addAnimation:shrinkanimation forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.lineCap = @"butt";
    });
}

- (void)shrinkAnimationBack {
    self.lineCap = @"round";

    CABasicAnimation *shrinkanimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    shrinkanimation.fromValue = @(0.0);
    shrinkanimation.toValue = @(1.0);
    shrinkanimation.beginTime = 0.0;
    shrinkanimation.duration = 0.5;
    shrinkanimation.removedOnCompletion = NO;
    shrinkanimation.fillMode = kCAFillModeForwards;
    
    [self addAnimation:shrinkanimation forKey:nil];
}

- (UIBezierPath *)circleBigPath {
    if (!_circleBigPath) {
        _circleBigPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:100 startAngle:3*M_PI_2 endAngle:-M_PI_2 clockwise:NO];
    }
    return _circleBigPath;
}

@end
