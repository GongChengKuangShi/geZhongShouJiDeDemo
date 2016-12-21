//
//  JMInputField.h
//  YaoYao
//
//  Created by JM Zhao on 2016/12/10.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^relodBlock)(void);
@interface JMInputField : UITextField
@property (nonatomic, copy) relodBlock reload;
@end
