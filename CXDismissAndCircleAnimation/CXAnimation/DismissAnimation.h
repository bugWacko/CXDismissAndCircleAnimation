//
//  DismissAnimation.h
//  zhyProject
//
//  Created by 陈晨昕 on 2017/2/9.
//  Copyright © 2017年 陈晨昕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface DismissAnimation : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, strong) UIButton* centerButton;

@end
