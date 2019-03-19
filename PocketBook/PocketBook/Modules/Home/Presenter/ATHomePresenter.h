//
//  ATHomePresenter.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/18.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATHomePresenterIO.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATHomePresenter : NSObject <ATHomePresenterInput>

@property (nonatomic, weak) id <ATHomePresenterOutput>output;

@end

NS_ASSUME_NONNULL_END
