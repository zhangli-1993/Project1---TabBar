
//
//  ThreeModel.m
//  ProjectOne
//
//  Created by wanghongxiao on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "ThreeModel.h"

@implementation ThreeModel
- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.photo = dic[@"imglink"];
        self.main = dic[@"title"];
        self.time = dic[@"date"];
        self.count = dic[@"readarts"];
        self.sourcename = dic[@"sourcename"];
    }
    return self;
}
+ (ThreeModel *)getDictionary:(NSDictionary *)dic{
    ThreeModel *model = [[ThreeModel alloc] initWithDictionary:dic];
    return model;
}
@end
