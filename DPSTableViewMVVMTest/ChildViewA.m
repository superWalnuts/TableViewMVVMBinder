//
//  ChildViewA.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/9.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "ChildViewA.h"
#import "ChildViewModelA.h"
#import "DPSColor.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface ChildViewA()
@property (nonatomic,strong) ChildViewModelA *childViewModel;

@property (nonatomic,strong) UILabel *titleLableView;

@end
@implementation ChildViewA
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
    self.titleLableView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    self.titleLableView.textColor = [DPSColor colorWithRGB:0xffffff];
    [self addSubview:self.titleLableView];
}
- (void)setChildViewModel:(ChildViewModelA *)childViewModel
{
    _childViewModel = childViewModel;
    
    @weakify(self)
    [RACObserve(self.childViewModel, colorRGB) subscribeNext:^(NSNumber *color) {
        @strongify(self);
        self.backgroundColor = [DPSColor colorWithRGB:[color intValue]];
    }];
    [RACObserve(self.childViewModel, colorStr) subscribeNext:^(NSString *color) {
        @strongify(self);
        self.titleLableView.text = color;
    }];
}
@end
