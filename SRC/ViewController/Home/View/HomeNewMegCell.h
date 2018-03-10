//
//  HomeNewMegCell.h
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/10.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeAllModel.h"

static NSString * const HomeNewMegCellId = @"HomeNewMegCell";

@interface HomeNewMegCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (nonatomic, strong) HomeNewMsgModel *model;

@end
