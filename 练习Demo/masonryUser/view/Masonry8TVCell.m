//
//  Masonry8TVCell.m
//  练习Demo
//
//  Created by peter on 2019/4/15.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "Masonry8TVCell.h"

@implementation Masonry8TVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self creatView];
    }
    
    return self;
}

- (void)creatView{
    
    _jtView = [[jieTiView alloc]init];
    [self.contentView addSubview:_jtView];
    [_jtView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

- (void)setModel:(FDFeedEntity *)model{
    
    [_jtView setLableForTitleArray:model.lableArray];
}
@end
