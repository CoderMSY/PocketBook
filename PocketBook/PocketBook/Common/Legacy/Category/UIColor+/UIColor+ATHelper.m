//
//  UIColor+ATHelper.m
//  AVWork
//
//  Created by SimonMiao on 16/9/27.
//  Copyright © 2016年 yongrun. All rights reserved.
//

#import "UIColor+ATHelper.h"

@implementation UIColor (ATHelper)

+ (UIColor *)at_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor *)at_colorWithHex:(NSInteger)hexValue
{
    return [UIColor at_colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)at_colorWithWhite:(NSInteger)white {
    return [UIColor at_colorWithWhite:white alpha:1.0];
}

+ (UIColor *)at_colorWithWhite:(NSInteger)white alpha:(CGFloat)alpha {
    return [UIColor colorWithWhite:white / 255.0 alpha:alpha];
}

+ (UIColor *)at_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [self at_colorWithRed:red green:green blue:blue alpha:1];
}

+ (UIColor *)at_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue: blue / 255.0 alpha:alpha];
}

#pragma mark - 主题颜色
+ (UIColor *)at_themeBlueColor {
    return [UIColor at_colorWithHex:0x0099ff];
}

+ (UIColor *)at_themeGreenColor {
    return [UIColor at_colorWithHex:0x22c064];
}

+ (UIColor *)at_themeOrangeColor {
    return [UIColor at_colorWithHex:0xf6540c];
}

+ (UIColor *)at_themeYellowColor {
    return [UIColor at_colorWithHex:0xF9B571];
}

+ (UIColor *)at_themeRedColor {
    return [UIColor at_colorWithHex:0xff3366];
}

+ (UIColor *)at_themeGrayColor {
    return [UIColor colorWithWhite:143.0 / 255.0 alpha:1.0];
}

#pragma mark - 背景颜色

+ (UIColor *)at_bgLightGrayColor {
    return [UIColor at_colorWithHex:0xefeff4];
}

+ (UIColor *)at_bgGrayColor {
    return [UIColor at_colorWithHex:0xb2b2b2];
}

+ (UIColor *)at_bgDateGrayColor {
    return [UIColor at_colorWithHex:0xd9d9d9];
}

#pragma mark - 字体颜色

+ (UIColor *)at_fontBlackColor {
    return [UIColor at_colorWithHex:0x333333];
}

+ (UIColor *)at_fontDarkGrayColor {
    return [UIColor at_colorWithHex:0x888888];
}

+ (UIColor *)at_fontLightGrayColor {
    return [UIColor at_colorWithHex:0xb3b3b3];
}

+ (UIColor *)at_fontOrangeColor {
    return [UIColor at_colorWithHex:0xf6540c];
}

+ (UIColor *)at_fontBlueColor {
    return [UIColor at_colorWithHex:0x0099ff];
}

+ (UIColor *)at_fontGreenColor {
    return [UIColor at_colorWithHex:0x23d28a];
}

+ (UIColor *)at_oneDoTextBlueColor{
    return [UIColor at_colorWithHex:0x1296db];
}

+ (UIColor *)at_oneDoTextGrayColor{
    return [UIColor at_colorWithHex:0x707070];
}

+ (UIColor *)at_oneDoTextBlackColor{
    return [UIColor at_colorWithHex:0x2c2c2c];
}

+ (UIColor *)at_oneDoTextReadColor{
    return [UIColor at_colorWithHex:0xd81e06];
    
}

//+ (UIColor *)at_lightGrayColor {
//    return [UIColor at_colorWithHex:0xdddddd];
//}
//
//+ (UIColor *)at_blueColor {
//    return [UIColor at_colorWithHex:0x0199FF];//0x0099ff
//}
//
//+ (UIColor *)at_lavenderColor {
//    return [UIColor at_colorWithHex:0xcde1ff];
//}
//
//+ (UIColor *)at_ghostWhiteColor {
//    return [UIColor at_colorWithHex:0xf1f7ff];
//}
//
//+ (UIColor *)at_goldColor {
//    return [UIColor at_colorWithHex:0xffb86c];
//}
//
//+ (UIColor *)at_redColor {
//    return [UIColor at_colorWithHex:0xff6c6c];
//}
//
//+ (UIColor *)at_greenColor {
//    return [UIColor at_colorWithHex:0x22C064];
//}

+ (UIColor *)at_randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}

#pragma mark - iOS系统默认颜色

+ (UIColor *)at_tableViewHeaderViewBgColor {
    return [UIColor at_colorWithHex:0xf7f7f7];
}

@end
