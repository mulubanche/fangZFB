//
//  NetworkManager.m
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/10.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetWorkResponse

@end

@implementation NetworkManager

//+ (NetworkManager *) shareManger{
//    static dispatch_once_t once;
//    static NetworkManager *manager;
//    dispatch_once(&once, ^{
//        manager = [[NetworkManager alloc] init];
//    });
//    return manager;
//}

- (void) getThisLocalityDataWithApi:(NSString *)apiName completeBlock:(CommonCompletion)completionBlock{
    //获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:apiName ofType:@"geojson"];
    //根据文件路径读取数据
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    if (jdata.length) {
        //格式化成json数据
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jdata options:kNilOptions error:nil];
        NetWorkResponse * response = [NetWorkResponse mj_objectWithKeyValues:jsonObject];
        if (completionBlock) {
            completionBlock(nil,response);
        }
    }else{
        if (completionBlock) {
            completionBlock(nil,nil);
        }
    }
}

@end
