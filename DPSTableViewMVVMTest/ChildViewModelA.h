//
//  ChildViewModelA.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/9.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSChildViewModelProtocol.h"
@interface ChildViewModelA : NSObject<DPSChildViewModelProtocol>
@property(nonatomic,strong) NSNumber *colorRGB;
@property(nonatomic,strong) NSString *colorStr;

@end
