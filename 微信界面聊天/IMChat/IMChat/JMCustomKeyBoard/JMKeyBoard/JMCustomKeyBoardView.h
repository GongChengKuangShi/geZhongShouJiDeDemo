//
//  JMCustomKeyBoardView.h
//  YaoYao
//
//  Created by JM Zhao on 2016/12/9.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JMCustomKeyBoardViewDelegate <NSObject>

- (void)jmCustomKeyBoard:(NSDictionary *)dic;

@end

@interface JMCustomKeyBoardView : UIView
@property (nonatomic, weak) id <JMCustomKeyBoardViewDelegate>delegate;
@end
