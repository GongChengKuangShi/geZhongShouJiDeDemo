//
//  JMInputHeader.h
//  YaoYao
//
//  Created by JM Zhao on 2016/12/9.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    JMInputText=0,
    JMInputVoice,
    JMInputEmoji,
    JMInputMore,
} JMInputType;

typedef void(^keyBoardHeight)(CGFloat height, BOOL isUp);
typedef void(^inputString)(NSString *input);
typedef void(^inputVoiceRecoing)();
typedef void(^inputVoiceRecoingEnd)();
typedef void(^inputVoiceCancle)();

// 设置第二键盘
typedef void(^secKeyBoardBlock)(NSInteger type);

@interface JMInputHeader : UIView

- (void)refreshTabHeight:(keyBoardHeight)height;
- (void)refreshContents:(inputString)input;

// 录音按钮回调
- (void)inputVoiceRecording:(inputVoiceRecoing)recording;
- (void)inputVoiceRecordingEnd:(inputVoiceRecoing)recordingEnd;
- (void)inputVoiceCancle:(inputVoiceCancle)cancle;

// 第二键盘回调
- (void)secBoardCallBack:(secKeyBoardBlock)block;


// 切换键盘
+ (instancetype)initWithKeyBoard:(UIView *)sView;


@end
