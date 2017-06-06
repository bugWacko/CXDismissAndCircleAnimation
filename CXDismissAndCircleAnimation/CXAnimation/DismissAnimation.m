//
//  DismissAnimation.m
//  zhyProject
//
//  Created by 陈晨昕 on 2017/2/9.
//  Copyright © 2017年 陈晨昕. All rights reserved.
//

#import "DismissAnimation.h"

#define BackgroundColor [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1]

@interface DismissAnimation ()<CAAnimationDelegate>
@property (nonatomic, strong)id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation DismissAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    UIViewController * toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * contentView = [self.transitionContext containerView];
    
    CGPoint point = self.centerButton.center;
    UIBezierPath* origionPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(point.x , point.y, 0, 0)];
    
    CGFloat X = [UIScreen mainScreen].bounds.size.width - point.x;
    CGFloat Y = point.y;
    CGFloat radius = sqrtf(X * X + Y * Y);
    UIBezierPath* finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(point.x , point.y, 0, 0), -radius, -radius)];
    
    CAShapeLayer* layer = [CAShapeLayer layer];
    layer.path = finalPath.CGPath;
    toViewController.view.layer.mask = layer;
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.delegate = self;
    animation.fromValue = (__bridge id _Nullable)(origionPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
    animation.duration = 0.4;
    [layer addAnimation:animation forKey:@"path"];
    
    [contentView addSubview:toViewController.view];
    
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = BackgroundColor;
    view.frame = toViewController.view.bounds;
    [toViewController.view addSubview:view];
    
    [UIView animateWithDuration:0.5 animations:^{
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.transitionContext completeTransition:YES];
}

@end
