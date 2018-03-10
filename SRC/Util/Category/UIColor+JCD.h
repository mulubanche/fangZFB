//
//  UIColor+JCD.h
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/9.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define color_main 0x2081D2//主色调
#define color_black 0x333333//黑色

@interface UIColor (JCD)

+ (UIColor *)colorWithRGB:(NSInteger)rgb;

// 这个方法可以指定透明度，alpha取值是[0, 1.0]
+ (UIColor *)colorWithRGB:(NSInteger)rgb alpha:(CGFloat)alpha;

@end
