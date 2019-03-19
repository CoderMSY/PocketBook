//
//  ATBillModel.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/18.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATBillModel.h"
#import "ATBillProcessTool.h"

@implementation ATBillModel

- (void)setBillTime:(NSNumber *)billTime {
    _billTime = billTime;
    
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:billTime.longLongValue / 1000.0];
//    
//    static NSDateFormatter *formatter = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        formatter = [[NSDateFormatter alloc] init];
//    });
//    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
//    [formatter setLocale:[NSLocale autoupdatingCurrentLocale]];
//    [formatter setDateFormat:@"yyyy-MM-dd"];
//    
//    self.billDate = [formatter stringFromDate:date];
}

- (void)setBillDate:(NSString *)billDate {
    _billDate = billDate;
    
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
    });
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setLocale:[NSLocale autoupdatingCurrentLocale]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [formatter dateFromString:billDate];
    self.billTime = @([date timeIntervalSince1970] * 1000.0);
}

- (void)setBillType:(ATBillType)billType {
    _billType = billType;
    
//    self.billTypeName = [ATBillProcessTool fetchBillTypeNameWithBillType:billType];
}

- (void)setBillTypeName:(NSString *)billTypeName {
    _billTypeName = billTypeName;
    
    self.billType = [ATBillProcessTool fetchBillTypeWithBillTypeName:billTypeName];
}

- (void)setPayType:(ATBillPayType)payType {
    _payType = payType;
    
    self.payTypeName = [ATBillProcessTool fetchPayTypeNameWithPayType:payType];
}

@end
