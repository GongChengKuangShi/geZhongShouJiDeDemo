//
//  ZYTabViewController.m
//  TableviewTestDemo
//
//  Created by chuanglong01 on 16/8/29.
//  Copyright © 2016年 kuoshuqing0. All rights reserved.
//

#import "ZYTabViewController.h"
#import "ZYFirstTypeCell.h"
#import "ZYSecondTypeCell.h"
#import "ZYChapterHeader.h"

@interface ZYTabViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger currentSection;
    NSInteger currentRow;
}
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic,strong)NSMutableArray *sectionOpen;

@end

@implementation ZYTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView.delegate =self;
    self.mainTableView.dataSource = self;
    self.sectionOpen = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
}



#pragma mark  dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 12;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    BOOL sectionStatus = [self.sectionOpen[section] boolValue];
    if (sectionStatus) {
        
        return 10;
    }else{
        //section是收起状态时候
        return 0;
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell           = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
         cell=[[NSBundle mainBundle]loadNibNamed:@"ZYFirstTypeCell" owner:nil options:nil][0];
    }
   
    
    return cell;

}

#pragma mark    -TableViewDelegate
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //调用header的Xib,设置frame
    ZYChapterHeader *header = [[[NSBundle mainBundle] loadNibNamed:@"ZYChapterHeader" owner:self options:nil]lastObject];
    header.frame = CGRectMake(0, 0, self.view.frame.size.width, 80.f);
    header.backgroundColor = [UIColor orangeColor];
    header.yearLabel.text = @"2016";
    [header.yaerBtn addTarget:self action:@selector(sectionAction:) forControlEvents:UIControlEventTouchUpInside];
    header.yaerBtn.tag = section;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
//    view.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1];
    view.backgroundColor = [UIColor purpleColor];
    [header addSubview:view];
    return header;
}

- (void)sectionAction:(UIButton *)button{
    currentSection = button.tag;
    //tableview收起，局部刷新
    NSNumber *sectionStatus = self.sectionOpen[[button tag]];
    BOOL newSection = ![sectionStatus boolValue];
    [self.sectionOpen replaceObjectAtIndex:[button tag] withObject:[NSNumber numberWithBool:newSection]];
    [self.mainTableView reloadSections:[NSIndexSet indexSetWithIndex:[button tag]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
