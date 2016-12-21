//
//  XYJADDataManager.h
//  muhlenXi
//
//  Created by muhlenXi on 16/9/7.
//  Copyright © 2016年 snail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYJAdvertisementView.h"

/**
 *  广告数据的相关操作方法
 */
@interface XYJADDataManager : NSObject

/**
 *  添加启动广告页面
 *
 *  @param imageUrl 广告图片的url
 *  @param pushUrl  点击广告push的url
 */
+ (void) addXYJAdvertisementView;

@end
