//
//  ViewController.m
//  XYJLaunchAdvertisingViewDemo
//
//  Created by muhlenXi on 16/9/7.
//  Copyright © 2016年 XiYinjun. All rights reserved.
//

#import "ViewController.h"
#import "XYJADWebViewController.h"
#import "XYJADDataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =  [UIColor greenColor];
    
    self.navigationItem.title = @"首页";
    
    //添加广告点击的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToADVC) name:pushToADNotiName object:nil];
}

- (void) pushToADVC
{
    //TODO 在这里处理广告事件响应
    NSLog(@"广告点击了");
    XYJADWebViewController * webVC = [[XYJADWebViewController alloc] init];
    webVC.url = [[NSUserDefaults standardUserDefaults] objectForKey:pushToADUrl];
    [self.navigationController pushViewController:webVC animated:YES];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
