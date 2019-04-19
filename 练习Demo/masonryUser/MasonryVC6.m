//
//  MasonryVC6.m
//  练习Demo
//
//  Created by peter on 2019/4/15.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MasonryVC6.h"

@interface MasonryVC6 ()
@property (weak, nonatomic) IBOutlet UIView *bgView1;
@property (weak, nonatomic) IBOutlet UILabel *moveLable;
@property (weak, nonatomic) IBOutlet UIView *bgView2;
@property (weak, nonatomic) IBOutlet UILabel *move1;
@property (weak, nonatomic) IBOutlet UILabel *move2;
@property (weak, nonatomic) IBOutlet UILabel *animationLable;
@property (weak, nonatomic) IBOutlet UIButton *animationBtn;

@property (nonatomic, strong) MASConstraint * cenxMasc;
@property (nonatomic, strong) MASConstraint * cenyMasc;
@property (nonatomic, strong) MASConstraint * cenxMasc1;
@property (nonatomic, strong) MASConstraint * cenyMasc1;
@property (nonatomic, strong) MASConstraint * cenXMasc2;
@end

@implementation MasonryVC6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _bgView1.userInteractionEnabled = YES;
    [_bgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_topLayoutGuideBottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@200);
    }];
    
    
    [_moveLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.greaterThanOrEqualTo(self.bgView1.mas_top);
        make.left.greaterThanOrEqualTo(self.bgView1.mas_left);
        make.right.lessThanOrEqualTo(self.bgView1.mas_right);
        make.bottom.lessThanOrEqualTo(self.bgView1.mas_bottom);
        
        self.cenxMasc = make.centerX.equalTo(self.bgView1.mas_left).offset(50).with.priorityHigh();
        self.cenyMasc = make.centerY.equalTo(self.bgView1.mas_top).offset(50).with.priorityHigh();
    }];
    
    _bgView1.layer.masksToBounds = YES;
    _bgView1.layer.borderWidth = 1.0f;
    _bgView1.layer.borderColor = [UIColor greenColor].CGColor;
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panLable:)];
    [self.bgView1 addGestureRecognizer:pan];
    
    
    _bgView2.userInteractionEnabled = YES;
    _bgView2.layer.masksToBounds = YES;
    _bgView2.layer.borderWidth = 1.0f;
    _bgView2.layer.borderColor = [UIColor redColor].CGColor;
    [_bgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.bgView1.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@200);
    }];
    
    [_move1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.greaterThanOrEqualTo(self.bgView2.mas_top);
        make.left.greaterThanOrEqualTo(self.bgView2.mas_left);
        make.right.lessThanOrEqualTo(self.bgView2.mas_right);
        make.bottom.lessThanOrEqualTo(self.bgView2.mas_bottom);
        
        self.cenxMasc1 = make.centerX.equalTo(self.bgView2.mas_left).offset(50).with.priorityHigh();
        self.cenyMasc1 = make.centerY.equalTo(self.bgView2.mas_top).offset(50).with.priorityHigh();
        
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    
    [_move2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.move1.mas_left).offset(50);
        make.bottom.equalTo(self.move1.mas_top).offset(-5);//这里不要设置优先级为high，不然会有问题，默认最高优先级1000
        make.width.equalTo(@70);
        make.height.equalTo(@30);
        
        make.top.greaterThanOrEqualTo(self.bgView2.mas_top);
        make.right.lessThanOrEqualTo(self.bgView2.mas_right);
    }];
    
    UIPanGestureRecognizer * pan1 = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panLable1:)];
    [self.bgView2 addGestureRecognizer:pan1];
    
    
    [_animationLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.bgView2.mas_bottom).offset(20);
        make.width.equalTo(@200);
        make.height.equalTo(@30);
        self.cenXMasc2 = make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    [_animationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.animationLable.mas_bottom).offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)panLable:(UIPanGestureRecognizer *)pan{
    
    CGPoint point = [pan locationInView:_bgView1];
    _moveLable.text = NSStringFromCGPoint(point);
    
    _cenxMasc.offset = point.x;
    _cenyMasc.offset = point.y;
}

- (void)panLable1:(UIPanGestureRecognizer *)pan{
    
    CGPoint point = [pan locationInView:_bgView2];
    _move1.text = NSStringFromCGPoint(point);
    
    _cenxMasc1.offset = point.x;
    _cenyMasc1.offset = point.y;
}
- (IBAction)btnClick:(UIButton *)sender {
    
    _cenXMasc2.offset(-kScreenWidth);
    [self.view layoutIfNeeded];
    
    _cenXMasc2.offset(0);
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
