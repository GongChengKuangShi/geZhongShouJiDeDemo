//
//  JMChatTableView.h
//  YaoYao
//
//  Created by JM Zhao on 2016/11/3.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JMChatModel;
typedef void(^selectCell)(JMChatModel *model);
@interface JMChatTableView : UITableView
@property (nonatomic, strong) NSMutableArray<JMChatModel *> *modelArray;

+ (instancetype)initMessageTableView:(UIViewController *)viewC;
- (void)refrashByModel:(JMChatModel *)model;
- (void)refreshFrame:(CGFloat)height isUp:(BOOL)isUp;
- (void)selectRowAtindexPath:(selectCell)model;
@end
