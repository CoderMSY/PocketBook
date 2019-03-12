//
//  ATFinancialViewInterface.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ATFinancialViewInterface <NSObject>

- (void)showItemList:(NSArray *)itemList;

@end

NS_ASSUME_NONNULL_END
