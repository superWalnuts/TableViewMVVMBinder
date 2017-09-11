//
//  ChildViewModelA.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/9.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "ChildViewModelA.h"
#import "ChildViewA.h"
@implementation ChildViewModelA
- (Class)childViewClass
{
    return [ChildViewA class];
}
- (CGFloat)childViewHeight
{
    return 80;
}
+ (NSString *)childViewReuseIdentifier
{
    return @"ChildViewA";
}

- (NSString *)childViewReuseIdentifier
{
    return @"ChildViewA";
}
@end
