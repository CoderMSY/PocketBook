//
//  UIScrollView+ATRefresh.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "UIScrollView+ATRefresh.h"

@implementation UIScrollView (ATRefresh)

- (void)at_addRefreshHeader:(void (^)(void))blockH footer:(void (^)(void))blockF {
    @weakify(self);
    [self at_addRefreshHeader:^{
        if (blockH) blockH();
    } endRefresh:^{
        @strongify(self);
        if (!self.mj_footer) {
            [self at_addRefreshFooter:^{
                if (blockF) blockF();
            }];
        }
    }];
}

- (void)at_addRefreshHeader:(void (^)(void))block {
    [self at_addRefreshHeader:block endRefresh:nil];
}

- (void)at_addRefreshHeader:(void (^)(void))block endRefresh:(void (^)(void))endRefresh {
    
    @weakify(self);
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        BOOL isRefresh = self.mj_footer.state == MJRefreshStateRefreshing || self.mj_footer.state == MJRefreshStateWillRefresh || self.mj_footer.state == MJRefreshStatePulling;
        if (isRefresh) {
            [self.mj_header endRefreshing];
            return;
        }
        if (block) block();
    }];
    [refreshHeader setEndRefreshingCompletionBlock:^{
        if (endRefresh) endRefresh();
    }];
    
    refreshHeader.lastUpdatedTimeLabel.hidden = YES;
    refreshHeader.stateLabel.font = [UIFont systemFontOfSize:12];
    refreshHeader.stateLabel.textColor = [UIColor lightGrayColor];
    
    self.mj_header = refreshHeader;
}

- (void)at_addRefreshFooter:(void (^)(void))block {
    
    @weakify(self);
    MJRefreshAutoNormalFooter *refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        BOOL isRefresh = self.mj_header.state == MJRefreshStateRefreshing || self.mj_header.state == MJRefreshStateWillRefresh || self.mj_header.state == MJRefreshStatePulling;
        if (isRefresh) {
            [self.mj_footer endRefreshing];
            return;
        }
        if (block) block();
    }];
    
    refreshFooter.automaticallyChangeAlpha = YES;
    refreshFooter.stateLabel.font = [UIFont systemFontOfSize:12];
    refreshFooter.stateLabel.textColor = [UIColor lightGrayColor];
    [refreshFooter setTitle:@"别扯了，已经到底了~" forState:MJRefreshStateNoMoreData];
    
    self.mj_footer = refreshFooter;
}

@end
