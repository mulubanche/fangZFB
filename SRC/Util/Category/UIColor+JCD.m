//
//  UIColor+JCD.m
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/9.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#import "UIColor+JCD.h"

@implementation UIColor (JCD)

+ (UIColor *)colorWithRGB:(NSInteger)rgb
{
    return [UIColor colorWithRed:((rgb & 0xFF0000) >> 16) / 255.0f
                           green:((rgb & 0xFF00) >> 8) / 255.0f
                            blue:((rgb & 0xFF)) / 255.0f
                           alpha:1.0f];
    
}

// 这个方法可以指定透明度，alpha取值是[0, 1.0]
+ (UIColor *)colorWithRGB:(NSInteger)rgb alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((rgb & 0xFF0000) >> 16) / 255.0f
                           green:((rgb & 0xFF00) >> 8) / 255.0f
                            blue:((rgb & 0xFF)) / 255.0f
                           alpha:alpha];
    
}

@end
