//
//  ATHomeBillDayHeaderView.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ATBillDayModel;
@interface ATHomeBillDayHeaderView : UITableViewHeaderFooterView

+ (NSString *)headerViewReuseId;
@property (nonatomic, strong) ATBillDayModel *sectionModel;

@end

NS_ASSUME_NONNULL_END
