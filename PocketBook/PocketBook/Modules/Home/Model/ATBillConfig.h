//
//  ATBillConfig.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#ifndef ATBillConfig_h
#define ATBillConfig_h


/**
 账单类型
 */
typedef NS_ENUM(NSUInteger, ATBillType) {
    ATBillType_unknow = 0,//!<未知
    ATBillType_eatAndDrink,
    ATBillType_breakFast,
    ATBillType_lunch,
    ATBillType_dinner,
    ATBillType_traffic,
    ATBillType_shopping,
    ATBillType_dress,//!<服饰
    ATBillType_outdoor,
    ATBillType_entertainment,//!<娱乐
    ATBillType_redPacket,//!<红包
    ATBillType_waterAndElectricity,//!<水电
    ATBillType_alcoholAndTobacco,//!<烟酒
    ATBillType_fruit,//!<
    ATBillType_dailyNecessities,//!<日用品
    ATBillType_beauty,//!<美容
    ATBillType_housing,//!<住房
    ATBillType_communication,//!<通讯
    ATBillType_buyVegetables,//!<买菜
    ATBillType_learn,//!<学习
    ATBillType_travel,//!<旅游
    ATBillType_sport,//!<运动
    ATBillType_medical,//!<医疗
    ATBillType_creditCard,//!<信用卡
    ATBillType_antCreditPay,//!<花呗
    ATBillType_baitiao,//!<白条
};

/**
 账单支付类型
 */
typedef NS_ENUM(NSUInteger, ATBillPayType) {
    ATBillPayType_unknow,
    ATBillPayType_cash,
    ATBillPayType_weChatPay,
    ATBillPayType_alipay,
    ATBillPayType_creditCard,//!<信用卡
    ATBillPayType_debitCard,//!<储蓄卡
};

typedef NS_ENUM(NSUInteger, ATBillInOutType) {
    ATBillInOutType_income,//!<收入
    ATBillInOutType_payout,//!<支出
};

#endif /* ATBillConfig_h */
