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
    NSArray * array = @[@"masonry简单使用",@"masonryCell自动布局",@"NavigationOrTabbarHidden",@"masonryCell动态变更高度",@"masonryCell里面的textView",@"使用masonry拖动控件在父视图内移动",@"masonry使用cell里面多个lable的高度自适应",@"自定义View阶梯显示cell自适应",@"等间距lable显示"];
    for (int i = 0; i < array.count; i++) {
        
        masonryModel * model = [[masonryModel alloc]init];
        model.titleStr = array[i];
        [mu addObject:model];
    }
    
    return mu;
}
@end
