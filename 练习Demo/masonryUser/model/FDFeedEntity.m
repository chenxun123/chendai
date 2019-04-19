//
//  FDFeedEntity.m
//  Demo
//
//  Created by sunnyxx on 15/4/16.
//  Copyright (c) 2015年 forkingdog. All rights reserved.
//

#import "FDFeedEntity.h"

@implementation FDFeedEntity

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _identifier = [self uniqueIdentifier];
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
        _textViewStr = @"世界你好！hello world！";
        _isHidden = NO;
        _lableArray = [self getArray];
    }
    return self;
}

- (NSString *)uniqueIdentifier
{
    static NSInteger counter = 0;
    return [NSString stringWithFormat:@"unique-id-%@", @(counter++)];
}

+ (NSArray *)getShuJu{
 
    // Data from `data.json`
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *feedDicts = rootDict[@"feed"];
    
    // Convert to `FDFeedEntity`
    NSMutableArray *entities = @[].mutableCopy;
    [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [entities addObject:[[FDFeedEntity alloc] initWithDictionary:obj]];
    }];
    
    return entities;
}

- (NSArray *)getArray{
    
    NSArray * arr =  @[@[@"dynamically", @"calculates"],@[@"AutoLayout AutoLayout AutoLayout", @"dynamically", @"calculates"],@[@"calculates"]];
    NSArray * a = arr[arc4random() % 3];
    return  a;
}
@end
