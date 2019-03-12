//
//  ATBaseTableViewCell.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATBaseTableViewCell.h"

@implementation ATBaseTableViewCell

+ (NSString *)cellReuseId {
    return NSStringFromClass([self class]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
