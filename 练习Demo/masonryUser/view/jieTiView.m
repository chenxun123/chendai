//
//  jieTiView.m
//  练习Demo
//
//  Created by peter on 2019/4/15.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "jieTiView.h"

@interface jieTiView()
@property (nonatomic, strong) NSMutableArray <UILabel *> * muArray;
@end

@implementation jieTiView

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)setLableForTitleArray:(NSArray *)array{
    
    if (_muArray.count > 0) {
        
        [_muArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
    }
    
    _muArray = [NSMutableArray new];
    
    CGFloat width = (kScreenWidth - 20) * 1.0 / array.count;
    
    UIView * view = self;
    for (int i = 0; i < array.count; i++) {
        
        UILabel * lable = [[UILabel alloc]init];
        lable.numberOfLines = 0;
        lable.preferredMaxLayoutWidth = width;
        lable.layer.borderWidth = 1;
        lable.layer.borderColor = [UIColor redColor].CGColor;
        [self addSubview:lable];
        if (i == 0) {
            
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(view.mas_top);
                make.left.equalTo(view.mas_left);
                make.width.mas_equalTo(width);
                make.bottom.lessThanOrEqualTo(self.mas_bottom);
            }];
        }else{
            
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(view.mas_bottom);
                make.left.equalTo(view.mas_right);
                make.width.mas_equalTo(width);
                make.bottom.lessThanOrEqualTo(self.mas_bottom);
            }];
        }
        
        lable.text = array[i];
        [_muArray addObject:lable];
        view = lable;
    }
}
@end

