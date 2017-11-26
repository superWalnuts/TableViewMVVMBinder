//
//  ChildViewModelButton.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/11.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSChildViewModelProtocol.h"

@interface ChildViewModelButton : NSObject<DPSChildViewModelProtocol>
@property (nonatomic, strong) NSString *buttonText;
@end
