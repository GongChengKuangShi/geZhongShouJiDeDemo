//
//  JMMoreInputView.h
//  YaoYao
//
//  Created by JM Zhao on 2016/12/10.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    typeImage=0,
    typeCamer,
    typeFile,
    typeVideo,
    typeSave,
    typeMoney,
    typeLocation,
    typeCall
} ActionType;

typedef void(^callBackBlock)(ActionType actionType);
@interface JMMoreInputView : UIScrollView
- (void)callBack:(callBackBlock)callBack;
@end
