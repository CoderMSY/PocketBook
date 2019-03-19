//
//  ATHomeBillDayHeaderView.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATHomeBillDayHeaderView.h"
#import <Masonry/Masonry.h>
#import "UILabel+ATHelper.h"
#import "UIColor+ATHelper.h"

#import "ATBillDayModel.h"

@interface ATHomeBillDayHeaderView ()

@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UILabel *payoutLab;
@property (nonatomic, strong) UILabel *incomeLab;

@end

@implementation ATHomeBillDayHeaderView

#pragma mark - lifecycle methods

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
//        self.contentView.backgroundColor = [UIColor at_bgGrayColor];
        [self.contentView addSubview:self.dateLab];
        [self.contentView addSubview:self.payoutLab];
        [self.contentView addSubview:self.incomeLab];
        
        [self initConstraits];
    }
    return self;
}

#pragma mark - public methods

+ (NSString *)headerViewReuseId {
    return NSStringFromClass([self class]);
}

- (void)setSectionModel:(ATBillDayModel *)sectionModel {
    _sectionModel = sectionModel;
    
    self.dateLab.text = sectionModel.dayDate;
    self.payoutLab.text = sectionModel.dayPayout;
    self.incomeLab.text = sectionModel.dayIncome;
}

#pragma mark - private methods

- (void)initConstraits {
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(20);
        make.right.mas_lessThanOrEqualTo(self.payoutLab.mas_left).offset(15);
    }];
    [self.payoutLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.incomeLab.mas_left).offset(-20);
    }];
    [self.incomeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-20);
    }];
}

#pragma mark - getter && setter

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [UILabel at_labelWithTextColor:[UIColor at_fontDarkGrayColor] font:[UIFont systemFontOfSize:13]];
    }
    return _dateLab;
}

- (UILabel *)payoutLab {
    if (!_payoutLab) {
        _payoutLab = [UILabel at_labelWithTextColor:[UIColor at_fontDarkGrayColor] font:[UIFont systemFontOfSize:13]];
    }
    return _payoutLab;
}

- (UILabel *)incomeLab {
    if (!_incomeLab) {
        _incomeLab = [UILabel at_labelWithTextColor:[UIColor at_fontDarkGrayColor] font:[UIFont systemFontOfSize:13]];
    }
    return _incomeLab;
}


@end
