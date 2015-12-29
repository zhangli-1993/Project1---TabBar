//
//  TwoTableViewCell.m
//  ProjectOne
//
//  Created by SCJY on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "TwoTableViewCell.h"
#import "UIImageView+WebCache.h"

#define kWidth [UIScreen mainScreen].bounds.size.width

@interface TwoTableViewCell()
@property(nonatomic, retain) UIImageView *imageViewTwo;
@property(nonatomic, retain) UILabel *title;
@property(nonatomic, retain) UILabel *content;
@property(nonatomic, retain) UILabel *date;
@property(nonatomic, retain) UILabel *readerts;

@end
@implementation TwoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loading];
    }
    return self;
}

- (void)loading{
       [self addSubview:self.imageViewTwo];
       [self addSubview:self.title];
       [self addSubview:self.content];
       [self addSubview:self.date];
       [self addSubview:self.readerts];
}

- (UIImageView *)imageViewTwo{
    if (_imageViewTwo == nil) {
        self.imageViewTwo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth / 5, kWidth / 5)];
     }
    return _imageViewTwo;
}

- (UILabel *)title{
    if (_title == nil) {
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(kWidth / 5, 0, kWidth / 5 * 4, kWidth / 5 / 2)];
    }
    return _title;
}
- (UILabel *)date{
    if (_date == nil) {
        self.date = [[UILabel alloc]initWithFrame:CGRectMake(kWidth / 5, kWidth / 5 / 2, kWidth / 5 * 2, kWidth / 5 / 2)];
    }
    return _date;
}

- (UILabel *)readerts{
    if (_readerts == nil) {
        self.readerts = [[UILabel alloc]initWithFrame:CGRectMake(kWidth / 5 * 3, kWidth / 5 / 2, kWidth / 5 * 2, kWidth / 5 / 2)];
    }
    return _readerts;
}
- (UILabel *)content{
    if (_content == nil) {
        self.content = [[UILabel alloc]initWithFrame:CGRectMake(0, kWidth / 5, kWidth , kWidth / 4 / 3)];
        self.content.numberOfLines = 0;
        self.content.font = [UIFont systemFontOfSize:17.0];
    }
    return _content;
}
- (void)setModel:(TwoModel *)model{
    self.title.text = model.title;
    self.content.text = model.content;
    CGRect frame = self.content.frame;
    frame.size.height = [[self class]getHeightWithText:model.content];
    self.content.frame = frame;
    self.readerts.text = model.reader;
    [self.imageViewTwo sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH-mm-ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/shanghai"]];
    NSDate *date = [formatter dateFromString:model.date];
    NSDate *cTime = [formatter dateFromString:model.cTime];
    NSTimeInterval timeInterval = [cTime timeIntervalSinceDate:date];
    if (timeInterval > 3600) {
         self.date.text = [NSString stringWithFormat:@"%.0f小时前", timeInterval /3600];
    }else if (timeInterval <= 3600 && timeInterval >= 60){
         self.date.text = [NSString stringWithFormat:@"%.0f分钟前", timeInterval /60];
    }else if (timeInterval < 60){
        self.date.text = @"刚刚";
    }else{
        self.date.text = [NSString stringWithFormat:@"%.0f天前", timeInterval / 3600 / 24];
    }
   
}

+ (CGFloat)getHeightWithText:(NSString *)text{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(kWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17.0]} context:nil];
    return rect.size.height;
}

+ (CGFloat) getHeightWithModel:(TwoModel *)model{
    return kWidth / 5 + [[self class]getHeightWithText:model.content];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
