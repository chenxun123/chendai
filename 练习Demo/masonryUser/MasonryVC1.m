//
//  MasonryVC1.m
//  练习Demo
//
//  Created by peter on 2019/3/26.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MasonryVC1.h"

@interface MasonryVC1 ()
@property (weak, nonatomic) IBOutlet UILabel *leftLable;
@property (weak, nonatomic) IBOutlet UILabel *rightLable;
@property (weak, nonatomic) IBOutlet UILabel *topLable;

@property (nonatomic, assign) double leftValue;
@property (nonatomic, assign) double rightValue;
@property (weak, nonatomic) IBOutlet UIView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (nonatomic, strong) NSMutableArray * muArray;
@property (weak, nonatomic) IBOutlet UIView *fatherView;
@property (weak, nonatomic) IBOutlet UIView *childView;
@property (weak, nonatomic) IBOutlet UISlider *bgSlider;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLableX;

@end

@implementation MasonryVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setLableFrame];
  
    [self setImageFrame];
    
    [self setsliderFrame];
    // Do any additional setup after loading the view from its nib.
}

- (void)setsliderFrame{
    
     __block MASConstraint *widthConstraint = nil;
    [self.fatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(130);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(80);
        widthConstraint = make.width.mas_equalTo(0);
    }];
    
    [_muArray addObject:widthConstraint];
    
    [self.childView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.fatherView.mas_top);
        make.left.mas_equalTo(self.fatherView.mas_left);
        make.height.mas_equalTo(self.fatherView.mas_height);
        make.width.mas_equalTo(self.fatherView).multipliedBy(0.5);
    }];
}
- (void)setImageFrame{
    
    __block MASConstraint *widthConstraint1 = nil;
    __block MASConstraint *widthConstraint2 = nil;
    __block MASConstraint *widthConstraint3 = nil;
    __block MASConstraint *widthConstraint4 = nil;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.leftLable.mas_bottom).offset(100);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(60);
    }];
    

    [self.image1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.imageView.mas_left).offset(0);
        make.centerY.mas_equalTo(self.imageView.mas_centerY);
        make.height.mas_equalTo(40);
        widthConstraint1 = make.width.mas_equalTo(40);
    }];
    
    [self.image2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.image1.mas_right).offset(0);
        make.centerY.mas_equalTo(self.imageView.mas_centerY);
        make.height.mas_equalTo(40);
        widthConstraint2 = make.width.mas_equalTo(40);
    }];
    
    [self.image3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.image2.mas_right).offset(0);
        make.centerY.mas_equalTo(self.imageView.mas_centerY);
        make.height.mas_equalTo(40);
        widthConstraint3 = make.width.mas_equalTo(40);
    }];
    
    [self.image4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.image3.mas_right).offset(0);
        make.centerY.mas_equalTo(self.imageView.mas_centerY);
        make.right.mas_equalTo(self.imageView.mas_right).offset(0);
        make.height.mas_equalTo(40);
        widthConstraint4 = make.width.mas_equalTo(40);
    }];
    
     _muArray = [[NSMutableArray alloc]initWithObjects:widthConstraint1,widthConstraint2,widthConstraint3,widthConstraint4, nil];
}

- (void)setLableFrame{

    _leftValue = 0;
    _rightValue = 0;
    [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.topLable.mas_bottom).offset(40);
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.height.mas_equalTo(40);
    }];
    
    [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.leftLable.mas_top);
        make.left.mas_equalTo(self.leftLable.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    //设置label1的content hugging 为1000
    /**Content Hugging = 抱紧！
     这个属性的优先级越高，整个View就要越“抱紧”View里面的内容。也就是View的大小不会随着父级View的扩大而扩大。*/
    [self.leftLable setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置label1的content compression 为1000
    /**Content Compression Resistance = 不许挤我！
     对，这个属性说白了就是“不许挤我”=。=
     这个属性的优先级（Priority）越高，越不“容易”被压缩。也就是说，当整体的空间装不下所有的View的时候，Content Compression Resistance优先级越高的，显示的内容越完整。*/
    [self.leftLable setContentCompressionResistancePriority:UILayoutPriorityRequired
                                             forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置右边的label2的content hugging 为1000
    [self.rightLable setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置右边的label2的content compression 为250
    [self.rightLable setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                             forAxis:UILayoutConstraintAxisHorizontal];
}
- (IBAction)rightClick:(id)sender {
    
    UIStepper * step = (UIStepper *)sender;
    NSMutableString * str = [[NSMutableString alloc]initWithString:self.rightLable.text];
    NSInteger length = str.length;
    if (step.value > _rightValue) {
        
        [str appendString:@"lable2,"];
    }else{
        str = (NSMutableString *)[str substringToIndex:length - 7];
    }
    self.rightLable.text = str;
    _rightValue = step.value;
}
- (IBAction)leftClick:(id)sender {
    
    UIStepper * step = (UIStepper *)sender;
    NSMutableString * str = [[NSMutableString alloc]initWithString:self.leftLable.text];
    NSInteger length = str.length;
    if (step.value > _leftValue) {
        
        [str appendString:@"lable1,"];
    }else{
        str = (NSMutableString *)[str substringToIndex:length - 7];
    }
    self.leftLable.text = str;
    _leftValue = step.value;
}

- (IBAction)switchClick1:(UISwitch *)sender {
    
    CGFloat width1 = 0;
    if (sender.on) {
        width1 = 40;
    }else{
        
    }
    MASConstraint * width = _muArray[0];
    width.mas_equalTo(width1);
}
- (IBAction)switchClick2:(UISwitch *)sender {
    
    CGFloat width1 = 0;
    if (sender.on) {
        width1 = 40;
    }else{
        
    }
    MASConstraint * width = _muArray[1];
    width.mas_equalTo(width1);
}
- (IBAction)switchClick3:(UISwitch *)sender {
    
    CGFloat width1 = 0;
    if (sender.on) {
        width1 = 40;
    }else{
        
    }
    MASConstraint * width = _muArray[2];
    width.mas_equalTo(width1);
}
- (IBAction)switchClick4:(UISwitch *)sender {
    
    CGFloat width1 = 0;
    if (sender.on) {
        width1 = 40;
    }else{
        
    }
    MASConstraint * width = _muArray[3];
    width.mas_equalTo(width1);
}
- (IBAction)sliderChange:(UISlider *)sender {
    
    CGFloat value = sender.value;
    MASConstraint * width = _muArray[4];
    width.mas_equalTo(value * self.view.frame.size.width);
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
