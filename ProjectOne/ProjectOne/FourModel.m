//
//  FourModel.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "FourModel.h"

@implementation FourModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.title = dic[@"title"];
        self.fuTitle = dic[@"sourcename"];
        self.time = dic[@"date"];
        self.count = dic[@"readarts"];
        self.image = dic[@"imglink"];
    }
    return self;
}

@end
