//
//  ATFinancialInteractorIO.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ATFinancialInteractorInput <NSObject>

- (void)findFinancialDataSource;

@end

@protocol ATFinancialInteractorOutput <NSObject>

- (void)foundFinancialDataSource:(NSArray *)dataSource;

@end

NS_ASSUME_NONNULL_END
