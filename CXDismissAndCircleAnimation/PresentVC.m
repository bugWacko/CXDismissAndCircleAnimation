//
//  PresentVC.m
//  CXDismissAndCircleAnimation
//
//  Created by 陈晨昕 on 2017/6/5.
//  Copyright © 2017年 bugWacko. All rights reserved.
//

#import "PresentVC.h"

#define BackgroundColor [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1]

@interface PresentVC ()<CXAnimationButtonDelegate>

@end

@implementation PresentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.animationButton.layer setCornerRadius:self.animationButton.frame.size.height / 2];
    [self.animationButton.layer setMasksToBounds:YES];
    [self.animationButton setClipsToBounds:NO];
    [self.animationButton setBackgroundColor:BackgroundColor];
    self.animationButton.delegate = self;
}

#pragma mark - btn touch action
- (IBAction)animationBtnAction:(CXAnimationButton *)sender {
    
    //start animation
    [sender startAnimation];
    
    //add stop animation delay time
    [self performSelector:@selector(animationStopAction) withObject:self afterDelay:3];
}

-(void)animationStopAction {
    
    //stop animation
    [self.animationButton stopAnimation];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark CXAnimationButtonDelegate
-(void)CXAnimationButtonDidStartAnimation:(CXAnimationButton *)CXAnimationButton{
    NSLog(@"start");
}

-(void)CXAnimationButtonDidFinishAnimation:(CXAnimationButton *)CXAnimationButton{
    NSLog(@"stop");
}

-(void)CXAnimationButtonWillFinishAnimation:(CXAnimationButton *)CXAnimationButton{
    NSLog(@"will stop");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {

    NSLog(@"present dealloc");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
