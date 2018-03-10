//
//  HomeAllModel.h
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/10.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HomeAllModel : NSObject

@property (nonatomic, strong) NSString *iconurl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *pid;

@property (nonatomic, assign) NSInteger type;

@end


@interface HomeFunctionItemModel : HomeAllModel


@end

@interface HomeNewMsgModel : HomeAllModel

@property (nonatomic, strong) NSString *desc;

@end

@interface HomeSamllModel : HomeAllModel

@end

@interface HomeBigModel : HomeAllModel

@end

@interface HomeInfoModel : HomeAllModel

@property (nonatomic, strong) NSString *title_left;
@property (nonatomic, strong) NSString *desc_left;
@property (nonatomic, strong) NSString *icon_left;
@property (nonatomic, strong) NSString *title_right;
@property (nonatomic, strong) NSString *desc_right;
@property (nonatomic, strong) NSString *icon_right;

@end

