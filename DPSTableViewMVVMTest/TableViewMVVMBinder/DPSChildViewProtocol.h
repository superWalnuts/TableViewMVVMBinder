//
//  DPSChildViewProtocol.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/6.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSChildViewModelProtocol.h"
@protocol DPSChildViewProtocol <NSObject>
- (id<DPSChildViewModelProtocol>)childViewModel;
- (void)setChildViewModel:(id<DPSChildViewModelProtocol>)childViewModel;

@end
