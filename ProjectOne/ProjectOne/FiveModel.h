//
//  FiveModel.h
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FiveModel : NSObject
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *subtitle;
@property(nonatomic, retain) NSString *time;
@property(nonatomic, retain) NSString *count;
@property(nonatomic, retain) NSString *picture;

- (instancetype)initWithDictory:(NSDictionary *)dic;
@end
