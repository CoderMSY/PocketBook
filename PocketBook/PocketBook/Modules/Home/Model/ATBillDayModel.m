//
//  ATBillDayModel.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATBillDayModel.h"
#import "ATBillModel.h"

@implementation ATBillDayModel

- (void)setDayTime:(NSNumber *)dayTime {
    _dayTime = dayTime;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dayTime.longLongValue / 1000.0];

    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
    });
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setLocale:[NSLocale autoupdatingCurrentLocale]];
    [formatter setDateFormat:@"yyyy-MM-dd"];

    self.dayDate = [formatter stringFromDate:date];
}

- (void)dealWithInOutAcount {
    CGFloat totalPayout = 0;
    CGFloat totalIncome = 0;
    for (ATBillModel *model in self.billArrs) {
        totalPayout += model.payout.floatValue;
        totalIncome += model.income.floatValue;
    }
    
    self.dayPayout = [NSString stringWithFormat:@"%@:%.2f", @"支出", totalPayout];
    self.dayIncome = [NSString stringWithFormat:@"%@:%.2f", @"收入", totalIncome];
}

- (NSString *)dayPayout {
    if (!_dayPayout) {
        [self dealWithInOutAcount];
    }
    
    return _dayPayout;
}

- (NSString *)dayIncome {
    if (!_dayIncome) {
        [self dealWithInOutAcount];
    }
    
    return _dayIncome;
}

- (NSMutableArray<ATBillModel *> *)billArrs {
    if (!_billArrs) {
        _billArrs = [NSMutableArray arrayWithCapacity:0];
    }
    return _billArrs;
}

@end
