//
//  Masonry5TVCell.m
//  练习Demo
//
//  Created by peter on 2019/4/11.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "Masonry5TVCell.h"

@implementation Masonry5TVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setView];
    }
    
    return self;
}

- (void)setView{
    
    _textView = [[UITextView alloc]init];
    _textView.scrollEnabled = NO;
//    _textView.backgroundColor = [UIColor redColor];
    _textView.delegate = self;
   
    [self.contentView addSubview:_textView];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
        make.right.bottom.equalTo(self.contentView).offset(-10);
        self.textViewHeight = make.height.greaterThanOrEqualTo(@50);//大于等于50
        make.height.lessThanOrEqualTo(@100);//大于等于50
    }];
    
//     _textView.text = @"13131";
}
- (void)textViewDidChange:(UITextView *)textView{
    
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(kScreenWidth - 20, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];

    textView.scrollEnabled = newSize.height >=100 ? YES : NO;
    if (textView.scrollEnabled) {
        self.textViewHeight.greaterThanOrEqualTo(@100);
    }else{
        self.textViewHeight.greaterThanOrEqualTo(@50);
    }
    if ([self.delegate respondsToSelector:@selector(changeTextViewHeight:andCGSize:)]) {
        
        [self.delegate changeTextViewHeight:_path andCGSize:CGSizeZero];
    }
}
@end
