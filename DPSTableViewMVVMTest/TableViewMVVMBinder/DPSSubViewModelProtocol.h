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


@optional
//如果实现该方法，外界会在特定时机通知你刷新数据
- (void)notificationReloadData;
//会告诉你哪个childView被点击了
- (void)childViewClicked:(NSInteger)index;

@property (nonatomic, copy) void(^updateChildModelArray)(id<DPSSubViewModelProtocol> subViewModel);
@property (nonatomic, copy) void(^insertChildModelWithAnimation)(id<DPSSubViewModelProtocol> subViewModel,UITableViewRowAnimation animation);
@property (nonatomic, copy) void(^deleteChildModelWithAnimation)(id<DPSSubViewModelProtocol> subViewModel,UITableViewRowAnimation animation);

@end
