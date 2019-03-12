//
//  ATFinancialInteractor.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATFinancialInteractorIO.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATFinancialInteractor : NSObject <ATFinancialInteractorInput>

@property (nonatomic, weak) id <ATFinancialInteractorOutput>output;

@end

NS_ASSUME_NONNULL_END
