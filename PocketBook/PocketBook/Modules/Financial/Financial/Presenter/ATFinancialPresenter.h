//
//  ATFinancialPresenter.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATFinancialModuleInterface.h"
#import "ATFinancialInteractor.h"
#import "ATFinancialViewInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATFinancialPresenter : NSObject <ATFinancialModuleInterface, ATFinancialInteractorOutput>

@property (nonatomic, strong) ATFinancialInteractor *interactor;
@property (nonatomic, strong) id <ATFinancialViewInterface>viewInterface;//!<指向当前控制器

@end

NS_ASSUME_NONNULL_END
