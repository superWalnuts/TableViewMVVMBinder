//
//  SubViewModelOne.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/9.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//
#import "SubViewModelOne.h"
#import "ChildViewModelA.h"
#import "ChildViewModelHead.h"
#import "ChildViewModelImage.h"
@interface SubViewModelOne()
@property(nonatomic,strong) NSMutableArray<DPSChildViewModelProtocol> *viewModelArray;
@end
@implementation SubViewModelOne
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubViewModel];
    }
    return self;
}
- (void)initSubViewModel
{
    ChildViewModelHead *headModel = [ChildViewModelHead new];
    [headModel updateChildViewModelHeadWithType:1];
    self.viewModelArray = [NSMutableArray<DPSChildViewModelProtocol> new];
    [self.viewModelArray addObject:headModel];
    [self getSubViewModelNetWorkData];
}
- (NSArray<DPSChildViewModelProtocol> *)childViewModelArray
{
    return [self.viewModelArray copy];
}

- (void)notificationReloadData
{
    [self getSubViewModelNetWorkData];
}
- (NSArray<NSString *> *)reuseIdentifierArray
{
    return @[[ChildViewModelA childViewReuseIdentifier],[ChildViewModelHead childViewReuseIdentifier],[ChildViewModelImage childViewReuseIdentifier]];
}



//模仿网络请求
- (void)getSubViewModelNetWorkData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        ChildViewModelA *modelA = [ChildViewModelA new];
        modelA.colorRGB = @(0xfa6543);
        modelA.colorStr = @"0xfa6543";
        [self.viewModelArray addObject:modelA];
        
        self.updateChildModelArray(self);
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        ChildViewModelA *modelA = [ChildViewModelA new];
        modelA.colorRGB = @(0x018bf2);
        modelA.colorStr = @"0x018bf2";
        [self.viewModelArray addObject:modelA];
        self.insertChildModelWithAnimation(self,UITableViewRowAnimationTop);
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        ChildViewModelImage *model = [ChildViewModelImage new];
        model.firstImageName = @"imageOne";
        model.secondImageName = @"ImageTwo";
        [self.viewModelArray addObject:model];
        self.insertChildModelWithAnimation(self,UITableViewRowAnimationTop);
    });
}
@end
