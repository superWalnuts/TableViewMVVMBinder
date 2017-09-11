//
//  ChildViewModelHead.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/10.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "ChildViewModelHead.h"
#import "ChildViewHead.h"
@implementation ChildViewModelHead

- (void)updateChildViewModelHeadWithType:(NSInteger)type
{
    if (type == 1) {
        self.titleText = @"SubViewModelOne";
    }
}


- (Class)childViewClass
{
    return [ChildViewHead class];
}
- (CGFloat)childViewHeight
{
    return 50;
}
+ (NSString *)childViewReuseIdentifier
{
    return @"ChildViewHead";
}

- (NSString *)childViewReuseIdentifier
{
    return @"ChildViewHead";
}
@end
