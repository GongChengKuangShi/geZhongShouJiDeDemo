//
//  JMChatTableView.m
//  YaoYao
//
//  Created by JM Zhao on 2016/11/3.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import "JMChatTableView.h"
#import "JMChatModel.h"
#import "JMChatRectModel.h"
#import "JMChatCell.h"
@interface JMChatTableView()<UITableViewDataSource, UITableViewDelegate, JMChatCellDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIViewController *superVC;
@property (nonatomic, copy) selectCell selectBlock;

@end
@implementation JMChatTableView

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
        
        [self registerClass:[JMChatCell class] forCellReuseIdentifier:@"MessageCell"];
        self.allowsSelection = NO;
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = JMColor(231, 231, 231);// [UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1.0];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JMChatCell *cell = [JMChatCell initChatCellWith:tableView indexPath:indexPath];
    cell.messageFrame = self.dataArray[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JMChatRectModel *mf = self.dataArray[indexPath.row];
    return mf.cellHeight;
}

#pragma mark -- IMageCell
- (void)getsIndexPath:(NSIndexPath *)indexPath
{
    JMChatRectModel *af = self.dataArray[indexPath.row];
    self.selectBlock(af.message);
}

- (void)selectRowAtindexPath:(selectCell)model
{
    self.selectBlock = model;
}

+ (instancetype)initMessageTableView:(UIViewController *)viewC 
{
    JMChatTableView *base = [[JMChatTableView alloc] initWithFrame:viewC.view.bounds];
    base.superVC = viewC;
    [viewC.view addSubview:base];
//    base.backgroundColor = [UIColor greenColor];
    return base;
}

// 给模型赋值
- (void)setModelArray:(NSMutableArray<JMChatModel *> *)modelArray
{
    _modelArray = modelArray;
    for (JMChatModel *model in modelArray) {
        
        JMChatRectModel *af = [[JMChatRectModel alloc] init];
        af.message = model;
        [self.dataArray addObject:af];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.superVC.view endEditing:YES];
}

- (void)keyBoardRun
{
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
    [self insertRowsAtIndexPaths:@[path] withRowAnimation:(UITableViewRowAnimationBottom)];
    [self scrollToRowAtIndexPath:path atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
}

// 刷新界面
- (void)refrashByModel:(JMChatModel *)model
{
    JMChatRectModel *af = [[JMChatRectModel alloc] init];
    af.message = model;
    [self.dataArray addObject:af];
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.dataArray.count - 1 inSection:0];
    [self insertRowsAtIndexPaths:@[path] withRowAnimation:(UITableViewRowAnimationBottom)];
    [self scrollToRowAtIndexPath:path atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
}

- (void)refreshFrame:(CGFloat)height isUp:(BOOL)isUp
{
    self.frame = CGRectMake(0, 0, self.width, height);
    if (isUp) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
        [self scrollToRowAtIndexPath:path atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
    }
}

@end
