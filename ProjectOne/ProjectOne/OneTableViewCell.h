//
//  OneTableViewCell.h
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneModel.h"
@interface OneTableViewCell : UITableViewCell
@property(nonatomic, retain) OneModel *model;
+ (CGFloat)getCellHeight;



@end
