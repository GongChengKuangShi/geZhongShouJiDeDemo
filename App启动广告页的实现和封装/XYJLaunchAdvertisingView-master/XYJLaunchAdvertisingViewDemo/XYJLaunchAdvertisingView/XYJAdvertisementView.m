//
//  XYJAdvertisementView.m
//  muhlenXi
//
//  Created by muhlenXi on 16/9/7.
//  Copyright © 2016年 snail. All rights reserved.
//

#import "XYJAdvertisementView.h"

@interface XYJAdvertisementView ()

@property (nonatomic,strong) UIImageView * adImageView;
@property (nonatomic,strong) UIButton * countBtn;  //倒计时
@property (nonatomic,strong) NSTimer  * countTimer;
@property (nonatomic,assign) NSInteger  count;  //记录当前的秒数

@end

@implementation XYJAdvertisementView

- (void)setFilePath:(NSString *)filePath
{
    _filePath = filePath;
    _adImageView.image = [UIImage imageWithContentsOfFile:filePath];
}
- (void)showAD
{
    [self startTimer];
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    [window addSubview:self];
    
}

- (void) startTimer
{
    _count = adTime;
    [[NSRunLoop mainRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}
#pragma mark - 初始化方法

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //其他控件的初始化写在这里
        
        //1.广告图片
        _adImageView = [[UIImageView alloc] initWithFrame:frame];
        _adImageView.userInteractionEnabled = YES;
        _adImageView.backgroundColor =  [UIColor yellowColor];
        
        _adImageView.contentMode = UIViewContentModeScaleAspectFill;
        _adImageView.clipsToBounds = YES;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesHandle:)];
        [_adImageView addGestureRecognizer:tap];
        
        //2.跳过按钮
        CGFloat btnW = 60.0f;
        CGFloat btnH = 30.0f;
        _countBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-btnW-24, btnH, btnW, btnH)];
        [_countBtn addTarget:self action:@selector(dismissAD) forControlEvents:UIControlEventTouchUpInside];
        _countBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_countBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_countBtn setTitle:[NSString stringWithFormat:@"跳过%ld",adTime] forState:UIControlStateNormal];
        _countBtn.backgroundColor = [UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:0.6];
        _countBtn.layer.cornerRadius = 4;
        
        [self addSubview:_adImageView];
        [self addSubview:_countBtn];
       
    }
    return self;
}

#pragma mark - 懒加载

- (NSTimer *)countTimer
{
    if (_countTimer == nil) {
        
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDownEventHandle) userInfo:nil repeats:YES];
    }
    return _countTimer;
}

#pragma mark - 事件响应

//广告界面点击
- (void) tapGesHandle:(UITapGestureRecognizer *) tap
{
    [self dismissAD];
    
   [[NSNotificationCenter defaultCenter] postNotificationName:pushToADNotiName object:nil userInfo:nil];
}
//定时器响应
- (void) countDownEventHandle
{
    _count--;
    [_countBtn setTitle:[NSString stringWithFormat:@"跳过%ld",_count] forState:UIControlStateNormal];
    if (_count == 0) {
        
        [self dismissAD];
    }
}
//跳过按钮触发
- (void) dismissAD
{
    [self.countTimer invalidate];
    self.countTimer = nil;
    
    [UIView animateWithDuration:0.3 animations:^{
       
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

@end
