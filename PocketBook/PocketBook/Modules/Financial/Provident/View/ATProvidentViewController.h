//
//  ATProvidentViewController.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATBaseViewController.h"
#import "ATProvidentModuleInterface.h"
#import "ATProvidentViewInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATProvidentViewController : ATBaseViewController <ATProvidentViewInterface>

@property (nonatomic, weak) id <ATProvidentModuleInterface>moduleInterface;

@end

NS_ASSUME_NONNULL_END
