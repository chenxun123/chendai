//
//  MasonryVC3.m
//  练习Demo
//
//  Created by peter on 2019/4/9.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MasonryVC3.h"

@interface MasonryVC3 ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (nonatomic, strong) UITextView * textView;
@end

@implementation MasonryVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_topLayoutGuide);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(@50);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(@50);
        
    }];
    
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    
    _textView = [[UITextView alloc]init];
    _textView.scrollEnabled = NO;
    _textView.delegate = self;
    _textView.layer.borderWidth = 1;
    _textView.backgroundColor = [UIColor redColor];
    [view addSubview:_textView];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom).offset(80);
        make.left.right.equalTo(self.view);
    }];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.top.left.right.equalTo(view);
        make.bottom.equalTo(view).offset(-50);
        make.height.greaterThanOrEqualTo(@50);//大于等于50
        make.height.lessThanOrEqualTo(@200);//小于200
    }];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)topHidden:(UISwitch *)sender {
    
    [self.navigationController setNavigationBarHidden:sender.on animated:YES];

}
- (IBAction)bottomHidden:(UISwitch *)sender {
    
    [self.navigationController setToolbarHidden:sender.on animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)textViewDidChange:(UITextView *)textView{
    
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(kScreenWidth, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    
    textView.scrollEnabled = newSize.height >=200 ? YES : NO;
}
@end
