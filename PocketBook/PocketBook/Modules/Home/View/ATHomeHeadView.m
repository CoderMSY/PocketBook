//
//  ATHomeHeadView.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/18.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATHomeHeadView.h"
#import <Masonry/Masonry.h>
#import <DateTools/DateTools.h>
#import "UIButton+ATHelper.h"
#import "UILabel+ATHelper.h"

#import "ATBillMonthModel.h"

@interface ATHomeHeadView ()

@property (nonatomic, strong) UIImageView *bgIV;
@property (nonatomic, strong) UILabel *surplusLab;
@property (nonatomic, strong) UIButton *surplusBtn;//!<结余值
@property (nonatomic, strong) UILabel *monthPayoutLab;
@property (nonatomic, strong) UILabel *monthIncomeLab;

@end

@implementation ATHomeHeadView

#pragma mark - lifecycle methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgIV];
        [self addSubview:self.surplusLab];
        [self addSubview:self.surplusBtn];
        [self addSubview:self.monthPayoutLab];
        [self addSubview:self.monthIncomeLab];
        
        [self initConstraints];
    }
    return self;
}


#pragma mark - public methods

- (void)setMonthModel:(ATBillMonthModel *)monthModel {
    _monthModel = monthModel;
    NSInteger month = monthModel.findMonthDate.month;
    self.surplusLab.text = [NSString stringWithFormat:@"%ld月预算结余（元）", (long)month];
    NSString *surplusTitle = [NSString stringWithFormat:@"￥ %.2f", 3000 - monthModel.monthPayout.floatValue];
    [self.surplusBtn setTitle:surplusTitle forState:UIControlStateNormal];
    self.monthPayoutLab.text = [NSString stringWithFormat:@"%ld月支出：￥%.2f", (long)month,  monthModel.monthPayout.floatValue];
    self.monthIncomeLab.text = [NSString stringWithFormat:@"%ld月收入：￥%.2f", (long)month,  monthModel.monthIncome.floatValue];
}


#pragma mark - private methods

- (void)initConstraints {
    [self.bgIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    [self.surplusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(70);
        make.left.mas_equalTo(self).offset(15);
        make.right.mas_lessThanOrEqualTo(self).offset(-15);
    }];
    [self.surplusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.surplusLab.mas_bottom).offset(15);
        make.left.mas_equalTo(self).offset(15);
        make.right.mas_lessThanOrEqualTo(self).offset(-15);
    }];
    [self.monthPayoutLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.surplusBtn.mas_bottom).offset(22);
        make.left.mas_equalTo(self.surplusBtn);
        make.right.mas_lessThanOrEqualTo(self.mas_centerX).offset(-5);
    }];
    [self.monthIncomeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.monthPayoutLab);
        make.left.mas_equalTo(self.mas_centerX).offset(10);
        make.right.mas_lessThanOrEqualTo(self).offset(-15);
    }];
}

- (void)surplusBtnClicked:(UIButton *)btn {
    
}

#pragma mark - getter && setter

- (UIImageView *)bgIV {
    if (!_bgIV) {
        _bgIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_head_bg"]];
    }
    return _bgIV;
}

- (UILabel *)surplusLab {
    if (!_surplusLab) {
        _surplusLab = [UILabel at_labelWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:14]];
    }
    return _surplusLab;
}

- (UIButton *)surplusBtn {
    if (!_surplusBtn) {
        _surplusBtn = [UIButton at_buttonWithTarget:self action:@selector(surplusBtnClicked:) titleFont:[UIFont boldSystemFontOfSize:30] titleColor:[UIColor whiteColor] title:@"￥ 100000.99"];
    }
    return _surplusBtn;
}

- (UILabel *)monthPayoutLab {
    if (!_monthPayoutLab) {
        _monthPayoutLab = [UILabel at_labelWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:14]];
    }
    return _monthPayoutLab;
}

- (UILabel *)monthIncomeLab {
    if (!_monthIncomeLab) {
        _monthIncomeLab = [UILabel at_labelWithTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:14]];
    }
    return _monthIncomeLab;
}

@end
