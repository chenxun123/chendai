//
//  ReactiveObjcVC.m
//  练习Demo
//
//  Created by peter on 2019/3/20.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "ReactiveObjcVC.h"
#import "delegateForRACView.h"
@interface ReactiveObjcVC ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWorldTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@end

@implementation ReactiveObjcVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

#pragma mark - rac的基本操作
//    [self racJBUser];
    
#pragma mark - 使用RACSubject代替代理方法处理回调事件
//    [self greatDelegateView]
    
#pragma mark - rac的高级使用
    [self racUserHeight];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - rac的高级使用
- (void)racUserHeight{
    
    //bind方法使用
    [[[[_accountTextField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        //过滤
        return value.length > 5;
        
    }] ignore:@"123456"] //忽略
      
      bind:^RACSignalBindBlock _Nonnull{//重组
        
        return ^RACSignal * (id value, BOOL * stop){
            
            return [RACSignal return:[NSString stringWithFormat:@"*%@",value]];
        };
        
    }] subscribeNext:^(id  _Nullable x) {

        NSLog(@"%@",x);
    }];
    
    //使用flattenmap
    [[_passWorldTextField.rac_textSignal flattenMap:^__kindof RACSignal * _Nullable(NSString * _Nullable value) {
       
        return [RACSignal return:[NSString stringWithFormat:@"##%@",value]];
        
    }] subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"%@",x);
    }];
    
    //使用map
    [[_codeTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
       
        return [NSString stringWithFormat:@"!!!!!%@",value];
    }] subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"%@",x);
    }];
    
    //concat使用// 把signalA拼接到signalB后，signalA发送完成，signalB才会被激活
    RACSignal * concatA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
             [subscriber sendNext:@"1231"];
             [subscriber sendCompleted];//这个信号必须执行结束语，下面一个信号才能触发
        });
        return nil;
    }];
    
    RACSignal * concatB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
    
        [subscriber sendNext:@"0000"];
//        [subscriber sendCompleted];
        return nil;
    }];
    
    [[concatA concat:concatB] subscribeNext:^(id  _Nullable x) {
        NSLog(@"concat = %@",x);
    }];
    
    
    //then下一个的使用// 只能接收到第二个信号的值，也就是then返回信号的值
    [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [subscriber sendNext:@"then1"];
        [subscriber sendCompleted];//不能不写，不然下面一个不会执行
        return nil;
        
    }] then:^RACSignal * _Nonnull{
        
       return  [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            [subscriber sendNext:@"then2"];
            return nil;
       }];
        
    }] subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"%@",x);
    }];
    
    //merge合并使用 // 合并信号,任何一个信号发送数据，都能监听到.
    RACSignal * mergeA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
       
        [subscriber sendNext:@"merge1"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"combineLatest"];
        });
        return nil;
    }];
    
    RACSignal * mergeB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"merge2"];
        });
        return nil;
    }];
    
    RACSignal * mergeC = [mergeA merge:mergeB];
    [mergeC subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"%@",x);
    }];
    
    //zipWith 压缩 把两个信号压缩成一个信号，只有当两个信号同时发出信号内容时，并且把两个信号的内容合并成一个元组，才会触发压缩流的next事件
    RACSignal * zipWithA = [mergeA zipWith:mergeB];
    [zipWithA subscribeNext:^(id  _Nullable x) {
       
        NSLog(@"zipWith = %@",x);
    }];
    
    //combineLatest  将多个信号合并起来，并且拿到各个信号的最新的值,必须每个合并的signal至少都有过一次sendNext，才会触发合并的信号
    RACSignal * combineLatestA = [mergeA combineLatestWith:mergeB];
    [combineLatestA subscribeNext:^(id  _Nullable x) {
       
        NSLog(@"combineLatest = %@",x);
    }];
    
    
    //reduce 聚合用于信号发出的内容是元组，把信号发出元组的值聚合成一个值 一般都是先组合在聚合
    RACSignal * reducesignal = [RACSignal combineLatest:@[mergeA,mergeB] reduce:^id(NSString * str1 , NSString * str2){
        
        return [NSString stringWithFormat:@"%@~~~~%@",str1,str2];
    }];
    [reducesignal subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"%@",x);
    }];
    
    //interval 定时 take设置执行次数
    [[[RACSignal interval:1 onScheduler:[RACScheduler currentScheduler]] take:5] subscribeNext:^(NSDate * _Nullable x) {
        
        NSLog(@"data1 = %@",x);
    }];
    
    [[[RACSignal interval:1 onScheduler:[RACScheduler currentScheduler] withLeeway:5] take:6] subscribeNext:^(NSDate * _Nullable x) {
        NSLog(@"data2 = %@",x);
    }];
    
    //delay 延迟
    [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [subscriber sendNext:@"延迟执行"];
        return nil;
    }] delay:5] subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"%@",x);
    }];
    
    
    //nsarray数组遍历
    NSArray * array = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    } completed:^{
        NSLog(@"数组遍历完成");
    }];
    //nsdictionary字典遍历
    NSDictionary * dict = @{@"first":@"one",
                            @"second":@"two",
                            @"third":@"three"
                            };
    [dict.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        
        RACTupleUnpack(NSString * key , NSString * value) = x;
        NSLog(@"%@ = %@",key , value);
    } completed:^{
        NSLog(@"字典遍历完成");
    }];
}

#pragma mark - 利用 rac_signalForSelector：实现代理
#pragma mark - 使用RACSubject实现代理
- (void)greatDelegateView{
    
    delegateForRACView * view = [[delegateForRACView alloc] initWithFrame:CGRectMake(0, 300, 300, 40)];
//    view.backgroundColor = [UIColor redColor];
    view.delegateSubject = [RACSubject subject];
    //使用racsubject接收delegateview发送的信息
    [view.delegateSubject  subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
 
    [[view rac_signalForSelector:@selector(switchOn:)] subscribeNext:^(RACTuple * _Nullable x) {
        
        UISwitch * swit = (UISwitch *)x[0];
        self.view.backgroundColor = swit.isOn ? [UIColor yellowColor] : [UIColor whiteColor];
    }];
    [self.view addSubview:view];
}

#pragma mark - rac的基本操作
- (void)racJBUser{
    
#pragma mark - 使用reactiveobject创建按钮点击事件
    
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        NSLog(@"登录按钮被点击了");
        CGRect frame = x.frame;
        frame.origin.x += 1;
        x.frame = frame;
        
    }];
    
#pragma mark - 使用reactiveobject创建kvo观察者
    //监听按钮坐标的变化
    [[self.loginBtn rac_valuesAndChangesForKeyPath:@"frame" options:NSKeyValueObservingOptionNew observer:self] subscribeNext:^(RACTwoTuple<id,NSDictionary *> * _Nullable x) {
        
        NSLog(@"登录按钮位置发生变化 = %@",x);
    }];
    
    [RACObserve(self.loginBtn, frame) subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"登录按钮位置发生变化1 = %@",x);
    }];
    
    
    //监听输入框文本变化,并设置筛选条件
    [[self.accountTextField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return value.length > 5;
    }] subscribeNext:^(NSString * _Nullable x) {
        
        NSLog(@"账户名是符合要求：%@", x);
    }];
    
    // 通过RAC提供的宏快速实现textSingel的监听，让密码框和账户名值同步
    RAC(self.passWorldTextField,text) = self.accountTextField.rac_textSignal;
    
    //监听键盘
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        
        NSLog(@"键盘即将出现");
    }];
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillHideNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        
        NSLog(@"键盘即将隐藏");
    }];
    
    //监听手势事件
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    [[tap rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        
        NSLog(@"点击手势被触发");
    }];
    [self.view addGestureRecognizer:tap];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
#pragma mark - 使用racsignal创建信号
    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        //信号不被订阅，不会执行内部回调。
        [subscriber sendNext:@"1"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
           
            NSLog(@"信号已经注销");
        }];
    }];
    
    //订阅信号。
    [signal subscribeNext:^(id  _Nullable x) {

        NSLog(@"接收到信号");
    }];
    
#pragma mark - 使用racsubject创建信号
    RACSubject * subject1 = [RACSubject subject];
    [subject1 subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"接收到信号1%@",x);
    }];
    
    [subject1 subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"接收到信号2%@",x);
    }] ;
    
    [subject1 sendNext:@"haha"];
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
