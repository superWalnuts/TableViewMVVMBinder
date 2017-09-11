//
//  DPSMVVMTableViewCell.m
//  DPSTableViewMVVMTest
//
//  Created by 杨大鹏 on 2017/9/6.
//  Copyright © 2017年 杨大鹏. All rights reserved.
//

#import "DPSMVVMTableViewCell.h"

@implementation DPSMVVMTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initMVVMTableViewCell];
    }
    return self;
}

- (void)initMVVMTableViewCell
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self setBackgroundColor:[UIColor clearColor]];

}

- (void)setChildViewModel:(id<DPSChildViewModelProtocol>) childViewModel
{
    if (!self.childView) {
        [self initChildViewWithChildViewModel:childViewModel];
    }
    [self.childView setChildViewModel:childViewModel];
}

- (void)initChildViewWithChildViewModel:(id<DPSChildViewModelProtocol>) childViewModel {
    Class childViewClass = [childViewModel childViewClass];
    self.childView = [[childViewClass alloc] init];
    [self.contentView addSubview:self.childView];
    [self.childView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.childView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.childView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.childView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.childView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    NSArray *array = [NSArray arrayWithObjects:constraint1, constraint2, constraint3, constraint4 ,nil];
    [self.contentView addConstraints:array];
}
@end
