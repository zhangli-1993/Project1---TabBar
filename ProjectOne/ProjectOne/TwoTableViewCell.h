//
//  TwoTableViewCell.h
//  ProjectOne
//
//  Created by SCJY on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoModel.h"
@interface TwoTableViewCell : UITableViewCell
@property(nonatomic, retain) TwoModel *model;
+ (CGFloat) getHeightWithModel:(TwoModel *)model;
@end
