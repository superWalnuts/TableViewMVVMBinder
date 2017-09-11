//
//  DPSMainViewModelProtocol.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/6.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//
#import "DPSSubViewModelProtocol.h"
@protocol DPSMainViewModelProtocol

@required

@property (nonatomic, copy) void(^updateSubViewModelArray)();
@property (nonatomic, copy) void(^notificationSubViewModelReload)();
- (NSArray<DPSSubViewModelProtocol> *)subViewModelArray;
@end
