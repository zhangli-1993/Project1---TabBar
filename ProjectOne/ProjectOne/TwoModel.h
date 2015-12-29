//
//  TwoModel.h
//  ProjectOne
//
//  Created by SCJY on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoModel : NSObject
@property(nonatomic, copy) NSString *date;
@property(nonatomic, copy) NSString *cTime;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *content;
@property(nonatomic, copy) NSString *image;
@property(nonatomic, copy) NSString *reader;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
