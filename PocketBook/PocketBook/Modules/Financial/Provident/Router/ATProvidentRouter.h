//
//  ATProvidentRouter.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/8.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ATProvidentPresenter;
@interface ATProvidentRouter : NSObject

@property (nonatomic, strong) ATProvidentPresenter *presenter;

- (void)pushProvidentInterfaceFromViewCtr:(UIViewController *)viewCtr
                                    title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
