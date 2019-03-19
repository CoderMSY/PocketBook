//
//  ATHomePresenter.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/18.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATHomePresenter.h"
#import <DateTools/DateTools.h>

#import "ATDaoFactory.h"
#import "ATBillModel.h"
#import "ATBillDayModel.h"
#import "ATBillMonthModel.h"

@interface ATHomePresenter ()

@property (nonatomic, strong) NSDate *currentDate;

@end

@implementation ATHomePresenter

#pragma mark - ATHomePresenterIO

- (void)saveHistoryData {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"DetailBill.json" ofType:@""];
    NSData *JSONData=[NSData dataWithContentsOfFile:jsonPath];
    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *dict in dataArray) {
        NSString *billDate = dict[@"billDate"];
        NSString *inOutTypeStr = dict[@"inOutType"];
        ATBillInOutType inOutType;
        if ([inOutTypeStr isEqualToString:@"支出"]) {
            inOutType = ATBillInOutType_payout;
        }
        else {
            inOutType = ATBillInOutType_income;
        }
    
        ATBillModel *model = [[ATBillModel alloc] init];
        model.billDate = billDate;
        model.inOutType = inOutType;
        model.income = dict[@"income"];
        model.payout = dict[@"payout"];
        model.billTypeName = dict[@"billTypeName"];
        model.payType = ATBillPayType_cash;
        model.remark = dict[@"remark"];
        
        [[_Dao getBillDao] saveOrUpdateBillModel:model];
    }
}

- (void)fetchBillListWithPageIndex:(NSUInteger)pageIndex
                       currentDate:(NSDate *)currentDate
                        dataSource:(NSMutableArray <ATBillDayModel *>*)dataSource {
    //页码转换,第一页对应第一个月，第二页对应上一个月，依次类推
    NSDate *findMonthDate = [currentDate dateBySubtractingMonths:pageIndex - 1];
    
    NSArray *monthBillArr = [[_Dao getBillDao] findWithMonthDate:findMonthDate];
    
    NSDate *lastDate;
    ATBillDayModel *dayModel;
//    if (dataSource.count > 0) {
//        section = dataSource.lastObject;
//        lastDate = [NSDate dateWithTimeIntervalSince1970:section.dayTime.longLongValue / 1000];
//    }
    NSMutableArray *dayModelArrs = [NSMutableArray arrayWithCapacity:0];
    CGFloat monthIncome = 0, monthPayout = 0;
    for (ATBillModel *model in monthBillArr) {
        NSDate *currentDate = [NSDate dateWithTimeIntervalSince1970:model.billTime.longLongValue / 1000];
        monthIncome += model.income.floatValue;
        monthPayout += model.payout.floatValue;
        if ([lastDate isSameDay:currentDate]) {
            [dayModel.billArrs addObject:model];
        }
        else {
            dayModel = [[ATBillDayModel alloc] init];
            dayModel.dayTime = model.billTime;
            [dayModel.billArrs addObject:model];
            
            [dayModelArrs addObject:dayModel];
        }
        
        lastDate = currentDate;
    }
    
    ATBillMonthModel *monthModel = [[ATBillMonthModel alloc] init];
    monthModel.dayModelArrs = dayModelArrs;
    monthModel.findMonthDate = findMonthDate;
    monthModel.monthIncome = @(monthIncome);
    monthModel.monthPayout = @(monthPayout);
    
    [dataSource addObjectsFromArray:dayModelArrs];
    
    [self.output renderDataSource:dataSource
                   billMonthModel:monthModel
                        isHadData:dayModelArrs.count > 0];
}

@end
