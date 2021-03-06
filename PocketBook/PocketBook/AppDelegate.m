//
//  AppDelegate.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "AppDelegate.h"
#import <DoraemonKit/DoraemonKit.h>

#import "ATTabBarControllerConfig.h"

@interface AppDelegate ()

@property (nonatomic, strong) ATTabBarControllerConfig *tabBarCtrConfig;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
#ifdef DEBUG
//    [self configDoraemonKit];
#endif
    
    self.tabBarCtrConfig = [[ATTabBarControllerConfig alloc] init];
    self.window.rootViewController = self.tabBarCtrConfig.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

//配置Doraemon工具集
#ifdef DEBUG
- (void)configDoraemonKit{
    //自定义业务（可有可无）
//    [[DoraemonManager shareInstance] addPluginWithTitle:@"环境切换" icon:@"doraemon_default" desc:@"用于app内部环境切换功能" pluginName:@"ATTestPlugin" atModule:@"业务专区"];
//    [[DoraemonManager shareInstance] addStartPlugin:@"ATStartPlugin"];
    //内置工具集的接入（必须）
    [[DoraemonManager shareInstance] install];
}
#endif

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
