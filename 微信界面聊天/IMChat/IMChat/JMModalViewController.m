//
//  JMModalViewController.m
//  YaoYao
//
//  Created by JM Zhao on 2016/11/2.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import "JMModalViewController.h"

@interface JMModalViewController ()
@property (nonatomic, weak) UILabel *label;
@end

@implementation JMModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
    UIButton *left = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [left setImage:[[UIImage imageWithRenderingName:@"cancle"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] forState:(UIControlStateNormal)];
    left.frame = CGRectMake(10, rectStatus.size.height+5, 50, 30);
    [left addTarget:self action:@selector(backActionLeft:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:left];
    self.left = left;
//    self.left.backgroundColor = [UIColor greenColor];
    UIButton *right = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [right setImage:[[UIImage imageWithRenderingName:@"add"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] forState:(UIControlStateNormal)];
    right.frame = CGRectMake(self.view.bounds.size.width-60, rectStatus.size.height+5, 50, 30);
    [right addTarget:self action:@selector(backActionRight:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:right];
    self.right = right;
}

- (void)backActionLeft:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)backActionRight:(UIButton *)sender {
    
    
}

- (void)setTitles:(NSString *)titles
{
    _titles = titles;
    if (self.label == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.left.frame), CGRectGetMinY(self.left.frame), self.view.width-CGRectGetMaxX(self.left.frame)*2, 30)];
        label.font = [UIFont systemFontOfSize:14.0];
        label.text = titles;
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        self.label = label;
    }else{
        
        self.label.text = titles;
    }
}

- (void)setLeftImage:(NSString *)leftImage
{
    _leftImage = leftImage;
    [self.left setImage:[[UIImage imageNamed:leftImage] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] forState:(UIControlStateNormal)];
    [self.left setTitle:nil forState:(UIControlStateNormal)];
}

- (void)setLeftTitle:(NSString *)leftTitle
{
    _leftTitle = leftTitle;
    [self.left setImage:nil forState:(UIControlStateNormal)];
    [self.left setTitle:leftTitle forState:(UIControlStateNormal)];
}

- (void)setRightImage:(NSString *)rightImage
{
    _rightImage = rightImage;
    [self.right setImage:[[UIImage imageNamed:rightImage] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] forState:(UIControlStateNormal)];
    [self.right setTitle:nil forState:(UIControlStateNormal)];
}

- (void)setRightTitle:(NSString *)rightTitle
{
    _rightTitle = rightTitle;
    [self.right setImage:nil forState:(UIControlStateNormal)];
    [self.right setTitle:rightTitle forState:(UIControlStateNormal)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
