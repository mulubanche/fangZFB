//
//  FunctionMoreView.h
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/9.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeAllModel.h"

typedef void(^functionMoreViewBlock)(NSInteger);

@interface FunctionItemView : UIView

@property (strong, nonatomic)  UIImageView *icon;
@property (strong, nonatomic)  UILabel *titleLabel;
@property (strong, nonatomic)  UIButton *clickButton;

@end

@interface FunctionMoreView : UIView

@property (nonatomic, strong) NSArray *sourceData;
@property (nonatomic, strong) functionMoreViewBlock block;

- (void) setFunctionMoreViewBlock:(functionMoreViewBlock)block;

@end
