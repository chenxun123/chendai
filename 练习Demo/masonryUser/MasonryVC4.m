//
//  MasonryVC4.m
//  练习Demo
//
//  Created by peter on 2019/4/9.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MasonryVC4.h"
#import "MyTVDataSource.h"
#import "Masonry4TVCell.h"
@interface MasonryVC4 ()<UITableViewDelegate,UITableViewDataSource,Masonry4TVCellClickChangeHeight>
//@property (nonatomic, strong) MyTVDataSource * dataSource;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * muArray;
@end

@implementation MasonryVC4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _muArray = [[NSMutableArray alloc]initWithArray:[FDFeedEntity getShuJu]];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"masonryVC4Cell"];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.and.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
    
    
//    TableViewCellConfigureBlock cellBlock = ^(Masonry4TVCell * cell, FDFeedEntity * model){
//
//        cell.model = model;
//    };
    
//    self.dataSource = [[MyTVDataSource alloc]initWithItems:self.muArray andCellIdentifier:@"masonryVC4Cell" andTableView:self.tableView andConfigureCellBlock:cellBlock];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"Masonry4TVCell" bundle:nil] forCellReuseIdentifier:@"MasonryVC4Cell"];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - UITableviewDataSource代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.muArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Masonry4TVCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MasonryVC4Cell"];
    cell.model = _muArray[indexPath.row];
    cell.delegate = self;
    cell.path = indexPath;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    FDFeedEntity * model = _muArray[indexPath.row];
//    if (model.isHidden) {
        //这里是为了处理只刷新高度不走缓存的高度问题
        return [tableView fd_heightForCellWithIdentifier:@"MasonryVC4Cell"         configuration:^(id cell) {
            
            [self configureCell:cell atIndexPath:indexPath];
        }];
//    }else{
//        return [tableView fd_heightForCellWithIdentifier:@"MasonryVC4Cell" cacheByIndexPath:indexPath configuration:^(id cell) {
//
//            [self configureCell:cell atIndexPath:indexPath];
//        }];
//
//    }
}

- (void)configureCell:(Masonry4TVCell *)cell atIndexPath:(NSIndexPath *)path{
    
    cell.model = _muArray[path.row];
}

#pragma mark- 代理方法
- (void)changeModel:(NSIndexPath *)indexPath{
    
    FDFeedEntity * model = _muArray[indexPath.row];
    model.isHidden = !model.isHidden;
    
    // 刷新方法1：只会重新计算高度,不会reload cell,所以只是把原来的cell撑大了而已,还是同一个cell实例，需要在返回高度的代理方法里面做处理
//    [_tableView beginUpdates];
//    [_tableView endUpdates];
    
//    // 刷新方法2：先重新计算高度,然后reload,不是原来的cell实例，只需要调用带缓存的高度返回
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    // 让展开/收回的Cell居中，酌情加，看效果决定
//    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}
- (void)changeTextViewHeight:(NSIndexPath *)indexPath andCGSize:(CGSize)size andStr:(nonnull NSString *)str{
    
    FDFeedEntity * model = _muArray[indexPath.row];
    model.textViewStr = str;
//    model.size = size;
    [_tableView beginUpdates];
    [_tableView endUpdates];
    
//    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
