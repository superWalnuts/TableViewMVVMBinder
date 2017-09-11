//
//  ChildViewHead.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/10.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "ChildViewHead.h"
#import "ChildViewModelHead.h"
#import "DPSColor.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface ChildViewHead()
@property (nonatomic,strong) ChildViewModelHead *childViewModel;

@property (nonatomic,strong) UILabel *titleLableView;
@end
@implementation ChildViewHead
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
    self.backgroundColor = [DPSColor colorWithRGB:0xffffff];
    self.titleLableView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    self.titleLableView.textColor = [DPSColor colorWithRGB:0x008dfe];
    [self addSubview:self.titleLableView];
}
- (void)setChildViewModel:(ChildViewModelHead *)childViewModel
{
    _childViewModel = childViewModel;
    @weakify(self)
    [RACObserve(self.childViewModel, titleText) subscribeNext:^(NSString* title) {
        @strongify(self);
        self.titleLableView.text = title;
    }];
}

@end
