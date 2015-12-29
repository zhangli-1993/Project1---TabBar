//
//  ThreeModel.h
//  ProjectOne
//
//  Created by wanghongxiao on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThreeModel : NSObject
@property(nonatomic, copy) NSString *photo;
@property(nonatomic, copy) NSString *main;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, copy) NSString *count;
@property(nonatomic, copy) NSString *sourcename;
+ (ThreeModel *)getDictionary:(NSDictionary *)dic;
@end
