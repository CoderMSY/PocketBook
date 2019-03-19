//
//  ATShareMacro.h
//  launcher
//
//  Created by SimonMiao on 2017/9/28.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#ifndef ATShareMacro_h
#define ATShareMacro_h

//开发宏 0:正式版本 1:开发版本
#ifndef AT_DEV
#define AT_DEV 0
#endif

// block 宏
typedef void(^ATParas0Callback)(void);
typedef void(^ATParas1Callback)(id para);
typedef void(^ATParas2Callback)(id para, id para2);
typedef void(^ATParas3Callback)(id para, id para2, id para3);
typedef void(^ATParas4Callback)(id para, id para2, id para3, id para4);

//#define at_complete_B void(^_Nullable)(BOOL isSuccess)
//#define at_complete_I void(^_Nullable)(bg_dealState result)
//#define at_complete_A void(^_Nullable)(NSArray* _Nullable array)
//#define at_changeBlock void(^_Nullable)(bg_changeState result)

/**
 *  属性转字符串
 */
#define ATKeyPath(obj, key) @(((void)obj.key, #key))

//头像角标
#define KAvatar_cornerRadius 4.0

// 屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0

#define AT_SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#define AT_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define AT_IS_IPHONE_4         (AT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)
#define AT_IS_IPHONE_5         (AT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define AT_IS_IPHONE_6         (AT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0f)
#define AT_IS_IPHONE_6Plus     (AT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0f)
#define AT_IS_IPHONE_X         (AT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0f)
#define AT_IS_IPHONE_XRorXSMax         (AT_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 896.0f)
//#define AT_IS_IPAD             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#ifdef DEBUG // 处于开发阶段
#define ATLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define ATLog(...)
#endif

//弱引用
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

//强引用
#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* ATShareMacro_h */
