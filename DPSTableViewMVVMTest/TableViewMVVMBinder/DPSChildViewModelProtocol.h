//
//  DPSChildViewModelProtocol.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/6.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol DPSChildViewModelProtocol <NSObject>
@required
- (Class)childViewClass;
- (CGFloat)childViewHeight;
+ (NSString *)childViewReuseIdentifier;
- (NSString *)childViewReuseIdentifier;
@end
