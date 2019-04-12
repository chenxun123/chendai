//
//  MyTVDataSource.h
//  练习Demo
//
//  Created by peter on 2019/3/26.
//  Copyright © 2019年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TableViewCellConfigureBlock)(id _Nullable cell, id item);

NS_ASSUME_NONNULL_BEGIN

@interface MyTVDataSource : NSObject <UITableViewDataSource>

- (instancetype) initWithItems:(NSArray *)  itemsArray
             andCellIdentifier:(NSString *) cellIdentifier
                  andTableView:(UITableView *)baseTableView
         andConfigureCellBlock:(TableViewCellConfigureBlock) configureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
