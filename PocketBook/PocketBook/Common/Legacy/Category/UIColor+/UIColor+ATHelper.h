//
//  UIColor+ATHelper.h
//  AVWork
//
//  Created by SimonMiao on 16/9/27.
//  Copyright © 2016年 yongrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ATHelper)


/**
 设置十六进制颜色和透明度

 @param hexValue 十六进制值
 @param alphaValue 透明度
 @return 颜色
 */
+ (UIColor *)at_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor *)at_colorWithHex:(NSInteger)hexValue;

+ (UIColor *)at_colorWithWhite:(NSInteger)white;
+ (UIColor *)at_colorWithWhite:(NSInteger)white alpha:(CGFloat)alpha;

/**
 设置RGB颜色

 @param red 红
 @param green 绿
 @param blue 蓝
 @param alpha 透明度
 */
+ (UIColor *)at_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha;

+ (UIColor *)at_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue;

/** 主题--蓝色 */
+ (UIColor *)at_themeBlueColor;
+ (UIColor *)at_themeGreenColor;
+ (UIColor *)at_themeOrangeColor;
+ (UIColor *)at_themeYellowColor;
+ (UIColor *)at_themeRedColor;
+ (UIColor *)at_themeGrayColor;
/** 背景颜色 */
+ (UIColor *)at_bgLightGrayColor;
+ (UIColor *)at_bgGrayColor;
+ (UIColor *)at_bgDateGrayColor;


/// 字体颜色
+ (UIColor *)at_fontBlackColor;//标题、正文
+ (UIColor *)at_fontDarkGrayColor;//辅助内容、提示文案、按钮置灰
+ (UIColor *)at_fontLightGrayColor;

// oneDo
+ (UIColor *)at_oneDoTextBlueColor;
+ (UIColor *)at_oneDoTextGrayColor;
+ (UIColor *)at_oneDoTextBlackColor;
+ (UIColor *)at_oneDoTextReadColor;

//+ (UIColor *)at_fontOrangeColor;//选中状态
//+ (UIColor *)at_fontBlueColor;
//+ (UIColor *)at_fontGreenColor;


/**
 随机颜色

 @return 颜色对象
 */
+ (UIColor *)at_randomColor;

#pragma mark - iOS系统默认颜色

/**
 tableView头部尾部视图背景颜色
 */
+ (UIColor *)at_tableViewHeaderViewBgColor;

@end
