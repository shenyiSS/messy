//
//  AnimationView.h
//  animationDemo
//
//  Created by shenyi on 2018/8/30.
//  Copyright © 2018年 shenyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationView : UIView

@property (nonatomic, assign) bool toggle;

- (void)startAnimation;
- (void)backAnimation;

@end
