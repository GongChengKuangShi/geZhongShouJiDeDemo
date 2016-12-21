//
//  JMListEmojiView.h
//  YaoYao
//
//  Created by JM Zhao on 2016/12/9.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JMListEmojiViewDelegate <NSObject>
- (void)ListEmojiView:(NSDictionary *)dic;
@end

@interface JMListEmojiView : UIView
@property (nonatomic, weak) id <JMListEmojiViewDelegate>delegate;
@property (nonatomic, strong) NSArray *emojis;
@end
