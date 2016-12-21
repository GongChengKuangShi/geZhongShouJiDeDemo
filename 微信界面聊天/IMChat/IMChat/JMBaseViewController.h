//
//  JMBaseViewController.h
//  YaoYao
//
//  Created by JM Zhao on 2016/11/2.
//  Copyright © 2016年 JunMingZhaoPra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMBaseViewController : UIViewController
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, copy) NSString *titles;
@property (nonatomic, copy) NSString *leftTitle;
@property (nonatomic, copy) NSString *leftImage;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, copy) NSString *rightImage;
@end
