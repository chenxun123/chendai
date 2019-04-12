//
//  Masonry2TVCell.m
//  练习Demo
//
//  Created by peter on 2019/3/27.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "Masonry2TVCell.h"

@implementation Masonry2TVCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self setFrameForView];
    // Initialization code
}
- (void)setFrameForView{
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
        make.height.mas_equalTo(30);
        make.right.mas_lessThanOrEqualTo(self.contentView.mas_right).offset(-20);
    }];
    
    [_detailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.titleLable.mas_bottom).offset(10);
        make.left.mas_equalTo(self.titleLable.mas_left);
        make.right.mas_lessThanOrEqualTo(self.contentView.mas_right).offset(-20);
    }];
    
    [_contentImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.detailLable.mas_bottom).offset(10);
        make.left.mas_equalTo(self.titleLable.mas_left);
        make.right.mas_lessThanOrEqualTo(self.contentView.mas_right).offset(-20);
    }];
    
    [_userLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentImage.mas_bottom).offset(10);
        make.left.mas_equalTo(self.titleLable.mas_left);
        make.height.mas_equalTo(20);
        make.right.mas_lessThanOrEqualTo(self.contentView.mas_right).offset(-20);
    }];
    
    [_timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentImage.mas_bottom).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}
- (void)setModel:(FDFeedEntity *)model{
    
    _titleLable.text = model.title;
    _detailLable.text = model.content;
    _contentImage.image = [UIImage imageNamed:model.imageName];
    _userLable.text = model.username;
    _timeLable.text = model.time;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
