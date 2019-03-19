//
//  ATHomeView.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/18.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATHomeView.h"
#import <Masonry/Masonry.h>
#import "UIScrollView+ATRefresh.h"

#import "ATHomeHeadView.h"
#import "ATHomeBillDayHeaderView.h"
#import "ATHomeBillCell.h"
#import "ATBillModel.h"
#import "ATBillDayModel.h"

@interface ATHomeView () <UITableViewDataSource, UITableViewDelegate>
{
    NSInteger _currentPage;
}
@property (nonatomic, strong) ATHomeHeadView *headView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ATHomeView

#pragma mark - lifecycle methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headView];
        [self addSubview:self.tableView];
        [self.tableView at_addRefreshHeader:^{
            self->_currentPage = 1;
            if ([self.delegate respondsToSelector:@selector(homeView:headerRefreshActionWithPage:)]) {
                [self.delegate homeView:self headerRefreshActionWithPage:self->_currentPage];
            }
        } footer:^{
            ++self->_currentPage;
            if ([self.delegate respondsToSelector:@selector(homeView:footerRefreshActionWithPage:)]) {
                [self.delegate homeView:self footerRefreshActionWithPage:self->_currentPage];
            }
        }];
        
        [self initConstraints];
    }
    return self;
}

#pragma mark - public methods

- (void)setDataSource:(NSMutableArray<ATBillDayModel *> *)dataSource {
    _dataSource = dataSource;
    
    [self.tableView reloadData];
}

- (void)setCurrenMonthModel:(ATBillMonthModel *)currenMonthModel {
    _currenMonthModel = currenMonthModel;
    
    self.headView.monthModel = currenMonthModel;
}

- (void)startHeaderRefreshingState {
    [self.tableView.mj_header beginRefreshing];
}

- (void)stopHeaderRefreshingState {
    [self.tableView.mj_header endRefreshing];
}

- (void)stopFooterRefreshingStateWithIsHadContent:(BOOL)isHadContent {
    [self.tableView.mj_footer endRefreshing];
    if (!isHadContent) {
        if (_currentPage > 1) {
            _currentPage --;//没有刷新到数据，应减1
        }
    }
}

#pragma mark - private methods

- (void)initConstraints {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    ATLog(@"size:%@", NSStringFromCGSize(size));
    CGFloat headView_h;
    if (AT_IS_IPHONE_X || AT_IS_IPHONE_XRorXSMax) {
        headView_h = 202.0;/// 375.0 *
    }
    else {
        headView_h = 202;
    }
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.height.mas_equalTo(headView_h);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headView.mas_bottom);
        make.left.bottom.right.mas_equalTo(self);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource[section].billArrs.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATBillDayModel *sectionModel = self.dataSource[indexPath.section];
    ATBillModel *model = sectionModel.billArrs[indexPath.row];
    ATHomeBillCell *cell = [tableView dequeueReusableCellWithIdentifier:[ATHomeBillCell cellReuseId]];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", model.billTypeName, model.payout];
    cell.billModel = model;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ATHomeBillDayHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[ATHomeBillDayHeaderView headerViewReuseId]];
    
    ATBillDayModel *sectionModel = self.dataSource[section];
    headerView.sectionModel = sectionModel;
    
    return headerView;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 58.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.000001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - getter && setter

- (ATHomeHeadView *)headView {
    if (!_headView) {
        _headView = [[ATHomeHeadView alloc] init];
    }
    return _headView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[ATHomeBillDayHeaderView class] forHeaderFooterViewReuseIdentifier:[ATHomeBillDayHeaderView headerViewReuseId]];
        [_tableView registerClass:[ATHomeBillCell class] forCellReuseIdentifier:[ATHomeBillCell cellReuseId]];
    }
    return _tableView;
}

@end
