//
//  MainViewModel.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/9.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSMainViewModelProtocol.h"
@interface MainViewModel : NSObject<DPSMainViewModelProtocol>
@property (nonatomic, copy) void(^updateSubViewModelArray)();
@property (nonatomic, copy) void(^notificationSubViewModelReload)();
- (NSArray<DPSSubViewModelProtocol> *)subViewModelArray;
@end
