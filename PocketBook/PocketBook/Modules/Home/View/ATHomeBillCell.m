//
//  ATHomeBillCell.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATHomeBillCell.h"
#import <Masonry/Masonry.h>
#import "UILabel+ATHelper.h"
#import "UIColor+ATHelper.h"

#import "ATBillModel.h"

@interface ATHomeBillCell ()

@property (nonatomic, strong) UIImageView *headIV;
@property (nonatomic, strong) UILabel *billTypeLab;
@property (nonatomic, strong) UILabel *remakLab;
@property (nonatomic, strong) UILabel *acountLab;

@end

@implementation ATHomeBillCell

#pragma mark - lifecycle methods

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headIV];
        [self.contentView addSubview:self.billTypeLab];
        [self.contentView addSubview:self.remakLab];
        [self.contentView addSubview:self.acountLab];
        
        [self initConstraints];
    }
    
    return self;
}

#pragma mark - public methods

- (void)setBillModel:(ATBillModel *)billModel {
    _billModel = billModel;
    
    self.headIV.image = [UIImage imageNamed:@"billType_icon_10001"];
    self.billTypeLab.text = billModel.billTypeName;
    self.remakLab.text = billModel.remark;
    
    NSString *acount;
    UIColor *acountColor;
    if (ATBillInOutType_payout == billModel.inOutType) {
        acount = [NSString stringWithFormat:@"-%.2f", billModel.payout.floatValue];
        acountColor = [UIColor at_colorWithHex:0x2d0b42];
    }
    else {
        acount = [NSString stringWithFormat:@"+%.2f", billModel.income.floatValue];
        acountColor = [UIColor at_colorWithHex:0x38C38C];
    }
    self.acountLab.text = acount;
    self.acountLab.textColor = acountColor;
    
    CGFloat margin = 18.0;
    if (0 == billModel.remark.length || [billModel.remark isEqualToString:@" "]) {
        [self.billTypeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(self.headIV.mas_right).offset(margin);
            make.right.mas_lessThanOrEqualTo(self.acountLab.mas_left).offset(-margin / 2);
        }];
        self.remakLab.hidden = YES;
    }
    else {
        [self.billTypeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView.mas_centerY).offset(-2);
            make.left.mas_equalTo(self.headIV.mas_right).offset(margin);
            make.right.mas_lessThanOrEqualTo(self.acountLab.mas_left).offset(-margin / 2);
        }];
        [self.remakLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_centerY).offset(2);
            make.left.mas_equalTo(self.headIV.mas_right).offset(margin);
            make.right.mas_lessThanOrEqualTo(self.acountLab.mas_left).offset(-margin / 2);
        }];
        
        self.remakLab.hidden = NO;
    }
}

#pragma mark - private methods

- (void)initConstraints {
    CGFloat margin = 18.0;
    [self.headIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(margin);
        make.size.mas_equalTo(30);
    }];
    [self.billTypeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_centerY).offset(-2);
        make.left.mas_equalTo(self.headIV.mas_right).offset(margin);
        make.right.mas_lessThanOrEqualTo(self.acountLab.mas_left).offset(-margin / 2);
    }];
    [self.remakLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_centerY).offset(2);
        make.left.mas_equalTo(self.headIV.mas_right).offset(margin);
        make.right.mas_lessThanOrEqualTo(self.acountLab.mas_left).offset(-margin / 2);
    }];
    [self.acountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-margin);
    }];
}

#pragma mark - getter && setter

- (UIImageView *)headIV {
    if (!_headIV) {
        _headIV = [[UIImageView alloc] init];
    }
    return _headIV;
}

- (UILabel *)billTypeLab {
    if (!_billTypeLab) {
        _billTypeLab = [UILabel at_labelWithTextColor:[UIColor at_fontBlackColor] font:[UIFont systemFontOfSize:17]];
    }
    return _billTypeLab;
}

- (UILabel *)remakLab {
    if (!_remakLab) {
        _remakLab = [UILabel at_labelWithTextColor:[UIColor at_fontLightGrayColor] font:[UIFont systemFontOfSize:14]];
    }
    return _remakLab;
}

- (UILabel *)acountLab {
    if (!_acountLab) {
        _acountLab = [UILabel at_labelWithTextColor:[UIColor at_fontDarkGrayColor] font:[UIFont boldSystemFontOfSize:20]];
    }
    return _acountLab;
}

@end
