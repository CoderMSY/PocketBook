//
//  ATHomeView.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/18.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ATHomeView;
@class ATBillDayModel;
@class ATBillMonthModel;
@protocol ATHomeViewDelegate <NSObject>

- (void)homeView:(ATHomeView *)homeView headerRefreshActionWithPage:(NSUInteger)pageIndex;
- (void)homeView:(ATHomeView *)homeView footerRefreshActionWithPage:(NSUInteger)pageIndex;

@end
@interface ATHomeView : UIView

@property (nonatomic, weak) id <ATHomeViewDelegate>delegate;
@property (nonatomic, strong) NSMutableArray <ATBillDayModel *>*dataSource;
@property (nonatomic, strong) ATBillMonthModel *currenMonthModel;

- (void)startHeaderRefreshingState;
- (void)stopHeaderRefreshingState;
- (void)stopFooterRefreshingStateWithIsHadContent:(BOOL)isHadContent;

@end

NS_ASSUME_NONNULL_END
