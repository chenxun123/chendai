//
//  MasonryUserVC.m
//  练习Demo
//
//  Created by peter on 2019/3/26.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "MasonryUserVC.h"
#import "MyTVDataSource.h"
#import "masonryModel.h"
#import "练习Demo-Bridging-Header.h"

static NSString * const UITableViewCellIndefi  = @"masonryCell";

@interface MasonryUserVC ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *MyTableView;
@property (nonatomic, strong) MyTVDataSource * myDatasource;
@end

@implementation MasonryUserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Test2 * te = []
    
    
    [self setupTableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupTableView{
    
    TableViewCellConfigureBlock configureCell = ^(UITableViewCell * cell , masonryModel * model){
        
        cell.textLabel.text = model.titleStr;
    };
    self.myDatasource = [[MyTVDataSource alloc]initWithItems:[masonryModel creatMNArrayModel] andCellIdentifier:UITableViewCellIndefi andTableView:self.MyTableView andConfigureCellBlock:configureCell];
    
    self.MyTableView.dataSource = self.myDatasource;
    self.MyTableView.delegate   = self;
    [self.MyTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellIndefi];
}

#pragma mark - uitableviewDelegate代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UIViewController * vc = [[NSClassFromString([NSString stringWithFormat:@"MasonryVC%ld",indexPath.row + 1]) alloc]init];
    masonryModel * model = (masonryModel *)[self.myDatasource itemAtIndexPath:indexPath];
    vc.title             = model.titleStr;
    [self.navigationController pushViewController:vc animated:YES];
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
