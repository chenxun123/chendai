//
//  TableViewCell.h
//  练习Demo
//
//  Created by peter on 2019/4/15.
//  Copyright © 2019年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDFeedEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface Masonry7TVCell : UITableViewCell

@property (nonatomic, strong) UILabel * firstrLable;
@property (nonatomic, strong) UILabel * secondLable;
@property (nonatomic, strong) UILabel * threeLable;

@property (nonatomic, strong) FDFeedEntity * model;
@end

NS_ASSUME_NONNULL_END
