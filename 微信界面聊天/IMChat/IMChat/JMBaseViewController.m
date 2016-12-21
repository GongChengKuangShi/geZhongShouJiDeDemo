//
//  JMBaseViewController.m
//  YaoYao
//
//  Created by JM Zhao on 2016/11/2.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import "JMBaseViewController.h"

@interface JMBaseViewController ()
//<UITableViewDelegate, UITableViewDataSource>
// @property (nonatomic, weak) UITableView *tableView;
@end

@implementation JMBaseViewController

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {self.dataSource = [NSMutableArray array];}
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // [self creatTableView];
}

//- (void)creatTableView
//{
//    UITableView *aTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
//    [aTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"BaseCell"];
//    aTableView.delegate = self;
//    aTableView.dataSource = self;
//    [self.view addSubview:aTableView];
//    self.tableView = aTableView;
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.dataSource.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BaseCell" forIndexPath:indexPath];
//    return cell;
//}

- (void)leftAction:(UIBarButtonItem *)sender
{
    
    
}

- (void)rightAction:(UIBarButtonItem *)sender
{
    
    
}

- (void)setLeftImage:(NSString *)leftImage
{
    _leftImage = leftImage;
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderingName:@"cancle"] style:(UIBarButtonItemStyleDone) target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)setLeftTitle:(NSString *)leftTitle
{
    _leftTitle = leftTitle;
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:leftTitle style:(UIBarButtonItemStyleDone) target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)setRightImage:(NSString *)rightImage
{
    _rightImage = rightImage;
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderingName:@"add"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightAction:)];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)setRightTitle:(NSString *)rightTitle
{
    _rightTitle = rightTitle;
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:rightTitle style:(UIBarButtonItemStyleDone) target:self action:@selector(rightAction:)];
    self.navigationItem.rightBarButtonItem = right;
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
