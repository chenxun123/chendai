//
//  Masonry4TVCell.h
//  练习Demo
//
//  Created by peter on 2019/4/9.
//  Copyright © 2019年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDFeedEntity.h"
NS_ASSUME_NONNULL_BEGIN

@protocol Masonry4TVCellClickChangeHeight <NSObject>

- (void)changeModel:(NSIndexPath *)indexPath;
- (void)changeTextViewHeight:(NSIndexPath *)indexPath andCGSize:(CGSize)size andStr:(NSString *)str;
@end

@interface Masonry4TVCell : UITableViewCell<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (weak, nonatomic) IBOutlet UITextView *plTextView;
@property (weak, nonatomic) IBOutlet UIView *TextBGView;

@property (strong, nonatomic) MASConstraint * contentHeightConstraint;
@property (strong, nonatomic) MASConstraint * btnHeight;
@property (strong, nonatomic) MASConstraint * textViewHeight;
@property (nonatomic, strong) FDFeedEntity * model;
@property (nonatomic, strong) NSIndexPath * path;
@property (nonatomic, weak) id<Masonry4TVCellClickChangeHeight>delegate;
@property (nonatomic, assign) CGSize newSize;
@end

NS_ASSUME_NONNULL_END
