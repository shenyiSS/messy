//
//  AnimationView.m
//  animationDemo
//
//  Created by shenyi on 2018/8/30.
//  Copyright © 2018年 shenyi. All rights reserved.
//

#import "AnimationView.h"
#import "TopLayer.h"
#import "BottomLayer.h"
#import "MidLayer.h"
#import "CircleLayer.h"

@interface AnimationView ()

@property (nonatomic, strong) TopLayer *topLayer;
@property (nonatomic, strong) BottomLayer *bottomLayer;
@property (nonatomic, strong) MidLayer *midLayer;
@property (nonatomic, strong) CircleLayer *circleLayer;

@end

@implementation AnimationView
#pragma mark - initialization
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.toggle = YES;
        [self addLayers];
    }
    return self;
}

- (void)addLayers {
    [self.layer addSublayer:self.topLayer];
    [self.layer addSublayer:self.bottomLayer];
    [self.layer addSublayer:self.midLayer];
    [self.layer addSublayer:self.circleLayer];
}

#pragma mark - animation
- (void)startAnimation {
    [self.circleLayer shrinkAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.midLayer midAnimation];
    });
    [self.topLayer topAnimation];
    [self.bottomLayer bottomAnimation];
}

- (void)backAnimation {
    [self.midLayer midAnimationBack];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.circleLayer shrinkAnimationBack];
    });
    [self.topLayer topAnimationBack];
    [self.bottomLayer bottomAnimationBack];
}

#pragma mark - setter & getter
- (TopLayer *)topLayer {
    if (!_topLayer) {
        _topLayer = [[TopLayer alloc] init];
    }
    return _topLayer;
}

- (BottomLayer *)bottomLayer {
    if (!_bottomLayer) {
        _bottomLayer = [[BottomLayer alloc] init];
    }
    return _bottomLayer;
}

- (MidLayer *)midLayer {
    if (!_midLayer) {
        _midLayer = [[MidLayer alloc] init];
    }
    return _midLayer;
}

- (CircleLayer *)circleLayer {
    if (!_circleLayer) {
        _circleLayer = [[CircleLayer alloc] init];
    }
    return _circleLayer;
}

@end
