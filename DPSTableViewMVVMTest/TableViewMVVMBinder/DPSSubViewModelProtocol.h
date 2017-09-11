//
//  DPSSubViewModelProtocol.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/6.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSChildViewModelProtocol.h"
@protocol DPSSubViewModelProtocol <NSObject>
@required
- (NSArray<DPSChildViewModelProtocol> *)childViewModelArray;
- (NSArray<NSString *> *)reuseIdentifierArray;
- (void)notificationReloadData;

@property (nonatomic, copy) void(^updateChildModelArray)(id<DPSSubViewModelProtocol> subViewModel);
@property (nonatomic, copy) void(^insertChildModelWithAnimation)(id<DPSSubViewModelProtocol> subViewModel,UITableViewRowAnimation animation);
@property (nonatomic, copy) void(^deleteChildModelWithAnimation)(id<DPSSubViewModelProtocol> subViewModel,UITableViewRowAnimation animation);

@end
