//
//  ATBillModel.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/18.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATBillConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATBillModel : NSObject

//@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *billTime;//!<账单记录时间戳
@property (nonatomic, copy) NSString *billDate;//!<账单记录时间
@property (nonatomic, assign) ATBillInOutType inOutType;//!<收支类型
@property (nonatomic, strong) NSNumber *income;//!<收入金额
@property (nonatomic, strong) NSNumber *payout;//!<支出金额
@property (nonatomic, assign) ATBillType billType;//!<账单类型 吃喝、早餐、午餐、晚餐...
@property (nonatomic, copy) NSString *billTypeName;//!<账单类型名称
@property (nonatomic, assign) ATBillPayType payType;//!<账单支付类型
@property (nonatomic, copy) NSString *payTypeName;//!<账单支付类型名称
@property (nonatomic, copy) NSString *remark;//!<备注



@end

NS_ASSUME_NONNULL_END
