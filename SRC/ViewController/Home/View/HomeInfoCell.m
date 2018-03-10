//
//  HomeInfoCell.m
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/10.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import "HomeInfoCell.h"

@implementation HomeInfoCell
{
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *name1;
    __weak IBOutlet UILabel *desc1;
    __weak IBOutlet UIImageView *icon1;
    __weak IBOutlet UILabel *name2;
    __weak IBOutlet UILabel *desc2;
    __weak IBOutlet UIImageView *icon2;
    
}
- (void)setModel:(HomeInfoModel *)model{
    _model = model;
    
    titleLabel.text = _model.name;
    name1.text = _model.title_left;
    desc1.text = _model.desc_left;
    name2.text = _model.title_right;
    desc2.text = _model.desc_right;
    [icon1 sd_setImageWithURL:[NSURL URLWithString:_model.icon_left] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    [icon2 sd_setImageWithURL:[NSURL URLWithString:_model.icon_left] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
}

@end
