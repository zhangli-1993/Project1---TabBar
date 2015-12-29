//
//  FourModel.h
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FourModel : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *fuTitle;
@property(nonatomic, copy) NSString *count;
@property(nonatomic, copy) NSString *image;
@property(nonatomic, copy) NSString *time;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
