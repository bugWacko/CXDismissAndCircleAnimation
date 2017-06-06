//
//  CXCircleAnimationView.h
//  CXDismissAndCircleAnimation
//
//  Created by 陈晨昕 on 2017/6/5.
//  Copyright © 2017年 bugWacko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXCircleAnimationView : UIView

/**
 * 初始化
 */
+(instancetype)viewWithButton:(UIButton *)button;

/**
 * 开始动画
 */
-(void)startAnimation;

@end
