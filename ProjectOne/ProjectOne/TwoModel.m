//
//  TwoModel.m
//  ProjectOne
//
//  Created by SCJY on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "TwoModel.h"

@implementation TwoModel
- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.cTime = dic[@"CTIME"];
        self.date = dic[@"date"];
        self.title = dic[@"title"];
        self.content = dic[@"sourcename"];
        self.image = dic[@"imglink"];
        self.reader = dic[@"readarts"];
    }
    return self;
}
@end
