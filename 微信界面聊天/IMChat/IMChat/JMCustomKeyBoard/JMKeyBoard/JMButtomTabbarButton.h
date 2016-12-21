//
//  JMButtomTabbarButton.h
//  YaoYao
//
//  Created by JM Zhao on 2016/12/9.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    KeyBoardViewTypeDefault,
    KeyBoardViewTypeRecent,
    KeyBoardViewTypeEmoji,
    KeyBoardViewTypeLxh
    
} KeyBoardViewType;

@class JMButtomTabbarButton;
@protocol JMButtomTabbarButtonDelegate <NSObject>

- (void)emojitabBar:(JMButtomTabbarButton *)tabBar didSelectBtn:(KeyBoardViewType)type;
@end

@interface JMButtomTabbarButton : UIView
@property (nonatomic, assign) id <JMButtomTabbarButtonDelegate> delegate;
@end
