//
//  UIScrollView+ATRefresh.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (ATRefresh)

- (void)at_addRefreshHeader:(void(^)(void))block;
- (void)at_addRefreshFooter:(void(^)(void))block;
- (void)at_addRefreshHeader:(void(^)(void))blockH footer:(void(^)(void))blockF;

@end

NS_ASSUME_NONNULL_END
