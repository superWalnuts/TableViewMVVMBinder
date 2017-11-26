//
//  ChildViewButton.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/11.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "ChildViewButton.h"
#import "ChildViewModelButton.h"
#import "DPSColor.h"
@interface ChildViewButton()
@property (nonatomic,strong) ChildViewModelButton *childViewModel;
@property (nonatomic,strong) UILabel *buttonTextLabel;
@end
@implementation ChildViewButton
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initChildView];
    }
    return self;
}
- (void)initChildView
{
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    self.buttonTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, width-30, 50)];
    self.buttonTextLabel.textAlignment = NSTextAlignmentCenter;
    self.buttonTextLabel.textColor = [DPSColor colorWithRGB:0xffffff];
    self.buttonTextLabel.backgroundColor = [DPSColor colorWithRGB:0x018bf2];
    [self addSubview:self.buttonTextLabel];
    self.backgroundColor = [DPSColor colorWithRGB:0xeeeeee];
}
- (void)setChildViewModel:(ChildViewModelButton *)childViewModel
{
    _childViewModel = childViewModel;
    self.buttonTextLabel.text = childViewModel.buttonText;
}
@end
