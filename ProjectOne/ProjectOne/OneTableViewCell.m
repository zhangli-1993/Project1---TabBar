//
//  OneTableViewCell.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "OneTableViewCell.h"
#define KWidth [UIScreen mainScreen].bounds.size.width
@interface OneTableViewCell ()
@property(nonatomic, retain) UILabel *titleLable1;
@property(nonatomic, retain) UILabel *titleLable2;
@property(nonatomic, retain) UILabel *timeLable;
@property(nonatomic, retain) UIImageView *imageview;
@property(nonatomic, retain) UILabel *readLable;

@end

@implementation OneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self load];
    }
    return self;
}

- (void)load{
    self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, KWidth / 4, KWidth / 4)];
    self.imageview.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.imageview];
    
    
    self.titleLable1 = [[UILabel alloc] initWithFrame:CGRectMake(KWidth / 4 + 5, 0, KWidth * 3 / 4 - 5, KWidth / 12)];
    self.titleLable1.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.titleLable1];
    
    self.titleLable2 = [[UILabel alloc] initWithFrame:CGRectMake(KWidth / 4 + 5, KWidth / 12, KWidth * 3 / 4 - 5, KWidth / 12)];
    self.titleLable2.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.titleLable2];
    
    
    self.timeLable = [[UILabel alloc] initWithFrame:CGRectMake(KWidth / 4 + 5, KWidth / 6, (KWidth * 3 / 4 - 5) / 2, KWidth / 12)];
    self.timeLable.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:self.timeLable];
    
    self.readLable = [[UILabel alloc] initWithFrame:CGRectMake(KWidth / 8 * 5 + 5 / 2, KWidth / 6, KWidth * 3 / 8 - 5 / 2, KWidth / 12)];
    self.readLable.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.readLable];
    
    
    
}

+ (CGFloat)getCellHeight{
    return KWidth / 4 + 20;
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
