//
//  ATFinancialModuleCell.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATBaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@class ATFinancialModuleModel;
@interface ATFinancialModuleCell : ATBaseCollectionViewCell

@property (nonatomic, strong) ATFinancialModuleModel *moduleModel;

@end

NS_ASSUME_NONNULL_END
