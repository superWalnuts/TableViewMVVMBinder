//
//  ChildViewModelImage.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/10.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "ChildViewModelImage.h"
#import "ChildViewImage.h"
@implementation ChildViewModelImage
- (Class)childViewClass
{
    return [ChildViewImage class];
}
- (CGFloat)childViewHeight
{
    return 80;
}
+ (NSString *)childViewReuseIdentifier
{
    return @"ChildViewImage";
}

- (NSString *)childViewReuseIdentifier
{
    return @"ChildViewImage";
}
@end
