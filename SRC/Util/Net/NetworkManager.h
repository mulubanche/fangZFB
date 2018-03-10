//
//  NetworkManager.h
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/10.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CommonCompletion)(NSError *error, id object);

@interface NetWorkResponse : NSObject
@property (strong,nonatomic) NSString *message;
@property (strong,nonatomic) id data;
@property (strong,nonatomic) NSNumber *code;
@end

@interface NetworkManager : NSObject

//+ (id) shareManger;

- (void) getThisLocalityDataWithApi:(NSString *)apiName completeBlock:(CommonCompletion)completionBlock;

@end
