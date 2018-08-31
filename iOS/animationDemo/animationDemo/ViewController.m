//
//  ViewController.m
//  animationDemo
//
//  Created by shenyi on 2018/8/30.
//  Copyright © 2018年 shenyi. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"

@interface ViewController ()

@property (nonatomic, strong) AnimationView *animaitonView;

@end

@implementation ViewController

/*
 待优化
 1. 时间的管理，统一尺度
 2. 状态的管理，通过状态显示动画
 3. 动画函数的抽取
 4. 动画的弹性
 5. 弧度的优化
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    [self animaitonView];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.animaitonView.toggle) {
        [self.animaitonView startAnimation];
    }
    else {
        [self.animaitonView backAnimation];
    }
    self.animaitonView.toggle = !self.animaitonView.toggle;
}

- (AnimationView *)animaitonView {
    if (!_animaitonView) {
        _animaitonView = [[AnimationView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        [self.view addSubview:_animaitonView];
        _animaitonView.center = self.view.center;
    }
    return _animaitonView;
}

@end
