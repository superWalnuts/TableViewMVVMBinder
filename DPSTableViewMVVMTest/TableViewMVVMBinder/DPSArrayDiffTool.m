//
//  DPSArrayDiffTool.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/10.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "DPSArrayDiffTool.h"
@implementation DPSDiffInfo
@end
@implementation DPSArrayDiffTool
+ (DPSDiffInfo *)diffArrayChangeWithOldArray:(NSArray *)oldArray newArray:(NSArray *)newArray
{
    NSMutableArray *addArray = [newArray mutableCopy];
    for (id item in newArray) {
        if ([oldArray containsObject:item]) {
            [addArray removeObject:item];
        }
    }
    NSMutableArray *reduceArray = [oldArray mutableCopy];
    for (id item in oldArray) {
        if ([newArray containsObject:item]) {
            [reduceArray removeObject:item];
        }
    }
    DPSDiffInfo *diffInfo = [DPSDiffInfo new];
    diffInfo.reduceItemArray = reduceArray.copy;
    diffInfo.addItemArray = addArray.copy;
    return diffInfo;
}
@end
