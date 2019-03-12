//
//  ATFinancialInteractor.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATFinancialInteractor.h"
#import "ATFinancialMoreOptionModel.h"

@implementation ATFinancialInteractor

#pragma mark - ATFinancialInteractorInput

- (void)findFinancialDataSource {
    NSMutableArray *dataSource = [NSMutableArray arrayWithCapacity:0];
    
    ATFinancialMoreOptionModel *optionModel = [[ATFinancialMoreOptionModel alloc] init];
    
    NSMutableArray *moduleMutArr = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i < 16; i ++) {
        ATFinancialModuleModel *moduleModel = [[ATFinancialModuleModel alloc] init];
        moduleModel.title = @"公文";//@"公积金";
        moduleModel.iconPath = @"financial_module_gjj";
        [moduleMutArr addObject:moduleModel];
    }
    optionModel.dataSource = moduleMutArr;
    
    [dataSource addObject:optionModel];
    
    [self.output foundFinancialDataSource:dataSource];
}

@end
