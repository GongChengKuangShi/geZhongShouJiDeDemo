//
//  JMChatRectModel.m
//  YaoYao
//
//  Created by JM Zhao on 2016/11/3.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import "JMChatRectModel.h"
#import "JMChatModel.h"
#define czBtnFontSize [UIFont systemFontOfSize:15.0f]
#define CZTextPadding 20
#define JMMargin 10

@implementation JMChatRectModel

- (void)setMessage:(JMChatModel *)message
{
    _message = message;
    
    // 1> 设置时间
    _timeF = CGRectMake(0, 0, kW, 10);
    
    // 2> 设置头像
    CGFloat iconX = 0;
    if (message.messageFrom==MessageFromMe) {iconX = kW-44-JMMargin;}
    else{iconX = JMMargin;}
    _iconF = CGRectMake(iconX, CGRectGetMaxY(_timeF), 44, 44);
    
    [self contentFrame:message.msgContent msgFrom:message.messageFrom];
    
    // 3> 设置cell高度
    CGFloat iconMaxY = CGRectGetMaxY(_iconF)+5;
    CGFloat textMaxY = CGRectGetMaxY(_textF)+5;
    _cellHeight = MAX(iconMaxY, textMaxY);
}

- (void)contentFrame:(NSString *)content msgFrom:(MessageFrom)msgFrom
{
    CGSize textSize = [content boundingRectWithSize:CGSizeMake(150, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:czBtnFontSize} context:nil].size;
    CGSize lastSize = CGSizeMake(textSize.width + CZTextPadding*2, textSize.height + CZTextPadding*2);
    
    CGFloat textX;
    CGFloat textY = CGRectGetMinY(_iconF);
    if (msgFrom==MessageFromMe) {textX = kW-CGRectGetWidth(_iconF)-lastSize.width - JMMargin * 2;}
    else{textX = CGRectGetWidth(_iconF)+2*JMMargin;}
    _textF = (CGRect){{textX, textY}, lastSize};
}

// 语音长度计算方方式
- (void)fileFrame:(NSInteger )duration msgFrom:(MessageFrom)msgFrom
{
    CGFloat textX;
    CGFloat rate = [self returnDuration:duration]/60.0;
    CGFloat left = CGRectGetWidth(_iconF)+2*JMMargin;
    if (msgFrom==MessageFromMe) {textX = (kW-left)*(1-rate);}
    else{textX = left;}
    _textF = CGRectMake(textX, CGRectGetMinY(_iconF), (kW-left)*rate, CGRectGetWidth(_iconF));
}

- (CGFloat)returnDuration:(NSInteger)duration
{
    if (duration<5) {
      
        return 20.0;
        
    }else if(duration>=5 && duration<10){
      
        return 25.0;
        
    }else if (duration>=10 &&duration<15){
    
        return 30.0;
        
    }else if (duration>=15 && duration<20){
        
        return 35.0;
    }else{
        return (CGFloat)duration;
    }
}

@end
