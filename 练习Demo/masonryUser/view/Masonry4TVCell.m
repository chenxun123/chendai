//
//  Masonry4TVCell.m
//  练习Demo
//
//  Created by peter on 2019/4/9.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "Masonry4TVCell.h"

@implementation Masonry4TVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setFrameForMasonry];
}

- (void)setFrameForMasonry{
    
    [self insertSubview:self.contentView atIndex:0];
    
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.and.left.equalTo(self.contentView).offset(15);
        make.height.and.width.equalTo(@30);
    }];
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.headImage.mas_right).offset(15);
        make.top.equalTo(self.headImage);
        make.height.equalTo(self.headImage);
        make.right.lessThanOrEqualTo(self.contentView.mas_right).offset(-15);
        
    }];
    
    _contentLable.preferredMaxLayoutWidth = kScreenWidth - 30;// 如果是多行的话给一个maxWidth,不然你获取他的行高时候会出现问题[self.contentLable systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    [_contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.headImage);
        make.top.equalTo(self.headImage.mas_bottom).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
//        make.height.equalTo(@60);//当设置为固定高度是，输入框动态输入改变cella高度时才不会发生抖动问题。
        self.contentHeightConstraint = make.height.lessThanOrEqualTo(@60).with.priorityHigh();
    }];
    
    [_plTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage);
        make.top.equalTo(self.contentLable.mas_bottom).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        self.textViewHeight = make.height.greaterThanOrEqualTo(@50);//大于等于50
        make.height.lessThanOrEqualTo(@100);//大于等于50
    }];
    
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.headImage);
        make.top.equalTo(self.plTextView.mas_bottom).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        self.btnHeight = make.height.equalTo(@40);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);
    }];
    
    _plTextView.delegate = self;
    [_moreBtn addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setModel:(FDFeedEntity *)model{
    
    _headImage.image = [UIImage imageNamed:model.imageName];
    _titleLable.text = model.username;
    _contentLable.text = model.content;
    
    if (model.isHidden) {
        
        [self.contentHeightConstraint uninstall];
        [self.moreBtn setTitle:@"收起" forState:UIControlStateNormal];
    }else{
        
        [self.contentHeightConstraint install];
        [self.moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    }
//
    _plTextView.text = model.textViewStr;
    CGFloat height = [self.contentLable systemLayoutSizeFittingSize:
                      UILayoutFittingCompressedSize].height;
    if (height >= 60) {

        self.btnHeight.equalTo(@30);
        self.moreBtn.hidden = NO;
    }else{
        self.btnHeight.equalTo(@0);
        self.moreBtn.hidden = YES;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)moreClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(changeModel:)]) {
        [self.delegate changeModel:_path];
    }
    NSLog(@"被点击了");
}

- (void)textViewDidChange:(UITextView *)textView{
    
    if ([textView.text isEqualToString:_model.textViewStr]) {
        
        return;
    }
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(kScreenWidth - 30, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    
    textView.scrollEnabled = newSize.height >=100 ? YES : NO;
    if (textView.scrollEnabled) {//当textview的滑动开启时，如何不设置这个，高度会自己变成之前的50，因为滑动开启，textview会默认更改高度。
        self.textViewHeight.greaterThanOrEqualTo(@100);
    }else{
        self.textViewHeight.greaterThanOrEqualTo(@50);
    }
    if ([self.delegate respondsToSelector:@selector(changeTextViewHeight:andCGSize:andStr:)]) {
        
        [self.delegate changeTextViewHeight:_path andCGSize:CGSizeZero andStr:textView.text];
    }
}
@end
