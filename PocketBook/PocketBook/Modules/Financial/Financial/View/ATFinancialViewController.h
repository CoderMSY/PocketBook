//
//  ATFinancialViewController.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATBaseViewController.h"
#import "ATFinancialModuleInterface.h"
#import "ATFinancialViewInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATFinancialViewController : ATBaseViewController <ATFinancialViewInterface>

@property (nonatomic, strong) id <ATFinancialModuleInterface>moduleInterface;

@end

NS_ASSUME_NONNULL_END
