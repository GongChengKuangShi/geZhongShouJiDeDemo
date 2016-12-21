//
//  XYJADWebViewController.m
//  muhlenXi
//
//  Created by muhlenXi on 16/9/7.
//  Copyright © 2016年 snail. All rights reserved.
//

#import "XYJADWebViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenBounds [UIScreen mainScreen].bounds

@interface XYJADWebViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView * webView;


@end

@implementation XYJADWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(GoBackAction)];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.webView.delegate = self;
    
    [self.view addSubview:self.webView];
    
    NSURL * url = [NSURL URLWithString:_url];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}

//返回
- (void) GoBackAction
{
    if ([self.webView canGoBack])
    {
        [self.webView goBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"网页加载完成");
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
