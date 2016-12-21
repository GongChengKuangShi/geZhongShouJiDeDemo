//
//  JMCustomKeyBoardView.m
//  YaoYao
//
//  Created by JM Zhao on 2016/12/9.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import "JMCustomKeyBoardView.h"
#import "JMListEmojiView.h"
#import "JMButtomTabbarButton.h"
#import "JMEmojiModel.h"
#import "MJExtension.h"

@interface JMCustomKeyBoardView()<JMButtomTabbarButtonDelegate, JMListEmojiViewDelegate>
@property (nonatomic, strong) UIView *tabBarView;
@property (nonatomic, strong) UIView *showView;
@property (nonatomic, strong) JMListEmojiView *emojiView;
@end

@implementation JMCustomKeyBoardView

- (JMListEmojiView *)emojiView
{
    if (_emojiView == nil) {
        self.emojiView = [[JMListEmojiView alloc] init];
        self.emojiView.delegate = self;
        self.emojiView.emojis = [self setupEmojiWithName:@"emoji.plist"];
        
    }
    return _emojiView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 底部放按钮View
        JMButtomTabbarButton *tabBarView   = [[JMButtomTabbarButton alloc] init];
        tabBarView.delegate  = self;
        tabBarView.backgroundColor = JMColor(232, 233, 235);
        self.tabBarView      = tabBarView;
        [self addSubview:self.tabBarView];
        
        self.backgroundColor = JMColor(242, 243, 245);
    }
    return self;
}


#pragma mark -- TabBarDelegate 代理方法实现
- (void)emojitabBar:(JMCustomKeyBoardView *)tabBar didSelectBtn:(KeyBoardViewType)type
{
    // 首先移除上一个view
    [self.showView removeFromSuperview];
    [self addSubview:self.emojiView];
    
    // 最后一个就是正在展示的view赋值给showView
    self.showView = [self.subviews lastObject];
    
    // 会在恰当的时刻自动调用Layout方法重新计算子控件尺寸
    [self setNeedsLayout];
}

// 返回emoji数组
- (NSArray *)setupEmojiWithName:(NSString *)name
{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    return [JMEmojiModel mj_objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
}

- (void)layoutSubviews
{
    _tabBarView.x              = 0;
    _tabBarView.y              = self.height - 34;
    _tabBarView.width          = self.width;
    _tabBarView.height         = 34;
    
    // 放置表情的View
    self.showView.x      = self.y = 0;
    self.showView.width  = self.width;
    self.showView.height = _tabBarView.y;
    
}

#pragma mark -- JMListEmojiView
- (void)ListEmojiView:(NSDictionary *)dic
{
    // 运行代理
    if ([self.delegate respondsToSelector:@selector(jmCustomKeyBoard:)]) {
        
        [self.delegate jmCustomKeyBoard:dic];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
