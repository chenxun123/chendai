//
//  TableViewCell.m
//  练习Demo
//
//  Created by peter on 2019/4/15.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "Masonry7TVCell.h"

@implementation Masonry7TVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self creatView];
    }
    
    return self;
}

- (void)creatView{
    
    NSArray * array = @[[UIColor redColor],[UIColor blueColor],[UIColor greenColor]];
    
    for (int i = 0; i < array.count; i++) {
        
        UILabel * lable = [[UILabel alloc]init];
        lable.numberOfLines = 0;
        lable.layer.borderWidth = 1;
        UIColor * color = array[i];
        lable.layer.borderColor = color.CGColor;
        [self.contentView addSubview:lable];
        switch (i) {
            case 0:
                _firstrLable = lable;
                break;
            case 1:
                _secondLable = lable;
                break;
            case 2:
                _threeLable  = lable;
                break;
            default:
                break;
        }
    }
    
    CGFloat width = (kScreenWidth - 40) / 3.0;
    _firstrLable.preferredMaxLayoutWidth = width;
    [_firstrLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.width.equalTo(@(width));
        make.bottom.lessThanOrEqualTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    _secondLable.preferredMaxLayoutWidth = width;
    [_secondLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.firstrLable.mas_right).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.width.equalTo(@(width));
        make.bottom.lessThanOrEqualTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    _threeLable.preferredMaxLayoutWidth = width;
    [_threeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.secondLable.mas_right).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.width.equalTo(@(width));
        make.bottom.lessThanOrEqualTo(self.contentView.mas_bottom).offset(-10);
    }];
    
}

- (void)setModel:(FDFeedEntity *)model{
    
    _firstrLable.text = model.title;
    _secondLable.text = model.content;
    _threeLable.text  = @"发布我微博欧比我hi驱鬼额UIUC跷脚牛肉发起人你去哪跑去哪日";
}
@end
