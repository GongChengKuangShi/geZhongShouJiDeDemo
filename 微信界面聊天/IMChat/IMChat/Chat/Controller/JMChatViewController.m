//
//  JMChatViewController.m
//  YaoYao
//
//  Created by JM Zhao on 2016/11/2.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import "JMChatViewController.h"
#import "JMChatTableView.h"
#import "JMChatModel.h"
#import "JMInputHeader.h"

@interface JMChatViewController ()
@property (nonatomic, weak) JMInputHeader *textView;
@property (nonatomic, weak) JMChatTableView *msgTable;
@end

@implementation JMChatViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.userName;
    
    [self creatChatTableView];
    [self creatKeyBoard];
}

#pragma mark -- 创建键盘发送消息
- (void)creatKeyBoard
{
    JMInputHeader *textView = [JMInputHeader initWithKeyBoard:self.view];
    self.textView = textView;
    
    JMSelf(js); // 改变键盘高度
    [textView refreshTabHeight:^(CGFloat height, BOOL isUp) {
        
        [js.msgTable refreshFrame:height isUp:isUp];
    }];
    
    // 1> 发送文字消息
    [textView refreshContents:^(NSString *input) {
        
        JMChatModel *model = [[JMChatModel alloc] init];
        model.messageFrom = MessageFromMe;
        model.msgContent = input;
        [js.msgTable refrashByModel:model];
    }];
    
    
    // 第二键盘回调
    [textView secBoardCallBack:^(NSInteger type) {[js keyboardCallBack:type];}];
}

#pragma mark -- 创建tableView
- (void)creatChatTableView
{
    NSMutableArray *a = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
        
        JMChatModel *model = [[JMChatModel alloc] init];
        model.msgContent = @"你好!";
        model.messageFrom = i%2;
        [a addObject:model];
    }
    
    JMChatTableView *msgTable = [JMChatTableView initMessageTableView:self];
    msgTable.modelArray = a;
    self.msgTable = msgTable;
    
    [msgTable selectRowAtindexPath:^(JMChatModel *model) {
        
        
    }];
}

#pragma mark -- 第二键盘回调
- (void)keyboardCallBack:(NSInteger)type
{
    if (type==0) {
        
        
    }else if (type==1){
    
    }else if (type==2){
        
    }else if (type==3){
        
    }else if (type==4){
        
    }else if (type==5){
        
    }else if (type==6){
        
        
    }else if (type==7){
        
        
    }else if (type==8){
        
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
