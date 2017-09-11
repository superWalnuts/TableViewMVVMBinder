//
//  MainViewModel.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/9.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "MainViewModel.h"
#import "SubViewModelOne.h"
@interface MainViewModel()
@property (nonatomic,strong) NSArray<DPSSubViewModelProtocol> *viewModelArray;
@end
@implementation MainViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubViewModelArray];
    }
    return self;
}
- (void)initSubViewModelArray
{
    NSMutableArray *subViewModelArray = [NSMutableArray new];
    [subViewModelArray addObject:[SubViewModelOne new]];
    self.viewModelArray = [subViewModelArray copy];
}
- (NSArray<DPSSubViewModelProtocol> *)subViewModelArray
{
    return self.viewModelArray;
}

@end
