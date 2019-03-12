//
//  ATFinancialModuleInterface.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ATFinancialModuleInterface <NSObject>

/**
 获取financial列表数据源
 */
- (void)getFinancialDataSource;

- (void)pushProvidentInterfaceFromViewCtr:(UIViewController *)viewCtr
                                    title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
