//
//  ATBillDaoImpl.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATBillDaoImpl.h"
#import <BGFMDB/BGFMDB.h>
#import <DateTools/DateTools.h>
#import "ATBillModel.h"

static NSString *kTableSession = @"billList";//!<日报记录表

@implementation ATBillDaoImpl

#pragma mark - ATBillDaoProtocol

- (void)saveOrUpdateBillModel:(ATBillModel *)billModel {
    if (![billModel isKindOfClass:[ATBillModel class]]) {
        return;
    }
    billModel.bg_tableName = kTableSession;
    [billModel bg_saveOrUpdateAsync:^(BOOL isSuccess) {
        //
    }];
}

- (NSArray *)findWithPageIndex:(NSUInteger)pageIndex {
    if (pageIndex < 1) {
        NSAssert(0, @"第一页从1开始");
        
        return nil;
    }
    NSInteger loc = 1 + (pageIndex - 1) * 10;
    NSArray *modelArr = [ATBillModel bg_find:kTableSession range:NSMakeRange(loc, 10) orderBy:@"billTime" desc:YES];
    
    return modelArr;
}

- (NSArray *)findWithMonthDate:(NSDate *)date {
    NSDate *startDate = [NSDate dateWithYear:date.year month:date.month day:1];
    NSDate *endDate = [NSDate dateWithYear:date.year month:date.month day:date.daysInMonth];
    NSTimeInterval startTime = [startDate timeIntervalSince1970] * 1000;
    NSTimeInterval endTime = [endDate timeIntervalSince1970] * 1000;
    
    NSString *sql = [NSString stringWithFormat:@"select * from billlist where bg_billTime <= '%f' and bg_billTime >= '%f'", endTime, startTime];
//    NSString *sql = @"select * from billlist where bg_billTime <= '1552924800000' and bg_billTime >= '1551369600000'";
    NSArray *modelArr = bg_executeSql(sql, kTableSession, [ATBillModel class]);
    
    return modelArr;
}

@end
