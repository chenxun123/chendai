//
//  Masonry5TVCell.h
//  练习Demo
//
//  Created by peter on 2019/4/11.
//  Copyright © 2019年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry4TVCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface Masonry5TVCell : UITableViewCell<UITextViewDelegate>

@property (nonatomic, strong) NSIndexPath * path;
@property (nonatomic, strong) UITextView * textView;
@property (nonatomic, weak) id<Masonry4TVCellClickChangeHeight>delegate;
@property (strong, nonatomic) MASConstraint * textViewHeight;
@end

NS_ASSUME_NONNULL_END
