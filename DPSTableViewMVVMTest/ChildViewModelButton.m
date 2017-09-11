//
//  ChildViewModelButton.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/11.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "ChildViewModelButton.h"
#import "ChildViewButton.h"
@implementation ChildViewModelButton
- (Class)childViewClass
{
    return [ChildViewButton class];
}
- (CGFloat)childViewHeight
{
    return 80;
}
+ (NSString *)childViewReuseIdentifier
{
    return @"ChildViewButton";
}

- (NSString *)childViewReuseIdentifier
{
    return @"ChildViewButton";
}
@end
