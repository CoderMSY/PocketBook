//
//  ATBillDaoProtocol.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ATBillModel;
@protocol ATBillDaoProtocol <NSObject>

- (void)saveOrUpdateBillModel:(ATBillModel *)billModel;

/**
 获取当前月下的账单数据

 @param date 当前月的某一天
 @return 账单数据
 */
- (NSArray *)findWithMonthDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
