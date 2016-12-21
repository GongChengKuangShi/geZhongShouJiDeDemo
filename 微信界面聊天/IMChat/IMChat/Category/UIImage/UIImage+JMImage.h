//
//  UIImage+JMImage.h
//  Sina-微博
//
//  Created by ZhaoJM on 16/3/19.
//  Copyright © 2016年 ZhaoJM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JMImage)
- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees;
+ (instancetype)imageWithStretchableName:(NSString *)imageName;
+ (instancetype)imageWithRenderingName:(NSString *)name;
/**
 *  生成一个带圆环的图片
 *
 *  @param name   图片的名称
 *  @param border 圆环的宽度
 *  @param color  圆环的颜色
 *
 */
+ (instancetype)imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color;

/**
 *  截屏
 *
 *  @param view 需要截屏的视图
 *
 */
+ (instancetype)imageWithCaptureView:(UIView *)view;

// 整个窗口截屏
+ (instancetype)imageWithKeyWindow:(UIView *)view;


#pragma mark -- 拷贝的代码, 需要修改
- (UIImage *)scaleAndClipToFillSize:(CGSize)destSize;

/* Crop image in the rectangle*/
- (UIImage *)cropImageInRect:(CGRect)rect;

- (UIImage *)scaleImageToSize:(CGSize)size;

- (UIImage *)gaussianBlurWithRadius:(CGFloat)radius;

// make rectangle image to ellipse, usually used to show circular avatars.
- (UIImage *)ellipseImageWithDefaultSetting;

- (UIImage *)ellipseImage:(UIImage *)image
                withInset:(CGFloat)inset
              borderWidth:(CGFloat)width
              borderColor:(UIColor *)color;


// 图片拉伸
+ (UIImage *)resizeImageWithName:(NSString *)name;
@end
