//
//  ATProvidentPresenter.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATProvidentModuleInterface.h"
#import "ATProvidentViewInterface.h"
#import "ATProvidentInteractorIO.h"

NS_ASSUME_NONNULL_BEGIN

@class ATProvidentRouter;
@interface ATProvidentPresenter : NSObject <ATProvidentModuleInterface, ATProvidentInteractorOutput>

@property (nonatomic, strong) id <ATProvidentViewInterface>viewInterface;
@property (nonatomic, strong) id <ATProvidentInteractorInput>interactor;
@property (nonatomic, weak) ATProvidentRouter *router;

@end

NS_ASSUME_NONNULL_END
