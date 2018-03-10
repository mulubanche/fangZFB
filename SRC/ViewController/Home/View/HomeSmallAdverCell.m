//
//  HomeSmallAdverCell.m
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/10.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import "HomeSmallAdverCell.h"

@implementation HomeSmallAdverCell
{
    __weak IBOutlet UIImageView *icon;
}
- (void)setModel:(HomeSamllModel *)model{
    _model = model;
    [icon sd_setImageWithURL:[NSURL URLWithString:_model.iconurl] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
}

@end
