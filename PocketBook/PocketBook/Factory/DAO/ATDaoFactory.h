//
//  ATDaoFactory.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATSingleton.h"
#import "ATBillDaoProtocol.h"

NS_ASSUME_NONNULL_BEGIN

#define _Dao [ATDaoFactory sharedDaoFactory]

@interface ATDaoFactory : NSObject

ATSingletonH(DaoFactory)

/**
 获取任务(类似于TODO list)dao工厂
 */
- (id<ATBillDaoProtocol>)getBillDao;

@end

NS_ASSUME_NONNULL_END
