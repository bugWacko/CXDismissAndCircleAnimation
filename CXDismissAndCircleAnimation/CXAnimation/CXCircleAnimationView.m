//
//  CXCircleAnimationView.m
//  CXDismissAndCircleAnimation
//
//  Created by 陈晨昕 on 2017/6/5.
//  Copyright © 2017年 bugWacko. All rights reserved.
//

#import "CXCircleAnimationView.h"

@interface CXCircleAnimationView ()
@property (nonatomic, strong) UIColor * borderColor;
@property (nonatomic, assign) CGFloat timeFlag;
@property (nonatomic, strong) NSTimer * timer;

@end

@implementation CXCircleAnimationView

+(instancetype)viewWithButton:(UIButton *)button {

    CXCircleAnimationView* animationView = [[CXCircleAnimationView alloc] init];
    
    animationView.frame = CGRectMake(-8, -8, button.frame.size.width + 16, button.frame.size.height + 16);
    
    animationView.backgroundColor = [UIColor clearColor];
    animationView.borderColor = [UIColor blackColor];
    animationView.timeFlag = 0;
    
    return animationView;
}

-(void)startAnimation {

    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(continueAnimation) userInfo:nil repeats:YES];
    [self.timer fire];
}

-(void)continueAnimation{
    self.timeFlag += 0.02;
    
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect {
    
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius = rect.size.width / 2 - 2;
    CGFloat start = - M_PI_2 + self.timeFlag * 2 * M_PI;
    CGFloat end = -M_PI_2 + 0.45 * 2 * M_PI  + self.timeFlag * 2 *M_PI;
    
    [path addArcWithCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    
    [self.borderColor setStroke];
    path.lineWidth = 1.5;
    
    [path stroke];
}

-(void)removeFromSuperview {
    [self.timer invalidate];
    [super removeFromSuperview];
}

@end
