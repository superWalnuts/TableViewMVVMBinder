//
//  ChildViewModelHead.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/10.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPSChildViewModelProtocol.h"

@interface ChildViewModelHead : NSObject<DPSChildViewModelProtocol>
@property(nonatomic,strong) NSString *titleText;
- (void)updateChildViewModelHeadWithType:(NSInteger)type;
@end
