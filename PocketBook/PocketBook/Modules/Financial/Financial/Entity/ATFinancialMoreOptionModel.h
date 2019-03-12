//
//  ATFinancialMoreOptionModel.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATFinancialModuleModel.h"

NS_ASSUME_NONNULL_BEGIN

static NSInteger const ATFinancialMoreOption_rowNum = 5;//!<每行元素个数
static CGFloat const ATFinancialMoreOption_edgeW = 15;//!<
#define ATFinancialMoreOption_mininum ([UIScreen mainScreen].bounds.size.width - ATFinancialModuleItem_W * ATFinancialMoreOption_rowNum - ATFinancialMoreOption_edgeW * 2) / (ATFinancialMoreOption_rowNum - 1)


@interface ATFinancialMoreOptionModel : NSObject

@property (nonatomic, strong) NSArray <ATFinancialModuleModel *>*dataSource;

@property (nonatomic, assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
