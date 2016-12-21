//
//  XYJAdvertisementView.h
//  muhlenXi
//
//  Created by muhlenXi on 16/9/7.
//  Copyright © 2016年 snail. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenBounds [UIScreen mainScreen].bounds

static NSString * const adImageName = @"adImageName";
static NSString * const adDownloadUrl = @"adDownloadUrl";
static NSInteger  const adTime = 3;
static NSString * const pushToADNotiName = @"pushToADNotiName";
static NSString * const pushToADUrl = @"pushToADUrl";

@interface XYJAdvertisementView : UIView

@property (nonatomic,copy) NSString * filePath; //!<  图片路径 用于属性传值

/**
 *  显示广告页面方法
 */
- (void) showAD;

@end
