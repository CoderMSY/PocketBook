//
//  ATBillMonthModel.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ATBillDayModel;
@interface ATBillMonthModel : NSObject

@property (nonatomic, strong) NSMutableArray <ATBillDayModel *>*dayModelArrs;

@property (nonatomic, strong) NSDate *findMonthDate;//!<当前月日期，忽略天
@property (nonatomic, strong) NSNumber *monthPayout;//!<月支出
@property (nonatomic, strong) NSNumber *monthIncome;//!<月收入

@end

NS_ASSUME_NONNULL_END
