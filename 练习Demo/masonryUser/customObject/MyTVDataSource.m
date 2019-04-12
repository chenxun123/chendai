//
//  MyTVDataSource.m
//  练习Demo
//
//  Created by peter on 2019/3/26.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MyTVDataSource.h"

@interface MyTVDataSource()

@property (nonatomic, strong)   NSArray * itemArrays;
@property (nonatomic,   copy)   NSString * cellIdentifier;
@property (nonatomic,   copy)   TableViewCellConfigureBlock cellConfigureBlock;
@property (nonatomic, strong)   UITableView * baseTableView;
@end

@implementation MyTVDataSource

- (instancetype) initWithItems:(NSArray *)  itemsArray
             andCellIdentifier:(NSString *) cellIdentifier
                  andTableView:(UITableView *)baseTableView
         andConfigureCellBlock:(TableViewCellConfigureBlock) configureCellBlock{
    
    self = [super init];
    if (self) {
        self.itemArrays          =     itemsArray;
        self.cellIdentifier      =     cellIdentifier;
        self.cellConfigureBlock  =     [configureCellBlock copy];
        self.baseTableView       =     baseTableView;
    }
    
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.itemArrays[indexPath.row];
}

#pragma mark - UITableviewDataSource代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.itemArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    id itemModel = [self itemAtIndexPath:indexPath];
    
    self.cellConfigureBlock(cell, itemModel);
    
    return cell;
}
@end
