//
//  XJViewController.m
//  XJAVPlayer
//
//  Created by xj_love on 2016/10/31.
//  Copyright © 2016年 Xander. All rights reserved.
//

#import "XJViewController.h"

@interface XJViewController ()

@end

@implementation XJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 100, 200, 300);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"第二个界面" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:20]];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
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
