//
//  Masonry8TVCell.h
//  练习Demo
//
//  Created by peter on 2019/4/15.
//  Copyright © 2019年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jieTiView.h"
#import "FDFeedEntity.h"
NS_ASSUME_NONNULL_BEGIN

@interface Masonry8TVCell : UITableViewCell
@property (nonatomic, strong) jieTiView * jtView;
@property (nonatomic, strong) FDFeedEntity * model;
@end

NS_ASSUME_NONNULL_END
