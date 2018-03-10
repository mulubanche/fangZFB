//
//  HomeManager.m
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/10.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import "HomeManager.h"
#import "HomeAllModel.h"

@implementation HomeManager

- (instancetype)init{
    if (self = [super init]) {
        self.homeInfoList = [NSMutableArray array];
        self.homeItemsList = [NSMutableArray array];
    }
    return self;
}

+ (HomeManager *)shareManger{
    static HomeManager *manager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[HomeManager alloc] init];
    });
    return manager;
}

- (void) getHomeInfoWithApi:(NSString *)apiName completeBlock:(CommonCompletion)completionBlock{
    [self getThisLocalityDataWithApi:apiName completeBlock:^(NSError *error, id object) {
        if (object) {
            [self.homeInfoList removeAllObjects];
            NetWorkResponse *res = (NetWorkResponse *)object;
            HomeNewMsgModel *news = [HomeNewMsgModel mj_objectWithKeyValues:res.data[@"news"]];
            HomeSamllModel *small = [HomeSamllModel mj_objectWithKeyValues:res.data[@"small"]];
            HomeBigModel *big = [HomeBigModel mj_objectWithKeyValues:res.data[@"big"]];
            NSArray *list = [HomeInfoModel mj_objectArrayWithKeyValuesArray:res.data[@"list"]];
            [self.homeInfoList addObject:news];
            [self.homeInfoList addObject:small];
            for (id item in list) [self.homeInfoList addObject:item];
            [self.homeInfoList addObject:big];
        }
        if(completionBlock) completionBlock(error, object);
    }];
}

- (void)getHomeItemsListWithApi:(NSString *)apiName completeBlock:(CommonCompletion)completionBlock{
    [self getThisLocalityDataWithApi:apiName completeBlock:^(NSError *error, id object) {
        if (object) {
            NetWorkResponse *res = (NetWorkResponse *)object;
            self.homeItemsList = [HomeFunctionItemModel mj_objectArrayWithKeyValuesArray:res.data];
        }
        if(completionBlock) completionBlock(error, object);
    }];
}


@end
