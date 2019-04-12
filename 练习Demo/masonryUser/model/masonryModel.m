//
//  masonryModel.m
//  练习Demo
//
//  Created by peter on 2019/3/26.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "masonryModel.h"

@implementation masonryModel

+ (NSArray *)creatMNArrayModel{
    
    NSMutableArray * mu = [[NSMutableArray alloc]init];
    NSArray * array = @[@"masonry简单使用",@"masonryCell自动布局",@"NavigationOrTabbarHidden",@"masonryCell动态变更高度",@"masonryCell里面的textView"];
    for (int i = 0; i < array.count; i++) {
        
        masonryModel * model = [[masonryModel alloc]init];
        model.titleStr = array[i];
        [mu addObject:model];
    }
    
    return mu;
}
@end
