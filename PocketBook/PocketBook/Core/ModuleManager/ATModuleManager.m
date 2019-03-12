//
//  ATModuleManager.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/12.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATModuleManager.h"

@implementation ATModuleManager

ATSingletonM(ATModuleManager)


- (void)loadModuleFromPlist:(NSString *)path {
//    [[NSBundle mainBundle] pathForResource:<#(nullable NSString *)#> ofType:<#(nullable NSString *)#>]
    
}

- (NSArray *)allModules {
    return [NSArray array];
}

@end
