//
//  ATBillDayModel.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ATBillModel;
@interface ATBillDayModel : NSObject

@property (nonatomic, strong) NSMutableArray <ATBillModel *>*billArrs;
@property (nonatomic, strong) NSNumber *dayTime;//!<账单记录当天时间戳
@property (nonatomic, copy) NSString *dayDate;//!<账单记录当天时间

@property (nonatomic, copy) NSString *dayIncome;
@property (nonatomic, copy) NSString *dayPayout;

@end

NS_ASSUME_NONNULL_END
