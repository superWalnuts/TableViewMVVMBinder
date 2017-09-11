//
//  DPSMVVMTableViewCell.h
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/6.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPSChildViewModelProtocol.h"
#import "DPSChildViewProtocol.h"
@interface DPSMVVMTableViewCell : UITableViewCell
@property (nonatomic) UIView<DPSChildViewProtocol>* childView;

- (void)setChildViewModel:(id<DPSChildViewModelProtocol>) childViewModel;
@end
