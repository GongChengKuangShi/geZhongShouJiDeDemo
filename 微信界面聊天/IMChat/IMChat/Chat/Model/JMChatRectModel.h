//
//  JMChatRectModel.h
//  YaoYao
//
//  Created by JM Zhao on 2016/11/3.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JMChatModel.h"
#import <UIKit/UIKit.h>

@interface JMChatRectModel : NSObject
@property (nonatomic, assign) CGRect textF;
@property (nonatomic, assign) CGRect timeF;
@property (nonatomic, assign) CGRect iconF;
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) JMChatModel *message;
@end
