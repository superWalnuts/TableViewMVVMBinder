//
//  ViewController.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/6.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "ViewController.h"
#import "MainViewModel.h"
#import "DPSTableMVVMBinder.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) MainViewModel *mainViewModel;
@property (nonatomic,strong) DPSTableMVVMBinder *tableMvvmBinder;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainViewModel = [MainViewModel new];
    self.tableMvvmBinder = [DPSTableMVVMBinder new];
    [self.tableMvvmBinder bindTableView:self.tableView withMainViewModel:self.mainViewModel];
}




@end
