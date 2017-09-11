//
//  DPSArrayDiffTool.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/10.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DPSDiffInfo : NSObject
@property (nonatomic,strong) NSArray *addItemArray;
@property (nonatomic,strong) NSArray *reduceItemArray;

@end
@interface DPSArrayDiffTool : NSObject
+ (DPSDiffInfo *)diffArrayChangeWithOldArray:(NSArray *)oldArray newArray:(NSArray *)newArray;
@end
