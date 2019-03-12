//
//  ATTabBarControllerConfig.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATTabBarControllerConfig.h"
#import "UIColor+ATHelper.h"
#import "ATBaseNavigationController.h"

typedef NS_ENUM(NSInteger, ATTabBabConfigType) {
    ATTabBabConfigType_home = 1,
    ATTabBabConfigType_financial,
    ATTabBabConfigType_my,
};
static NSString *const kTabBarUDKey_selectedIndex = @"TabBarUDKey_selectedIndex";//!<保存当前选中的底部navCtr
static NSString *const key_TabBarVC = @"tabBarVC";
static NSString *const key_TabBarVCTitle = @"tabBarVCTitle";
static NSString *const key_tabBarItemImage = @"tabBarItemImage";
static NSString *const key_tabBarItemSelectedImage = @"tabBarItemSelectedImage";

@interface ATTabBarControllerConfig () <UITabBarControllerDelegate>

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@property (nonatomic, strong) NSDictionary *configDic;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong) NSMutableArray *tabBarItemsAttributes;

@end

@implementation ATTabBarControllerConfig

#pragma mark - lifecycle methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ATTabBarCtrConfigList" ofType:@"plist"];
        NSDictionary *configDic = [[NSDictionary alloc] initWithContentsOfFile:path];
        
        self.configDic = configDic;
        
        NSArray <NSNumber *>*typeArr = @[
                                         @(ATTabBabConfigType_home),
                                         @(ATTabBabConfigType_financial),
                                         @(ATTabBabConfigType_my),
                                         ];
        for (NSInteger i = 0; i < typeArr.count; i ++) {
            NSDictionary *vcInfoDic = self.configDic[typeArr[i].stringValue];
            
            if (!vcInfoDic) {
                continue;
            }
            
            UIViewController *ctr = [(UIViewController *)[NSClassFromString(vcInfoDic[key_TabBarVC]) alloc] init];
            ctr.title = vcInfoDic[key_TabBarVCTitle];
            
            NSMutableDictionary *itemAttributeDic = [NSMutableDictionary dictionaryWithCapacity:0];
            itemAttributeDic[CYLTabBarItemImage] = vcInfoDic[key_tabBarItemImage];
            itemAttributeDic[CYLTabBarItemSelectedImage] = vcInfoDic[key_tabBarItemSelectedImage];
            itemAttributeDic[CYLTabBarItemTitle] = vcInfoDic[key_TabBarVCTitle];
            [self.tabBarItemsAttributes addObject:itemAttributeDic];
            
            ATBaseNavigationController *navController = [[ATBaseNavigationController alloc]
                                                         initWithRootViewController:ctr];
            [self.viewControllers addObject:navController];
        }
    }
    return self;
}

#pragma mark - public methods


#pragma mark - private methods

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    //#warning CUSTOMIZE YOUR TABBAR APPEARANCE
    // Customize UITabBar height
    // 自定义 TabBar 高度
    //    tabBarController.tabBarHeight = 44.f;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor at_fontDarkGrayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor at_themeBlueColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tabBar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    // UITabBar *tabBarAppearance = [UITabBar appearance];
    // [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabBar_background"]];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSNumber *selectedIndex = @(tabBarController.selectedIndex);
    [[NSUserDefaults standardUserDefaults] setObject:selectedIndex forKey:kTabBarUDKey_selectedIndex];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


#pragma mark - getter && setter

- (CYLTabBarController *)tabBarController {
    if (!_tabBarController) {
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        UIOffset titlePositionAdjustment = UIOffsetZero;//UIOffsetMake(0, MAXFLOAT);
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributes imageInsets:imageInsets titlePositionAdjustment:titlePositionAdjustment];
        [self customizeTabBarAppearance:tabBarController];
        tabBarController.delegate = self;
        _tabBarController = tabBarController;
        
        NSNumber *selectedIndex = [[NSUserDefaults standardUserDefaults] objectForKey:kTabBarUDKey_selectedIndex];
        tabBarController.selectedIndex = selectedIndex.unsignedIntegerValue;
    }
    return _tabBarController;
}

- (NSMutableArray *)viewControllers {
    if (!_viewControllers) {
        _viewControllers = [NSMutableArray arrayWithCapacity:0];
    }
    return _viewControllers;
}

- (NSMutableArray *)tabBarItemsAttributes {
    if (!_tabBarItemsAttributes) {
        _tabBarItemsAttributes = [NSMutableArray arrayWithCapacity:0];
    }
    return _tabBarItemsAttributes;
}

@end
