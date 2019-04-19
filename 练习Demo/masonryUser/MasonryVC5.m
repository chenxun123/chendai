//
//  MasonryVC5.m
//  练习Demo
//
//  Created by peter on 2019/4/11.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MasonryVC5.h"
#import "Masonry5TVCell.h"
@interface MasonryVC5 ()<Masonry4TVCellClickChangeHeight>

@end

@implementation MasonryVC5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 70;
    
    [self.tableView registerClass:[Masonry5TVCell class] forCellReuseIdentifier:@"Masonry5Cell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Masonry5TVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Masonry5Cell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.path = indexPath;
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return UITableViewAutomaticDimension;
//}

- (void)changeTextViewHeight:(NSIndexPath *)indexPath andCGSize:(CGSize)size andStr:(nonnull NSString *)str{
    
//    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (void)changeModel:(nonnull NSIndexPath *)indexPath {
    
}

@end
