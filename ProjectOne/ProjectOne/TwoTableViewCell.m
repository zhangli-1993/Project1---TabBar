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
        self.imageViewTwo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth / 4, kWidth / 4)];
     }
    return _imageViewTwo;
}

- (UILabel *)title{
    if (_title == nil) {
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(kWidth / 4, 0, kWidth / 4 * 3, kWidth / 4 / 3)];
    }
    return _title;
}
- (UILabel *)date{
    if (_date == nil) {
        self.date = [[UILabel alloc]initWithFrame:CGRectMake(kWidth / 4, kWidth / 4 / 3, kWidth / 4 * 3 / 2, kWidth / 4 / 3)];
    }
    return _date;
}

- (UILabel *)readerts{
    if (_readerts == nil) {
        self.readerts = [[UILabel alloc]initWithFrame:CGRectMake(kWidth / 8 * 5, kWidth / 4 / 3, kWidth / 4 * 3 / 2, kWidth / 4 / 3)];
    }
    return _readerts;
}
- (UILabel *)content{
    if (_content == nil) {
        self.content = [[UILabel alloc]initWithFrame:CGRectMake(kWidth / 4, kWidth / 4 / 3 * 2, kWidth / 4 * 3, kWidth / 4 / 3)];
    }
    return _content;
}
- (void)setModel:(TwoModel *)model{
    self.title.text = model.title;
    NSLog(@"%@", self.title.text);
    self.content.text = model.content;
    [self.imageViewTwo sd_setImageWithURL:[NSURL URLWithString:model.image]];
    self.readerts.text = model.reader;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH-mm-ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/shanghai"]];
    NSDate *date = [formatter dateFromString:model.date];
    NSDate *cTime = [formatter dateFromString:model.cTime];
    NSTimeInterval timeInterval = [cTime timeIntervalSinceDate:date];
    if (timeInterval > 3600) {
         self.date.text = [NSString stringWithFormat:@"%.2f小时前", timeInterval /3600];
    }else if (timeInterval <= 3600 && timeInterval >= 60){
         self.date.text = [NSString stringWithFormat:@"%.2f分钟前", timeInterval /60];
    }
   
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
