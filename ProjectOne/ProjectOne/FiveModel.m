//
//  FiveModel.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "FiveModel.h"

@implementation FiveModel
- (instancetype)initWithDictory:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _title = dic[@"title"];
        _subtitle = dic[@"titlespelling"];
        _time = dic[@"date"];
        _count = dic[@"readarts"];
        _picture = dic[@"imglink"];
    }
    return self;
}
@end
