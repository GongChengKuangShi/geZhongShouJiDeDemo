//
//  JMChatCell.h
//  YaoYao
//
//  Created by JM Zhao on 2016/11/3.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JMChatRectModel;
@protocol JMChatCellDelegate <NSObject>
- (void)getsIndexPath:(NSIndexPath *)indexPath;
@end

@interface JMChatCell : UITableViewCell
@property (nonatomic, strong) JMChatRectModel *messageFrame;
@property (nonatomic, weak) id <JMChatCellDelegate>delegate;
+ (JMChatCell *)initChatCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
@end
