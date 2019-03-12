//
//  ATFinancialRouter.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATFinancialRouter.h"
#import "ATProvidentRouter.h"

@implementation ATFinancialRouter

- (void)pushProvidentInterfaceFromViewCtr:(UIViewController *)viewCtr
                                    title:(NSString *)title {
    ATProvidentRouter *providentRouter = [[ATProvidentRouter alloc] init];
    [providentRouter pushProvidentInterfaceFromViewCtr:viewCtr title:title];
}

@end
