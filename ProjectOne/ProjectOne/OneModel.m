//
//  OneModel.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "OneModel.h"

@implementation OneModel
- (instancetype)initWithDictory:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.title1 = dic[@"title"];
        self.title2 = dic[@"content168"];
        self.image = dic[@"imglink"];
        self.read = dic[@"readarts"];
        self.time = dic[@"date"];
    }
    return self;
}



@end
