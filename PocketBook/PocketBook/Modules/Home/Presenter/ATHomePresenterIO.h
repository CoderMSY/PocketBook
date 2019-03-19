//
//  ATHomePresenterIO.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/18.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ATBillDayModel;
@class ATBillMonthModel;
@protocol ATHomePresenterInput <NSObject>

/**
 拉取账单数据

 @param pageIndex 页数
 @param dataSource 首页列表数据源
 */
- (void)fetchBillListWithPageIndex:(NSUInteger)pageIndex
                       currentDate:(NSDate *)currentDate
                        dataSource:(NSMutableArray <ATBillDayModel *>*)dataSource;
- (void)saveHistoryData;


@end

@protocol ATHomePresenterOutput <NSObject>

/**
 返回账单数据

 @param dataSource 首页列表数据源
 @param isHadData 是否拉取到数据
 */
- (void)renderDataSource:(NSMutableArray <ATBillDayModel *>*)dataSource
          billMonthModel:(ATBillMonthModel *)billMonthModel
               isHadData:(BOOL)isHadData;

@end

NS_ASSUME_NONNULL_END
