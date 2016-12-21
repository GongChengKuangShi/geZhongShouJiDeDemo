//
//  JMChatCell.m
//  YaoYao
//
//  Created by JM Zhao on 2016/11/3.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import "JMChatCell.h"
#import "JMChatModel.h"
#import "JMChatRectModel.h"
#import "NSString+Extension.h"
@interface JMChatCell()

@property (nonatomic, weak) UILabel *timeL;
@property (nonatomic, weak) UIImageView *iconV;
@property (nonatomic, weak) UIButton *textB;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JMChatCell

+ (JMChatCell *)initChatCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"MessageCell";
    JMChatCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {cell = [[JMChatCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];}
    
    cell.tableView = tableView;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *timeL = [[UILabel alloc] init];
        timeL.textColor = [UIColor blackColor];
        timeL.textAlignment = 1;
        timeL.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:timeL];
        self.timeL = timeL;
        
        UIButton *textB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [textB setTintColor:[UIColor blackColor]];
        [self.contentView addSubview:textB];
        textB.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        textB.titleLabel.numberOfLines = 0;//自动换行
        [textB addTarget:self action:@selector(clickMessage:event:) forControlEvents:(UIControlEventTouchUpInside)];
        self.textB = textB;
        
        UIImageView *iconV = [[UIImageView alloc] init];
        [self.contentView addSubview:iconV];
        self.iconV = iconV;
        
        self.backgroundColor = JMRandomColor;
    }
    
    return self;
}

// 设置frame大小
- (void)setMessageFrame:(JMChatRectModel *)messageFrame
{
    _messageFrame = messageFrame;
    JMChatModel *model = messageFrame.message;
    
    // 1> 计算frame
    self.textB.frame = _messageFrame.textF;
    self.iconV.frame = _messageFrame.iconF;
    self.timeL.frame = _messageFrame.timeF;
    self.timeL.text = @"2012-10-33";
    
    // 2> 赋值
    [self messageModel:model];
}

- (void)messageModel:(JMChatModel *)model
{
    [self textMessage:model];
}

- (void)textMessage:(JMChatModel *)model
{
    [self.textB setTitle:model.msgContent forState:(UIControlStateNormal)];
    
    // 这里需要做判断, 看是哪个人发过来的消息
    if (model.messageFrom==MessageFromOther) {
        
        self.iconV.image = [UIImage imageNamed:@"mine.jpeg"];
        [self.textB setBackgroundImage:[UIImage resizeImageWithName:@"chat_recive_nor"] forState:(UIControlStateNormal)];
        
    }else{
        self.iconV.image = [UIImage imageNamed:@"he.jpeg"];
        [self.textB setBackgroundImage:[UIImage resizeImageWithName:@"chat_send_nor"] forState:(UIControlStateNormal)];
    }
}

- (void)clickMessage:(UIButton *)sender event:(id)event
{
    NSSet *touches =[event allTouches];
    UITouch *touch =[touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:_tableView];
    if ([self.delegate respondsToSelector:@selector(getsIndexPath:)]) {[self.delegate getsIndexPath:[_tableView indexPathForRowAtPoint:currentTouchPosition]];}
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
