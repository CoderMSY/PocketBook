//
//  ATFinancialView.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATFinancialView.h"
#import <Masonry/Masonry.h>

#import "ATFinancialMoreOptionModel.h"
#import "ATFinancialMoreOptionCell.h"

@interface ATFinancialView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ATFinancialView

#pragma mark - lifecycle methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
        
        [self initConstraints];
    }
    return self;
}

#pragma mark - public methods

- (void)setItemList:(NSArray *)itemList {
    _itemList = itemList;
    
    [self.tableView reloadData];
}

#pragma mark - private methods

- (void)initConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.itemList[indexPath.row];
    if ([model isKindOfClass:[ATFinancialMoreOptionModel class]]) {
        ATFinancialMoreOptionCell *cell = [tableView dequeueReusableCellWithIdentifier:[ATFinancialMoreOptionCell cellReuseId]];
        cell.optionModel = model;
        
        return cell;
    }
    else {
        ATBaseTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:[ATBaseTableViewCell cellReuseId]];
        
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemList.count;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.itemList[indexPath.row];
    if ([model isKindOfClass:[ATFinancialMoreOptionModel class]]) {
        ATFinancialMoreOptionModel *optionModel = (ATFinancialMoreOptionModel *)model;
        
        return optionModel.cellHeight;
    }
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - getter && setter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[ATFinancialMoreOptionCell class] forCellReuseIdentifier:[ATFinancialMoreOptionCell cellReuseId]];
        [_tableView registerClass:[ATBaseTableViewCell class] forCellReuseIdentifier:[ATBaseTableViewCell cellReuseId]];
    }
    return _tableView;
}

@end
