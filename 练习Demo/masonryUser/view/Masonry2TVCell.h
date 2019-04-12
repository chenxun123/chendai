//
//  Masonry2TVCell.h
//  练习Demo
//
//  Created by peter on 2019/3/27.
//  Copyright © 2019年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDFeedEntity.h"
NS_ASSUME_NONNULL_BEGIN

@interface Masonry2TVCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *detailLable;
@property (weak, nonatomic) IBOutlet UILabel *userLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;

@property (nonatomic, strong) FDFeedEntity * model;
@end

NS_ASSUME_NONNULL_END
