//
//  HomeNewMegCell.m
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/10.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import "HomeNewMegCell.h"

@implementation HomeNewMegCell
{
    __weak IBOutlet UIImageView *icon;
    __weak IBOutlet UILabel *desc;
}

- (void)setModel:(HomeNewMsgModel *)model{
    _model = model;
    desc.text = _model.desc;
    [icon sd_setImageWithURL:[NSURL URLWithString:_model.iconurl] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
}

@end
