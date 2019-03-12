//
//  ATFinancialMoreOptionModel.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATFinancialMoreOptionModel.h"

@implementation ATFinancialMoreOptionModel

- (void)setDataSource:(NSArray<ATFinancialModuleModel *> *)dataSource {
    _dataSource = dataSource;
    
    NSInteger rowCount = ceilf(dataSource.count * 1.0 / ATFinancialMoreOption_rowNum);
    if (rowCount > 0) {
        self.cellHeight = ATFinancialMoreOption_edgeW * 2 + rowCount * (ATFinancialModuleItem_H + ATFinancialMoreOption_mininum) - ATFinancialMoreOption_mininum;
    }
    else {
        self.cellHeight = 0;
    }
}

@end
