//
//  ATBaseCollectionViewCell.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATBaseCollectionViewCell.h"

@implementation ATBaseCollectionViewCell

+ (NSString *)cellReuseId {
    return NSStringFromClass([self class]);
}

@end
