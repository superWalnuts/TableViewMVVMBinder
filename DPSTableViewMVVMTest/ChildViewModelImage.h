//
//  ChildViewModelImage.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/10.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSChildViewModelProtocol.h"

@interface ChildViewModelImage : NSObject<DPSChildViewModelProtocol>
@property(nonatomic,strong) NSString *firstImageName;
@property(nonatomic,strong) NSString *secondImageName;
@end
