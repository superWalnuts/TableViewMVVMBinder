//
//  ChildViewImage.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/10.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//
#import "DPSColor.h"
#import "ChildViewImage.h"
#import "ChildViewModelImage.h"
@interface ChildViewImage()
@property (nonatomic,strong) ChildViewModelImage *childViewModel;

@property (nonatomic,strong) UIImageView *imageViewOne;
@property (nonatomic,strong) UIImageView *imageViewTwo;


@end
@implementation ChildViewImage
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
    self.imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
    [self addSubview:self.imageViewOne];
    self.imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(80, 15, 50, 50)];
    [self addSubview:self.imageViewTwo];
    self.backgroundColor = [DPSColor colorWithRGB:0xeeeeee];
}
- (void)setChildViewModel:(ChildViewModelImage *)childViewModel
{
    _childViewModel = childViewModel;
    [self.imageViewOne setImage:[UIImage imageNamed:childViewModel.firstImageName]];
    [self.imageViewTwo setImage:[UIImage imageNamed:childViewModel.secondImageName]];
    
}
@end
