//
//  delegateForRACView.m
//  练习Demo
//
//  Created by peter on 2019/3/21.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "delegateForRACView.h"

@implementation delegateForRACView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //delegateForRACView : 自定义的view名称
        NSArray *nibView =  [[NSBundle mainBundle] loadNibNamed:@"delegateForRACView" owner:self options:nil];
        UIView *backView = [nibView objectAtIndex:0];
        backView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:backView];
    }
    return self;
}

- (IBAction)switchOn:(id)sender {
    
}
- (IBAction)clickBtn:(id)sender {
    
    if (self.delegateSubject) {
        [self.delegateSubject sendNext:@"view被点击"];
    }
}
@end
