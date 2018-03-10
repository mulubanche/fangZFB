//
//  Header.h
//  fangzhifubao
//
//  Created by xiaozhuzhu on 2018/3/9.
//  Copyright © 2018年 xiaozhuzhu. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "Tool_Header.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define STATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define USER_DAFAUKT [NSUserDefaults standardUserDefaults]
#define NOTIFICATION [NSNotificationCenter defaultCenter]
#define WeakSelf __weak typeof(self) weakSelf = self;

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif /* Header_h */
