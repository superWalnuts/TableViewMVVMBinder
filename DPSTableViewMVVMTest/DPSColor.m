//
//  DPSColor.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/10.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "DPSColor.h"

@implementation DPSColor
+ (UIColor *)colorWithRGB:(int)rgb
{
    return [UIColor colorWithRed:((rgb & 0xFF0000) >> 16) / 255.0f
                           green:((rgb & 0xFF00) >> 8) / 255.0f
                            blue:((rgb & 0xFF)) / 255.0f
                           alpha:1.0f];
}
@end
