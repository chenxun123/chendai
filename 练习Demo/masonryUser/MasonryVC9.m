//
//  MasonryVC9.m
//  练习Demo
//
//  Created by peter on 2019/4/16.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MasonryVC9.h"

@interface MasonryVC9 ()
@property (weak, nonatomic) IBOutlet UISlider *changeSlider;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic, strong) MASConstraint * widthTraint;

@end

@implementation MasonryVC9

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuideBottom).offset(20);
        make.height.equalTo(@80);
//        make.centerX.equalTo(self.view);
        self.widthTraint = make.width.equalTo(@(kScreenWidth));
        
    }];
    
    NSArray * arr = @[@"",@"",@"",@"",@""];
    
    for (int i = 0; i < arr.count; i++) {
        
        UILabel * lable = [[UILabel alloc]init];
        lable.backgroundColor = [UIColor redColor];
        [_bgView addSubview:lable];
        
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.bgView);
            make.width.equalTo(@30);
            make.height.equalTo(@80);
            make.left.equalTo(self.bgView.mas_left).multipliedBy(i * 1.0 / (arr.count * 2 + 1));
        }];
    }
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)changeValue:(UISlider *)sender {
    
    _widthTraint.equalTo(@(kScreenWidth * sender.value));
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
