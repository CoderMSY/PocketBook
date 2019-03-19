//
//  ATBillProcessTool.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATBillProcessTool.h"

@implementation ATBillProcessTool

+ (NSString *)fetchBillTypeNameWithBillType:(ATBillType)billType {
    NSString *name;
    switch (billType) {
        case ATBillType_eatAndDrink:
            name = @"吃喝";
            break;
        case ATBillType_breakFast:
            name = @"早餐";
            break;
        case ATBillType_lunch:
            name = @"午餐";
            break;
        case ATBillType_dinner:
            name = @"晚餐";
            break;
        case ATBillType_traffic:
            name = @"交通";
            break;
        case ATBillType_shopping:
            name = @"购物";
            break;
        case ATBillType_dress:
            name = @"服饰";
            break;
        case ATBillType_outdoor:
            name = @"户外";
            break;
        case ATBillType_entertainment:
            name = @"娱乐";
            break;
        case ATBillType_redPacket:
            name = @"红包";
            break;
        case ATBillType_waterAndElectricity:
            name = @"水电";
            break;
        case ATBillType_alcoholAndTobacco:
            name = @"烟酒";
            break;
        case ATBillType_beauty:
            name = @"美容";
            break;
        case ATBillType_housing:
            name = @"住房";
            break;
        case ATBillType_communication:
            name = @"通讯";
            break;
        case ATBillType_buyVegetables:
            name = @"买菜";
            break;
        case ATBillType_learn:
            name = @"学习";
            break;
        case ATBillType_travel:
            name = @"旅游";
            break;
        case ATBillType_sport:
            name = @"运动";
            break;
        case ATBillType_medical:
            name = @"医疗";
            break;
        case ATBillType_creditCard:
            name = @"信用卡";
            break;
        case ATBillType_antCreditPay:
            name = @"花呗";
            break;
        case ATBillType_baitiao:
            name = @"白条";
            break;
            
        default:
            name = @"未知";
            break;
    }
    
    return name;
}

+ (ATBillType)fetchBillTypeWithBillTypeName:(NSString *)typeName {
    ATBillType billType;
    if ([typeName isEqualToString:@"吃喝"]) {
        billType = ATBillType_eatAndDrink;
    }
    else if ([typeName isEqualToString:@"早餐"]) {
        billType = ATBillType_breakFast;
    }
    else if ([typeName isEqualToString:@"午餐"]) {
        billType = ATBillType_lunch;
    }
    else if ([typeName isEqualToString:@"晚餐"]) {
        billType = ATBillType_dinner;
    }
    else if ([typeName isEqualToString:@"交通"]) {
        billType = ATBillType_traffic;
    }
    else if ([typeName isEqualToString:@"购物"]) {
        billType = ATBillType_shopping;
    }
    else if ([typeName isEqualToString:@"服饰"]) {
        billType = ATBillType_dress;
    }
    else if ([typeName isEqualToString:@"户外"]) {
        billType = ATBillType_outdoor;
    }
    else if ([typeName isEqualToString:@"娱乐"]) {
        billType = ATBillType_entertainment;
    }
    else if ([typeName isEqualToString:@"红包"]) {
        billType = ATBillType_redPacket;
    }
    else if ([typeName isEqualToString:@"水电"]) {
        billType = ATBillType_waterAndElectricity;
    }
    else if ([typeName isEqualToString:@"烟酒"]) {
        billType = ATBillType_alcoholAndTobacco;
    }
    else if ([typeName isEqualToString:@"美容"]) {
        billType = ATBillType_beauty;
    }
    else if ([typeName isEqualToString:@"住房"]) {
        billType = ATBillType_housing;
    }
    else if ([typeName isEqualToString:@"通讯"]) {
        billType = ATBillType_communication;
    }
    else if ([typeName isEqualToString:@"买菜"]) {
        billType = ATBillType_buyVegetables;
    }
    else if ([typeName isEqualToString:@"学习"]) {
        billType = ATBillType_learn;
    }
    else if ([typeName isEqualToString:@"旅游"]) {
        billType = ATBillType_travel;
    }
    else if ([typeName isEqualToString:@"运动"]) {
        billType = ATBillType_sport;
    }
    else if ([typeName isEqualToString:@"医疗"]) {
        billType = ATBillType_medical;
    }
    else if ([typeName isEqualToString:@"信用卡"]) {
        billType = ATBillType_creditCard;
    }
    else if ([typeName isEqualToString:@"花呗"]) {
        billType = ATBillType_antCreditPay;
    }
    else if ([typeName isEqualToString:@"白条"]) {
        billType = ATBillType_baitiao;
    }
    else {
        billType = ATBillType_unknow;
    }
    
    return billType;
}

+ (NSString *)fetchPayTypeNameWithPayType:(ATBillPayType)payType {
    NSString *name;
    switch (payType) {
        case ATBillPayType_cash:
            name = @"现金";
            break;
        case ATBillPayType_weChatPay:
            name = @"微信支付";
            break;
        case ATBillPayType_alipay:
            name = @"支付宝";
            break;
        case ATBillPayType_creditCard:
            name = @"信用卡";
            break;
        case ATBillPayType_debitCard:
            name = @"储蓄卡";
            break;
            
        default:
            name = @"未知类型";
            break;
    }
    
    return name;
}

@end
