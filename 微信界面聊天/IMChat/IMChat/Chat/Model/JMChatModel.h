//
//  JMChatModel.h
//  YaoYao
//
//  Created by JM Zhao on 2016/11/3.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MessageFromMe = 0,
    MessageFromOther = 1
} MessageFrom;

typedef enum{
    MsgFailedType = 0,
    MsgSuccessedType = 1,
    MsgSendingdType = 2
} MsgSendResultType;

typedef enum {
    MessageTypeText,
    MessageTypeImage,
    MessageTypeVoice,
    MessageTypeVideo,
}MsgType;

@interface JMChatModel : NSObject
@property (nonatomic, assign) BOOL readtype;

@property (nonatomic, assign) NSInteger mid;
@property (nonatomic, copy) NSString *meetingID;
@property (nonatomic, copy) NSString *sendNo;
@property (nonatomic, copy) NSString *sendTime;
@property (nonatomic, copy) NSString *udid;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *msgContent;
@property (nonatomic, copy) NSString *loginName;

// 后来新添加的属性
@property (nonatomic, copy) NSString *msgFrom;
@property (nonatomic, copy) NSString *msgTo;
@property (nonatomic, copy) NSString *msgDevice;
@property (nonatomic, copy) NSString *msgBare;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, strong) NSMutableArray *points;
@property (nonatomic, strong) UIImage *headerImage;

// 是否发送成功
@property (nonatomic, assign) MsgSendResultType successtype;
@property (nonatomic, assign) MessageFrom messageFrom;
@property (nonatomic, assign) MsgType getMessageType;

/**
 *  是否隐藏事件
 */
@property (nonatomic, assign)BOOL hideTime;
@end
