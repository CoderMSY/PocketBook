//
//  ATFinancialViewController.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATFinancialViewController.h"
#import <Masonry/Masonry.h>

#import "ATFinancialPresenter.h"
#import "ATFinancialInteractor.h"
#import "ATFinancialView.h"
#import "ATFinancialViewProtocol.h"

@interface ATFinancialViewController () <ATFinancialViewProtocol>

@property (nonatomic, strong) ATFinancialView *financialView;

@end

@implementation ATFinancialViewController

#pragma mark - lifecycle methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        ATFinancialPresenter *presenter = [[ATFinancialPresenter alloc] init];
        ATFinancialInteractor *interactor = [[ATFinancialInteractor alloc] init];
        interactor.output = presenter;
        presenter.interactor = interactor;
        presenter.viewInterface = self;
        
        self.moduleInterface = presenter;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.financialView];
    [self initConstraints];
    
    [self.moduleInterface getFinancialDataSource];
}

#pragma mark - public methods


#pragma mark - private methods

- (void)initConstraints {
    [self.financialView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - ATFinancialViewInterface

- (void)showItemList:(NSArray *)itemList {
    self.financialView.itemList = itemList;
}

#pragma mark - ATFinancialViewProtocol

- (void)financialMoreOptionCell:(UITableViewCell *)cell selectModule:(ATFinancialModuleModel *)moduleModel {
    [self.moduleInterface pushProvidentInterfaceFromViewCtr:self title:@"公积金"];
}

#pragma mark - getter && setter

- (ATFinancialView *)financialView {
    if (!_financialView) {
        _financialView = [[ATFinancialView alloc] init];
    }
    return _financialView;
}

@end
