//
//  ViewController.m
//  XJAVPlayer
//
//  Created by xj_love on 2016/10/27.
//  Copyright © 2016年 Xander. All rights reserved.
//

#import "ViewController.h"
#import "XjAVPlayerSDK.h"
#import "XJViewController.h"

@interface ViewController ()<XjAVPlayerSDKDelegate>{
    XjAVPlayerSDK *myPlayer;
}

@end

@implementation ViewController

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myPlayer = [[XjAVPlayerSDK alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.width/2)];
    myPlayer.xjPlayerUrl = @"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4";
    myPlayer.xjPlayerTitle = @"XJAVPlayer改良版";
    myPlayer.xjAutoOrient = YES;
    myPlayer.XjAVPlayerSDKDelegate = self;
    
    [self.view addSubview:myPlayer];
    
}

- (void)xjGoBack{
    NSLog(@"%f--->%f",myPlayer.xjCurrentTime,myPlayer.xjTotalTime);
    XJViewController *xj = [[XJViewController alloc] init];
    [myPlayer xjStopPlayer];
    [self presentViewController:xj animated:YES completion:nil];
}

- (void)xjNextPlayer{
    myPlayer.xjPlayerUrl = @"http://www.jxgbwlxy.gov.cn/tm/course/041629011/sco1/1.mp4";
    myPlayer.xjPlayerTitle = @"谢大大的自传";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
