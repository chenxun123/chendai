//
//  FDFeedEntity.h
//  Demo
//
//  Created by sunnyxx on 15/4/16.
//  Copyright (c) 2015年 forkingdog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDFeedEntity : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *imageName;
@property (nonatomic, copy) NSString * textViewStr;
@property (nonatomic, assign) BOOL isHidden;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, strong) NSArray * lableArray;
+ (NSArray *)getShuJu;
@end
