//
//  ATHomeBillCell.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@class ATBillModel;
@interface ATHomeBillCell : ATBaseTableViewCell

@property (nonatomic, strong) ATBillModel *billModel;

@end

NS_ASSUME_NONNULL_END
