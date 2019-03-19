//
//  ATFinancialModule.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/12.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATFinancialModule.h"
#import <MGJRouter/MGJRouter.h>
#import "ATFinancialModuleDefine.h"

#import "ATProvidentViewController.h"

@implementation ATFinancialModule

+ (void)load {
    [MGJRouter registerURLPattern:TEMPLATE_url_financial toHandler:^(NSDictionary *routerParameters) {
        NSString *keyword = routerParameters[@"keyword"];
        NSDictionary *userInfo = routerParameters[MGJRouterParameterUserInfo];
        if ([keyword isEqualToString:@"Provident"]) {
            ATProvidentViewController *ctr = [[ATProvidentViewController alloc] init];
            ctr.title = userInfo[key_title];
            UINavigationController *navCtr = userInfo[key_navCtr];
            [navCtr pushViewController:ctr animated:YES];
        }
    }];
}

+ (void)pushProvidentInterfaceFromNavCtr:(UINavigationController *)navCtr {
    NSString *urlStr = [MGJRouter generateURLWithPattern:TEMPLATE_url_financial parameters:@[@"Provident"]];
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[key_navCtr] = navCtr;
    userInfo[key_title] = @"MGJ——title";
    
    [MGJRouter openURL:urlStr withUserInfo:userInfo completion:^(id result) {
        NSLog(@"%@", result);
    }];
}

@end
