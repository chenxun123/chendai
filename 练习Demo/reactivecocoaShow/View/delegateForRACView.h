//
//  delegateForRACView.h
//  练习Demo
//
//  Created by peter on 2019/3/21.
//  Copyright © 2019年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface delegateForRACView : UIView
@property (nonatomic, strong) RACSubject * delegateSubject;
//- (IBAction)switchOn:(id)sender;
@end

NS_ASSUME_NONNULL_END
