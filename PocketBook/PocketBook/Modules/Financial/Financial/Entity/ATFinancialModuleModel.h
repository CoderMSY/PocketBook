//
//  ATFinancialModuleModel.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/6.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static CGFloat const ATFinancialModuleIcon_w = 25.0f;//!< 图片大小
static CGFloat const ATFinancialModuleItem_magin = 7.5f;//!<icon 和 title间预估间距
static CGFloat const ATFinancialModuleTilte_fontSize = 15.0;//!<标题字号

#define ATFinancialModuleItem_W (ATFinancialModuleIcon_w * 2) //!<collectViewCell宽度
#define ATFinancialModuleItem_H (ATFinancialModuleIcon_w + ATFinancialModuleItem_magin + ATFinancialModuleTilte_fontSize + 3) //!<collectViewCell高度

@interface ATFinancialModuleModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *iconPath;
//@property (nonatomic, strong) UIFont *titleFont;

@end

NS_ASSUME_NONNULL_END
