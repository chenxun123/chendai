//
//  MasonryVC8.m
//  练习Demo
//
//  Created by peter on 2019/4/15.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MasonryVC8.h"
#import "FDFeedEntity.h"
#import "Masonry8TVCell.h"

@interface MasonryVC8 ()
@property (nonatomic, strong) NSMutableArray * muArray;
@end

@implementation MasonryVC8

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _muArray = [[NSMutableArray alloc]initWithArray:[FDFeedEntity getShuJu]];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 70;
    
    [self.tableView registerClass:[Masonry8TVCell class] forCellReuseIdentifier:@"Masonry8TVCell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return _muArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Masonry8TVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Masonry8TVCell" forIndexPath:indexPath];
    
    cell.model = _muArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [tableView fd_heightForCellWithIdentifier:@"Masonry8TVCell" cacheByIndexPath:indexPath configuration:^(id cell) {
        
        [self configureCell:cell atIndexPath:indexPath];
    }];
}

- (void)configureCell:(Masonry8TVCell *)cell atIndexPath:(NSIndexPath *)path{
    
    cell.model = _muArray[path.row];
}
@end
