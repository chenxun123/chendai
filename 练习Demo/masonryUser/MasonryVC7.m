//
//  MasonryVC7.m
//  练习Demo
//
//  Created by peter on 2019/4/15.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MasonryVC7.h"
#import "Masonry7TVCell.h"
@interface MasonryVC7 ()
@property (nonatomic, strong) NSMutableArray * muArray;
@end

@implementation MasonryVC7

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _muArray = [[NSMutableArray alloc]initWithArray:[FDFeedEntity getShuJu]];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 70;
    
    [self.tableView registerClass:[Masonry7TVCell class] forCellReuseIdentifier:@"Masonry7TVCell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return _muArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Masonry7TVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Masonry7TVCell" forIndexPath:indexPath];
    
    cell.model = _muArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [tableView fd_heightForCellWithIdentifier:@"Masonry7TVCell" cacheByIndexPath:indexPath configuration:^(id cell) {
        
        [self configureCell:cell atIndexPath:indexPath];
    }];
}

- (void)configureCell:(Masonry7TVCell *)cell atIndexPath:(NSIndexPath *)path{
    
    cell.model = _muArray[path.row];
}

@end
