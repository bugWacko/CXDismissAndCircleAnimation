//
//  CXAnimationButton.m
//  CXDismissAndCircleAnimation
//
//  Created by 陈晨昕 on 2017/6/5.
//  Copyright © 2017年 bugWacko. All rights reserved.
//


#import "CXAnimationButton.h"
#import "CXCircleAnimationView.h"

static NSTimeInterval startDuration = 0.3;
static NSTimeInterval endDuration = 0.5;

@interface CXAnimationButton ()
@property (nonatomic, strong) CXCircleAnimationView* circleView;
@property (nonatomic, assign) CGRect origionRect;
@end

@implementation CXAnimationButton

-(CXCircleAnimationView *)circleView {

    if (!_circleView) {
        _circleView = [CXCircleAnimationView viewWithButton:self];
        [self addSubview:_circleView];
    }
    return _circleView;
}

+(instancetype)buttonWithFrame:(CGRect)frame{
    CXAnimationButton* button = [CXAnimationButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = frame;
    button.layer.cornerRadius = frame.size.height / 2;
    button.layer.masksToBounds = YES;
    button.clipsToBounds = NO;
    return button;
}

-(void)startAnimation {
    self.origionRect = self.frame;
    CGPoint center = self.center;
    CGFloat width = self.layer.cornerRadius * 2;
    CGFloat height = self.frame.size.height;
    CGRect desFrame = CGRectMake(center.x - width / 2, center.y - height / 2, width, height);
    
    self.userInteractionEnabled = NO;
    
    if ([self.delegate respondsToSelector:@selector(CXAnimationButtonDidStartAnimation:)]) {
        [self.delegate CXAnimationButtonDidStartAnimation:self];
    }
    
    [UIView animateWithDuration:startDuration animations:^{
        //self.titleLabel.alpha = 0.0f;
        self.frame = desFrame;
    } completion:^(BOOL finished) {
        [self.circleView startAnimation];
    }];
}

-(void)stopAnimation{
    self.userInteractionEnabled = YES;
    
    if ([self.delegate respondsToSelector:@selector(CXAnimationButtonWillFinishAnimation:)]) {
        [self.delegate CXAnimationButtonWillFinishAnimation:self];
    }
    
    [self.circleView removeFromSuperview];
    self.circleView = nil;
    [UIView animateWithDuration:endDuration animations:^{
        self.frame = self.origionRect;
        //self.titleLabel.alpha = 1.0f;
    } completion:^(BOOL finished) {
        if ([self.delegate respondsToSelector:@selector(CXAnimationButtonDidFinishAnimation:)]) {
            [self.delegate CXAnimationButtonDidFinishAnimation:self];
        }
    }];
    
}

@end
