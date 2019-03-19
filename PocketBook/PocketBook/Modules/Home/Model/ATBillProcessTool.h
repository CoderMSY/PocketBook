//
//  ATBillProcessTool.h
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATBillConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATBillProcessTool : NSObject

+ (NSString *)fetchBillTypeNameWithBillType:(ATBillType)billType;
+ (ATBillType)fetchBillTypeWithBillTypeName:(NSString *)typeName;

+ (NSString *)fetchPayTypeNameWithPayType:(ATBillPayType)payType;

@end

NS_ASSUME_NONNULL_END
