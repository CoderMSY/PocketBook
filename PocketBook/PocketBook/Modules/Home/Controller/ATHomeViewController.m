//
//  ATHomeViewController.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATHomeViewController.h"
#import <Masonry/Masonry.h>
#import "UINavigationController+FDFullscreenPopGesture.h"

#import "ATHomePresenter.h"
#import "ATHomeView.h"

@interface ATHomeViewController () <ATHomePresenterOutput, ATHomeViewDelegate>
{
    BOOL _isfooterRefresh;//!<是否为尾部刷新
    NSDate *_currentDate;
}
@property (nonatomic, strong) ATHomePresenter *presenter;
@property (nonatomic, strong) ATHomeView *homeView;
@property (nonatomic, strong) NSMutableArray *dataSource;//!<账单列表数据源
@property (nonatomic, strong) NSMutableDictionary *billMonthDict;//!<账单月份模型字段

@end

@implementation ATHomeViewController

#pragma mark - lifecycle methods

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;
    
    [self.view addSubview:self.homeView];
    [self initConstraints];
    
//    [self.presenter saveHistoryData];
    [self.homeView startHeaderRefreshingState];
}

#pragma mark - public methods


#pragma mark - private methods

- (void)initConstraints {
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - ATHomePresenterOutput

- (void)renderDataSource:(NSMutableArray <ATBillDayModel *>*)dataSource
          billMonthModel:(nonnull ATBillMonthModel *)billMonthModel
               isHadData:(BOOL)isHadData {
    if (isHadData) {
        self.homeView.dataSource = dataSource;
    }
    
    self.homeView.currenMonthModel = billMonthModel;
//    self.billMonthDict[billMonthModel] = billMonthModel;
    
    if (_isfooterRefresh) {
        [self.homeView stopFooterRefreshingStateWithIsHadContent:isHadData];
    }
    else {
        [self.homeView stopHeaderRefreshingState];
    }
}

#pragma mark - ATHomeViewDelegate

- (void)homeView:(ATHomeView *)homeView headerRefreshActionWithPage:(NSUInteger)pageIndex {
    _isfooterRefresh = NO;
    if (self.dataSource.count > 0) {
        [self.dataSource removeAllObjects];
    }
    _currentDate = [NSDate date];
    [self.presenter fetchBillListWithPageIndex:pageIndex
                                   currentDate:_currentDate
                                    dataSource:self.dataSource];
}

- (void)homeView:(ATHomeView *)homeView footerRefreshActionWithPage:(NSUInteger)pageIndex {
    _isfooterRefresh = YES;
    
    sleep(1.0);
    [self.presenter fetchBillListWithPageIndex:pageIndex
                                   currentDate:_currentDate
                                    dataSource:self.dataSource];
}

#pragma mark - getter && setter

- (ATHomePresenter *)presenter {
    if (!_presenter) {
        _presenter = [[ATHomePresenter alloc] init];
        _presenter.output = self;
    }
    return _presenter;
}

- (ATHomeView *)homeView {
    if (!_homeView) {
        _homeView = [[ATHomeView alloc] init];
        _homeView.delegate = self;
    }
    return _homeView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}

- (NSMutableDictionary *)billMonthDict {
    if (!_billMonthDict) {
        _billMonthDict = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _billMonthDict;
}

@end
