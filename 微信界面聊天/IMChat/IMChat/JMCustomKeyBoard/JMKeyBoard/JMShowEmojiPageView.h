//
//  JMShowEmojiPageView.h
//  YaoYao
//
//  Created by JM Zhao on 2016/12/9.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JMShowEmojiPageViewDelegate <NSObject>
- (void)showEmojiPage:(NSDictionary *)dic;
@end

@interface JMShowEmojiPageView : UIView
@property (nonatomic, weak) id <JMShowEmojiPageViewDelegate>delegate;
@property (nonatomic, retain) NSArray *emojiPage;
@end
