//
//  FunctionMoreView.m
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/9.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import "FunctionMoreView.h"

@implementation FunctionItemView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void) createUI{
    CGSize size = self.frame.size;
    self.icon = [[UIImageView alloc] initWithFrame:CGRectMake((size.width-36)/2, 15, 36, 36)];
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.icon];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.icon.frame)+10, size.width, 20)];
    self.titleLabel.textColor = [UIColor colorWithRGB:color_black];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    self.clickButton = [[UIButton alloc] initWithFrame:self.bounds];
    [self addSubview:self.clickButton];
}

@end

@implementation FunctionMoreView

- (void)setSourceData:(NSArray *)sourceData{
    _sourceData = sourceData;
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    WeakSelf
    CGFloat w = SCREEN_WIDTH/4;
    for (int i=0; i<_sourceData.count; i++) {
        HomeFunctionItemModel *model = _sourceData[i];
        FunctionItemView *view = [[FunctionItemView alloc] initWithFrame:CGRectMake(w*(i%4), i/4*80, w, 80)];
        view.titleLabel.text = model.name;
        view.icon.image = [UIImage imageNamed:model.iconurl];
        [view.clickButton handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
            if(weakSelf.block) weakSelf.block(i);
        }];
        [self addSubview:view];
    }
    FunctionItemView *view = [[FunctionItemView alloc] initWithFrame:CGRectMake(w*(_sourceData.count%4), _sourceData.count/4*80, w, 80)];
    view.titleLabel.text = @"更多";
    view.icon.image = [UIImage imageNamed:@"tf_home_more"];
    [view.clickButton handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        if(weakSelf.block) weakSelf.block(weakSelf.sourceData.count);
    }];
    [self addSubview:view];
}

- (void) setFunctionMoreViewBlock:(functionMoreViewBlock)block{
    _block = block;
}

@end
