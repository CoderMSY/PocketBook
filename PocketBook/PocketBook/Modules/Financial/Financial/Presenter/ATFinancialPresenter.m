//
//  ATFinancialPresenter.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATFinancialPresenter.h"
#import "ATFinancialRouter.h"

@interface ATFinancialPresenter ()

@property (nonatomic, strong) ATFinancialRouter *router;

@end

@implementation ATFinancialPresenter

#pragma mark - ATFinancialModuleInterface

- (void)getFinancialDataSource {
    [self.interactor findFinancialDataSource];
}

- (void)pushProvidentInterfaceFromViewCtr:(UIViewController *)viewCtr
                                    title:(NSString *)title {
    [self.router pushProvidentInterfaceFromViewCtr:viewCtr title:title];
}

#pragma mark - ATFinancialInteractorOutput

- (void)foundFinancialDataSource:(NSArray *)dataSource {
    [self.viewInterface showItemList:dataSource];
}

#pragma mark - getter && setter

- (ATFinancialRouter *)router {
    if (!_router) {
        _router = [[ATFinancialRouter alloc] init];
    }
    return _router;
}

@end
