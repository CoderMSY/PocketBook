//
//  ATProvidentRouter.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATProvidentRouter.h"
#import "ATProvidentViewController.h"
#import "ATProvidentPresenter.h"
#import "ATProvidentInteractor.h"

@interface ATProvidentRouter ()



@end

@implementation ATProvidentRouter

- (instancetype)init
{
    self = [super init];
    if (self) {
        ATProvidentPresenter *presenter = [[ATProvidentPresenter alloc] init];
        
        ATProvidentInteractor *interactor = [[ATProvidentInteractor alloc] init];
        presenter.interactor = interactor;
        presenter.router = self;
        
        self.presenter = presenter;
    }
    return self;
}

- (void)pushProvidentInterfaceFromViewCtr:(UIViewController *)viewCtr
                                    title:(NSString *)title {
    ATProvidentViewController *ctr = [[ATProvidentViewController alloc] init];
    ctr.title = title;
    ctr.moduleInterface = self.presenter;
    self.presenter.viewInterface = ctr;
    
    [viewCtr.navigationController pushViewController:ctr animated:YES];
}

@end
