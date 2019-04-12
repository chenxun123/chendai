//
//  MasonryVC2.m
//  练习Demo
//
//  Created by peter on 2019/3/27.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MasonryVC2.h"
#import "Masonry2TVCell.h"
#import "FDFeedEntity.h"

#define ImageMaxHeight 200
@interface MasonryVC2 ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * muArray;
@property (nonatomic, strong) MASConstraint *widthConstraint1;

@end

@implementation MasonryVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
        make.left.and.right.mas_equalTo(self.view);
        self->_widthConstraint1 = make.height.mas_equalTo(ImageMaxHeight);
    }];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide);
    }];
    
    _bgImage.contentMode = UIViewContentModeScaleAspectFill;
    _bgImage.image = [UIImage imageNamed:@"parallax_header_back"];

    _muArray = [[NSMutableArray alloc]initWithArray:[FDFeedEntity getShuJu]];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.contentInset = UIEdgeInsetsMake(ImageMaxHeight, 0, 0, 0);
    
    //iOS8 以后只要约束设置没问题，可以使用这两个设置，然后再返回高度的代理方法里面返回UITableViewAutomaticDimension即可自动计算高度
    //或则使用UITableView+FDTemplateLayoutCell自动处理高度
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 80;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"Masonry2TVCell" bundle:nil] forCellReuseIdentifier:@"Masonry2TVCell"];
    
    
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];

    // Do any additional setup after loading the view from its nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _muArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Masonry2TVCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Masonry2TVCell"];
    cell.model = _muArray[indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    return UITableViewAutomaticDimension;//利用iOS8 特性返回高度
    return [tableView fd_heightForCellWithIdentifier:@"Masonry2TVCell" cacheByIndexPath:indexPath configuration:^(id cell) {

        [self configureCell:cell atIndexPath:indexPath];
    }];
}

- (void)configureCell:(Masonry2TVCell *)cell atIndexPath:(NSIndexPath *)path{
    
    cell.model = _muArray[path.row];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        // 取出contentOffset值
        CGPoint contentOffset = ((NSValue *)change[NSKeyValueChangeNewKey]).CGPointValue;
        
//         改变高度
        if (contentOffset.y < -ImageMaxHeight) {
            _widthConstraint1.equalTo(@(-contentOffset.y));
        }
    }
}

- (void)dealloc{
    
    [_tableView removeObserver:self forKeyPath:@"contentOffset"];
}
@end
