//
//  MainViewModel.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/9.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "MainViewModel.h"
#import "SubViewModelOne.h"
#import "SubViewModelTwo.h"
@interface MainViewModel()
@property (nonatomic,strong) NSArray<DPSSubViewModelProtocol> *viewModelArray;
@property (nonatomic,strong) SubViewModelOne *subViewModelOne;
@property (nonatomic,strong) SubViewModelTwo *subViewModelTwo;

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
    self.subViewModelOne = [SubViewModelOne new];
    [subViewModelArray addObject:self.subViewModelOne];
    
    self.subViewModelTwo = [SubViewModelTwo new];
    [subViewModelArray addObject:self.subViewModelTwo];

    self.viewModelArray = [subViewModelArray copy];
}
- (NSArray<DPSSubViewModelProtocol> *)subViewModelArray
{
    return self.viewModelArray;
}

@end
