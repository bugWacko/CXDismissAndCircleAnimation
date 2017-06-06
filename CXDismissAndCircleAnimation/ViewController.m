//
//  ViewController.m
//  CXDismissAndCircleAnimation
//
//  Created by 陈晨昕 on 2017/6/5.
//  Copyright © 2017年 bugWacko. All rights reserved.
//

#import "ViewController.h"
#import "PresentVC.h"
#import "DismissAnimation.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>

@property (weak, nonatomic) PresentVC * presentVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)presentBtnAction:(UIButton *)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PresentVC *vc = [sb instantiateViewControllerWithIdentifier:@"PresentVC"];
    self.presentVC = vc;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    DismissAnimation* animation = [DismissAnimation new];
    animation.centerButton = self.presentVC.animationButton;
    return animation;
}


@end
