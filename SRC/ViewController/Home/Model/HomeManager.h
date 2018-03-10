//
//  HomeManager.h
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/10.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import "NetworkManager.h"

#define HomeManagerIns [HomeManager shareManger]

@interface HomeManager : NetworkManager

+ (HomeManager *)shareManger;

@property (nonatomic, strong) NSMutableArray *homeInfoList;
- (void) getHomeInfoWithApi:(NSString *)apiName completeBlock:(CommonCompletion)completionBlock;

@property (nonatomic, strong) NSMutableArray *homeItemsList;
- (void) getHomeItemsListWithApi:(NSString *)apiName completeBlock:(CommonCompletion)completionBlock;

@end
