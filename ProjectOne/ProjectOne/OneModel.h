//
//  OneModel.h
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneModel : NSObject
@property(nonatomic, retain) NSString *title1;
@property(nonatomic, retain) NSString *title2;
@property(nonatomic, retain) NSString *image;
@property(nonatomic, retain) NSString *time;
@property(nonatomic, retain) NSString *read;


- (instancetype)initWithDictory:(NSDictionary *)dic;



@end
