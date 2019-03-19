//
//  ATDaoFactory.m
//  PocketBook
//
//  Created by SimonMiao on 2019/3/19.
//  Copyright © 2019 avatar. All rights reserved.
//

#import "ATDaoFactory.h"
#import <BGFMDB/BGFMDB.h>
#import "ATBillDaoImpl.h"

@interface ATDaoFactory ()

@property (nonatomic, strong) ATBillDaoImpl *billDaoImpl;

@end

@implementation ATDaoFactory

#pragma mark - lifecycle methods

ATSingletonM(DaoFactory)

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *homePath = NSHomeDirectory();
        ATLog(@"#####工厂单例初始化啦#####:%@",homePath);
        
//        ATUserModel *userModel = [[ATCurrentUserMgr shareInstance] getCurrentUserModel];
        [self setDBNameWithUserId:@"123"];
    }
    return self;
}

#pragma mark - public methods

- (id<ATBillDaoProtocol>)getBillDao {
    return self.billDaoImpl;
}

#pragma mark - private methods

- (void)setDBNameWithUserId:(NSString *)userId {
    if (0 == userId.length) {
        return;
    }
    
#if AT_DEV
    NSString *dbName = @"dev";
//    [NSString stringWithFormat:@"%@_%@",@"dev",userId];//测试数据库
#else
    NSString *dbName = @"product";
//    [NSString stringWithFormat:@"%@_%@",@"product",userId];//正式数据库
#endif
    NSString *pathComponent = [NSString stringWithFormat:@"%@", userId];
    NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:pathComponent];
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:fullPath];
    if (!isExist) {
        [[NSFileManager defaultManager] createDirectoryAtPath:fullPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    dbName = [NSString stringWithFormat:@"%@/%@", userId, dbName];
    bg_setDebug(NO);//BGFMDB日志信息
    bg_setSqliteName(dbName);
    
    
}

#pragma mark - getter && setter

- (ATBillDaoImpl *)billDaoImpl {
    if (!_billDaoImpl) {
        _billDaoImpl = [[ATBillDaoImpl alloc] init];
    }
    return _billDaoImpl;
}

@end
