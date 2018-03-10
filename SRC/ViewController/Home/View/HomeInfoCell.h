//
//  HomeInfoCell.h
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/10.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeAllModel.h"

static NSString * const HomeInfoCellId = @"HomeInfoCell";

@interface HomeInfoCell : UITableViewCell

@property (nonatomic, strong) HomeInfoModel *model;

@end
