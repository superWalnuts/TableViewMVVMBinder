//
//  DPSTableMVVMBinder.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/6.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "DPSTableMVVMBinder.h"
#import "DPSSubViewModelProtocol.h"
#import "DPSChildViewModelProtocol.h"
#import "DPSArrayDiffTool.h"
#import "DPSMVVMTableViewCell.h"
@interface DPSTableMVVMBinder()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) id<DPSMainViewModelProtocol> mainViewModel;

@property (nonatomic, strong) NSArray<DPSSubViewModelProtocol> *subViewModelArray;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<DPSChildViewModelProtocol> *> *allChildViewModelArray;
@end
@implementation DPSTableMVVMBinder
- (void)bindTableView:(UITableView*)tableView withMainViewModel:(id<DPSMainViewModelProtocol>)mainViewModel
{
    self.tableView = tableView;
    self.mainViewModel = mainViewModel;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self updateAllChildViewModelArray];
    [self registerReuseIdentifier];
    [self initSubViewModelMethod];
    [self initMainViewModelMethod];
    [self.tableView reloadData];
}

//更新subViewModelArray allChildViewModelArray
- (void)updateAllChildViewModelArray
{
    self.subViewModelArray = [self.mainViewModel subViewModelArray];
    NSMutableArray *allViewModelArray = [NSMutableArray new];
    for (int section = 0; section < self.subViewModelArray.count; section++) {
        id<DPSSubViewModelProtocol> subViewModel = [self.subViewModelArray objectAtIndex:section];
        NSArray<DPSChildViewModelProtocol> *childViewModelArray = [subViewModel childViewModelArray];
        [allViewModelArray addObject:[childViewModelArray mutableCopy]];
    }
    self.allChildViewModelArray = allViewModelArray;
}
//注册TableView复用池
- (void)registerReuseIdentifier
{
    for (id<DPSSubViewModelProtocol> subViewModel in self.subViewModelArray) {
        NSArray<NSString *> *reuseIdentifierArray = [subViewModel reuseIdentifierArray];
        for (NSString *reuseIdentifier in reuseIdentifierArray) {
            [self.tableView registerClass:[DPSMVVMTableViewCell class] forCellReuseIdentifier:reuseIdentifier];
        }
    }
}
//实现mainViewModel 中的方法
- (void)initMainViewModelMethod
{
    __weak typeof (self) weakSelf = self;
    self.mainViewModel.updateSubViewModelArray = ^{
        __strong typeof (self) strongSelf = weakSelf;
        [strongSelf updateAllChildViewModelArray];
        [strongSelf initSubViewModelMethod];
        [strongSelf.tableView reloadData];
    };
    self.mainViewModel.notificationSubViewModelReload = ^{
        __strong typeof (self) strongSelf = weakSelf;
        [strongSelf notificationSubViewModelReload];
    };
}
//实现SubViewModel中的方法
- (void)initSubViewModelMethod
{
    for (id<DPSSubViewModelProtocol> subViewModel in self.subViewModelArray) {
        if ([subViewModel respondsToSelector:@selector(setUpdateChildModelArray:)]) {
            __weak typeof (self) weakSelf = self;
            [subViewModel setUpdateChildModelArray:^(id<DPSSubViewModelProtocol> subViewModel){
                __strong typeof (self) strongSelf = weakSelf;
                [strongSelf updateChildModelArrayWithModel:subViewModel];
            }];
        }
        if ([subViewModel respondsToSelector:@selector(setInsertChildModelWithAnimation:)]) {
            __weak typeof (self) weakSelf = self;
            [subViewModel setInsertChildModelWithAnimation:^(id<DPSSubViewModelProtocol> subViewModel,UITableViewRowAnimation animation){
                __strong typeof (self) strongSelf = weakSelf;
                [strongSelf insertChildModelWithAnimation:subViewModel animation:animation];
            }];
        }
        if ([subViewModel respondsToSelector:@selector(setDeleteChildModelWithAnimation:)]) {
            __weak typeof (self) weakSelf = self;
            [subViewModel setDeleteChildModelWithAnimation:^(id<DPSSubViewModelProtocol> subViewModel,UITableViewRowAnimation animation){
                __strong typeof (self) strongSelf = weakSelf;
                [strongSelf deleteChildModelWithAnimation:subViewModel animation:animation];
            }];
        }
    }
}
//通知所有SubViewModel更新数据
- (void)notificationSubViewModelReload
{
    for (id<DPSSubViewModelProtocol> subViewModel in self.subViewModelArray) {
        if ([subViewModel respondsToSelector:@selector(notificationReloadData)]) {
            [subViewModel notificationReloadData];
        }
    }
}

//更新一个SubViewModel中的数据
- (void)updateChildModelArrayWithModel:(id<DPSSubViewModelProtocol>) viewModel
{
    NSInteger section = [self.subViewModelArray indexOfObject:viewModel];
    if (section == NSNotFound) {
        return;
    }
    id<DPSSubViewModelProtocol> subViewModel = [self.subViewModelArray objectAtIndex:section];
    NSMutableArray<DPSChildViewModelProtocol> *newChildViewModelArray = [[subViewModel childViewModelArray] mutableCopy];
    [self.allChildViewModelArray replaceObjectAtIndex:section withObject:newChildViewModelArray];
    [self.tableView reloadData];
}
//SubViewModel中添加一个childViewModel中的数据
- (void)insertChildModelWithAnimation:(id<DPSSubViewModelProtocol>) viewModel animation:(UITableViewRowAnimation)animation
{
    NSInteger section = [self.subViewModelArray indexOfObject:viewModel];
    if (section == NSNotFound) {
        return;
    }
    id<DPSSubViewModelProtocol> subViewModel = [self.subViewModelArray objectAtIndex:section];
    NSMutableArray<DPSChildViewModelProtocol> *newChildViewModelArray = [[subViewModel childViewModelArray] mutableCopy];
    NSMutableArray<DPSChildViewModelProtocol> *oldChildViewModelArray = [self.allChildViewModelArray objectAtIndex:section];
    [self.allChildViewModelArray replaceObjectAtIndex:section withObject:newChildViewModelArray];
   
    DPSDiffInfo *diffInfo = [DPSArrayDiffTool diffArrayChangeWithOldArray:oldChildViewModelArray.copy newArray:newChildViewModelArray.copy];
    if (diffInfo.reduceItemArray.count > 0) {
        NSAssert(NO, @"Only add ChildViewModel");
    }
    NSMutableArray *indexPathArray = [NSMutableArray new];
    for (id<DPSChildViewModelProtocol> addChildViewModel in diffInfo.addItemArray) {
        NSInteger index = [newChildViewModelArray indexOfObject:addChildViewModel];
        if (section == NSNotFound) {
            continue;
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:section];
        [indexPathArray addObject:indexPath];
    }
    [self.tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:animation];
}
//SubViewModel中添加一个childViewModel中的数据
- (void)deleteChildModelWithAnimation:(id<DPSSubViewModelProtocol>) viewModel animation:(UITableViewRowAnimation)animation
{
    NSInteger section = [self.subViewModelArray indexOfObject:viewModel];
    if (section == NSNotFound) {
        return;
    }
    id<DPSSubViewModelProtocol> subViewModel = [self.subViewModelArray objectAtIndex:section];
    NSMutableArray<DPSChildViewModelProtocol> *newChildViewModelArray = [[subViewModel childViewModelArray] mutableCopy];
    NSMutableArray<DPSChildViewModelProtocol> *oldChildViewModelArray = [self.allChildViewModelArray objectAtIndex:section];
    [self.allChildViewModelArray replaceObjectAtIndex:section withObject:newChildViewModelArray];
    
    DPSDiffInfo *diffInfo = [DPSArrayDiffTool diffArrayChangeWithOldArray:oldChildViewModelArray.copy newArray:newChildViewModelArray.copy];
    if (diffInfo.addItemArray.count > 0) {
        NSAssert(NO, @"Only delete ChildViewModel");
    }
    NSMutableArray *indexPathArray = [NSMutableArray new];
    for (id<DPSChildViewModelProtocol> reduceChildViewModel in diffInfo.reduceItemArray) {
        NSInteger index = [oldChildViewModelArray indexOfObject:reduceChildViewModel];
        if (section == NSNotFound) {
            continue;
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:section];
        [indexPathArray addObject:indexPath];
    }
    [self.tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:animation];
}


#pragma mark tableView DataSource 和 delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allChildViewModelArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *childViewModelArray = [self.allChildViewModelArray objectAtIndex:section];
    
    return childViewModelArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray<DPSChildViewModelProtocol> *childViewModelArray = [self.allChildViewModelArray objectAtIndex:indexPath.section];
    id<DPSChildViewModelProtocol> cellModel = [childViewModelArray objectAtIndex:indexPath.row];
    return [cellModel childViewHeight];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray<DPSChildViewModelProtocol> *childViewModelArray = [self.allChildViewModelArray objectAtIndex:indexPath.section];
    id<DPSChildViewModelProtocol> cellModel = [childViewModelArray objectAtIndex:indexPath.row];
    
    DPSMVVMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.childViewReuseIdentifier];
    [cell setChildViewModel:cellModel];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<DPSSubViewModelProtocol> subViewModel = [self.subViewModelArray objectAtIndex:indexPath.section];
    if ([subViewModel respondsToSelector:@selector(childViewClicked:)]) {
        [subViewModel childViewClicked:indexPath.row];
    }
}

@end
