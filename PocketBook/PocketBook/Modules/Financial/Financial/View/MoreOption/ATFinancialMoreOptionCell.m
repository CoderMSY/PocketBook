//
//  ATFinancialMoreOptionCell.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATFinancialMoreOptionCell.h"
#import <Masonry/Masonry.h>
#import "UIView+ATKit.h"

#import "ATFinancialMoreOptionModel.h"
#import "ATFinancialModuleCell.h"
#import "ATFinancialViewProtocol.h"

@interface ATFinancialMoreOptionCell () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ATFinancialMoreOptionCell

#pragma mark - lifecycle methods

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.collectionView];
        
        [self initConstraints];
    }
    
    return self;
}

#pragma mark - public methods

- (void)setOptionModel:(ATFinancialMoreOptionModel *)optionModel {
    _optionModel = optionModel;
    
    [self.collectionView reloadData];
}

#pragma mark - private methods

- (void)initConstraints {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.optionModel.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ATFinancialModuleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ATFinancialModuleCell cellReuseId] forIndexPath:indexPath];
    cell.moduleModel = self.optionModel.dataSource[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *ctr = self.at_viewController;
    if ([ctr respondsToSelector:@selector(financialMoreOptionCell:selectModule:)]) {
        [(id<ATFinancialViewProtocol>)ctr financialMoreOptionCell:self selectModule:self.optionModel.dataSource[indexPath.row]];
    }
}

#pragma mark - getter && setter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        collectionViewFlowLayout.itemSize = CGSizeMake(ATFinancialModuleItem_W, ATFinancialModuleItem_H);
        
        CGFloat edge_w = ATFinancialMoreOption_edgeW;
//        NSInteger rowNum = ATFinancialMoreOption_rowNum;
        CGFloat mininum = ATFinancialMoreOption_mininum;

        collectionViewFlowLayout.minimumLineSpacing = mininum;
        collectionViewFlowLayout.minimumInteritemSpacing = mininum;
        
        collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(edge_w, edge_w, edge_w, edge_w);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewFlowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ATFinancialModuleCell class] forCellWithReuseIdentifier:[ATFinancialModuleCell cellReuseId]];
    }
    return _collectionView;
}


@end
