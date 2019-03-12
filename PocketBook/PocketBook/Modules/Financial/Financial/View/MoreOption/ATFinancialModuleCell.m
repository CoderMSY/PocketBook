//
//  ATFinancialModuleCell.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATFinancialModuleCell.h"
#import <Masonry/Masonry.h>
#import "UIColor+ATHelper.h"
#import "UILabel+ATHelper.h"

#import "ATFinancialModuleModel.h"

@interface ATFinancialModuleCell ()

@property (nonatomic, strong) UIImageView *iconIV;
//@property (nonatomic, strong) UIButton *editBtn;
@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation ATFinancialModuleCell

#pragma mark - lifecycle methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLab];
        
        [self initConstraints];
    }
    return self;
}

#pragma mark - public methods

- (void)setModuleModel:(ATFinancialModuleModel *)moduleModel {
    _moduleModel = moduleModel;
    
    self.iconIV.image = [UIImage imageNamed:moduleModel.iconPath];
    self.titleLab.text = moduleModel.title;
}

#pragma mark - private methods

- (void)initConstraints {
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(ATFinancialModuleItem_W / 2);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_greaterThanOrEqualTo(self.iconIV.mas_bottom);
        make.centerX.mas_equalTo(self.contentView);
        make.left.mas_greaterThanOrEqualTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView);
        make.right.mas_lessThanOrEqualTo(self.contentView);
    }];
}

#pragma mark - getter && setter

- (UIImageView *)iconIV {
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc] init];
        _iconIV.userInteractionEnabled = YES;
    }
    return _iconIV;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel at_labelWithTextColor:[UIColor at_fontBlackColor] font:[UIFont systemFontOfSize:ATFinancialModuleTilte_fontSize]];
    }
    return _titleLab;
}

@end
