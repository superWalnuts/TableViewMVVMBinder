//
//  SubViewModelTwo.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/11.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "SubViewModelTwo.h"
#import "ChildViewModelHead.h"
#import "ChildViewModelImage.h"
#import "ChildViewModelButton.h"
#import "ChildViewModelA.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface SubViewModelTwo()
@property(nonatomic,strong) NSMutableArray<DPSChildViewModelProtocol> *viewModelArray;
@end
@implementation SubViewModelTwo
@synthesize insertChildModelWithAnimation;
@synthesize deleteChildModelWithAnimation;
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
    [headModel updateChildViewModelHeadWithType:2];
    self.viewModelArray = [NSMutableArray<DPSChildViewModelProtocol> new];
    [self.viewModelArray addObject:headModel];
    
    ChildViewModelButton *model = [ChildViewModelButton new];
    model.buttonText = @"Add";
    [self.viewModelArray addObject:model];
    
    ChildViewModelButton *modelReduce = [ChildViewModelButton new];
    modelReduce.buttonText = @"Reduce";
    [self.viewModelArray addObject:modelReduce];
}

- (void)addModel
{
    ChildViewModelA *modelA = [ChildViewModelA new];
    modelA.colorRGB = @(0xfa6543);
    modelA.colorStr = [NSString stringWithFormat:@"这是第%lu个Model",(unsigned long)self.viewModelArray.count];
    [self.viewModelArray addObject:modelA];
    self.insertChildModelWithAnimation(self,UITableViewRowAnimationTop);
}

- (void)reduceModel
{
    if (self.viewModelArray.count <= 3) {
        return;
    }
    [self.viewModelArray removeObjectAtIndex:self.viewModelArray.count-1];
    self.deleteChildModelWithAnimation(self, UITableViewRowAnimationTop);
}
- (void)childViewClicked:(NSInteger)index
{
    if (index == 1) {
        [self addModel];
    }
    
    if (index == 2) {
        [self reduceModel];
    }
}
- (NSArray<DPSChildViewModelProtocol> *)childViewModelArray
{
    return [self.viewModelArray copy];
}

- (void)notificationReloadData
{
}
- (NSArray<NSString *> *)reuseIdentifierArray
{
    return @[[ChildViewModelButton childViewReuseIdentifier],[ChildViewModelHead childViewReuseIdentifier],[ChildViewModelImage childViewReuseIdentifier],[ChildViewModelA childViewReuseIdentifier]];
}

@end
