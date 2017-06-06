//
//  CXAnimationButton.h
//  CXDismissAndCircleAnimation
//
//  Created by 陈晨昕 on 2017/6/5.
//  Copyright © 2017年 bugWacko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CXAnimationButtonDelegate;
@interface CXAnimationButton : UIButton

/**
 *  代理对象
 */
@property (weak, nonatomic) id<CXAnimationButtonDelegate>delegate;

/**
 *  创建对象
 *
 *  @return 对象
 */
+(instancetype)buttonWithFrame:(CGRect)frame;

/**
 *  手动调用执行动画  一般在 button 的响应里调用  调用后会走代理进行回调
 */
-(void)startAnimation;

/**
 *  手动停止动画 停止前和停止后会走代理回调
 */
-(void)stopAnimation;

@end

@protocol CXAnimationButtonDelegate <NSObject>
/**
 *  动画开始回调
 *
 *  @param CXAnimationButton self
 */
-(void)CXAnimationButtonDidStartAnimation:(CXAnimationButton *)CXAnimationButton;

/**
 *  动画已经结束时回调
 *
 *  @param CXAnimationButton self
 */
-(void)CXAnimationButtonDidFinishAnimation:(CXAnimationButton *)CXAnimationButton;

/**
 *  动画将要结束时回调  即 结束动画未执行时
 *
 *  @param CXAnimationButton self
 */
-(void)CXAnimationButtonWillFinishAnimation:(CXAnimationButton *)CXAnimationButton;

@end
