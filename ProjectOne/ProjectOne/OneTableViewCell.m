//
//  OneTableViewCell.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "OneTableViewCell.h"
#import "UIImageView+WebCache.h"
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
    
    [self.contentView addSubview:self.imageview];
    
    
    self.titleLable1 = [[UILabel alloc] initWithFrame:CGRectMake(KWidth / 4 + 5, 0, KWidth * 3 / 4 - 5, KWidth / 12)];
    [self.contentView addSubview:self.titleLable1];
    
    self.titleLable2 = [[UILabel alloc] initWithFrame:CGRectMake(KWidth / 4 + 5, KWidth / 12, KWidth * 3 / 4 - 5, KWidth / 12)];
    [self.contentView addSubview:self.titleLable2];
    
    
    self.timeLable = [[UILabel alloc] initWithFrame:CGRectMake(KWidth / 4 + 5, KWidth / 6, (KWidth * 3 / 4 - 5) / 2, KWidth / 12)];
    [self.contentView addSubview:self.timeLable];
    
    self.readLable = [[UILabel alloc] initWithFrame:CGRectMake(KWidth / 8 * 5 + 5 / 2, KWidth / 6, KWidth * 3 / 8 - 5 / 2 - 10, KWidth / 12)];
    self.readLable.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.readLable];
    
    
    
    
}
- (void)setModel:(OneModel *)model{
    self.titleLable1.text = model.title1;
    self.titleLable1.font = [UIFont systemFontOfSize:15];
    self.titleLable1.numberOfLines = 0;
    self.titleLable2.text = model.title2;
    self.titleLable2.font = [UIFont systemFontOfSize:13];
    
    self.titleLable2.textColor = [UIColor grayColor];
    self.readLable.text = model.read;
    self.readLable.font = [UIFont systemFontOfSize:13];
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
   // [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/shanghai"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1 = [formatter dateFromString:model.time];
    NSTimeInterval time1 = [date1 timeIntervalSinceNow];
    if (-time1 < 60) {
        self.timeLable.text = @"刚刚";
    } else if (-time1 >= 60 && -time1 < 3600) {
        self.timeLable.text = [NSString stringWithFormat:@"%d分钟前", -(int)time1 / 60];
    } else if(-time1 > 3600 && -time1 < 3600 * 24) {
        self.timeLable.text = [NSString stringWithFormat:@"%d小时前", -(int)time1 / 3600];
    } else if (-time1 > 3600 * 24) {
        self.timeLable.text = [NSString stringWithFormat:@"%d天前", -(int)time1 / (3600 * 24)];
    }
    self.timeLable.font = [UIFont systemFontOfSize:13];
    
}



+ (CGFloat)getCellHeight{
    return KWidth / 4 + 10;
}













- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
