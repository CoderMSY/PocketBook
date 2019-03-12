//
//  ATFinancialViewProtocol.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ATFinancialModuleModel;
@protocol ATFinancialViewProtocol <NSObject>

@optional
- (void)financialMoreOptionCell:(UITableViewCell *)cell selectModule:(ATFinancialModuleModel *)moduleModel;

@end

NS_ASSUME_NONNULL_END
