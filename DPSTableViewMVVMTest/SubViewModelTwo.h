//
//  SubViewModelTwo.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/11.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//
#import "DPSSubViewModelProtocol.h"
#import <Foundation/Foundation.h>

@interface SubViewModelTwo : NSObject<DPSSubViewModelProtocol>
@property (nonatomic, copy) void(^updateChildModelArray)(id<DPSSubViewModelProtocol>);
@property (nonatomic, copy) void(^insertChildModelWithAnimation)(id<DPSSubViewModelProtocol> subViewModel,UITableViewRowAnimation animation);
@property (nonatomic, copy) void(^deleteChildModelWithAnimation)(id<DPSSubViewModelProtocol> subViewModel,UITableViewRowAnimation animation);
@end
