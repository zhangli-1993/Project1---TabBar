//
//  ThreeTableViewCell.m
//  ProjectOne
//
//  Created by wanghongxiao on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "ThreeTableViewCell.h"
#import <UIImageView+WebCache.h>
#define kWidth [UIScreen mainScreen].bounds.size.width

@interface ThreeTableViewCell ()
@property(nonatomic, retain) UIImageView *photoView;
@property(nonatomic, retain) UILabel *mainLabel;
@property(nonatomic, retain) UILabel *timeLabel;
@property(nonatomic, retain) UILabel *countLabel;
@property(nonatomic, retain) UILabel *subLabel;
@end

@implementation ThreeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.mainLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.countLabel];
        [self addSubview:self.photoView];
        [self addSubview:self.subLabel];
    }
    return self;
}
- (UIImageView *)photoView{
    if (_photoView == nil) {
        self.photoView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, kWidth / 5, kWidth / 6)];
    }
    return _photoView;
}
- (UILabel *)mainLabel{
    if (_mainLabel == nil) {
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 5 + 10, 5, kWidth - kWidth / 5 - 10, 80 / 3)];
        self.mainLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _mainLabel;
}
- (UILabel *)subLabel{
    if (_subLabel == nil) {
        self.subLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 5 + 10, 5 + 80 / 3, kWidth - kWidth / 5 - 10, 80 / 3)];
        self.subLabel.font = [UIFont systemFontOfSize:15.0];
        self.subLabel.textColor = [UIColor brownColor];
    }
    return _subLabel;
}
- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 5 + 10, 5 + 80 / 3 * 2, kWidth, 80 / 3)];
        self.timeLabel.font = [UIFont systemFontOfSize:15.0];
        self.timeLabel.textColor = [UIColor lightGrayColor];
    }
    return _timeLabel;
}
- (UILabel *)countLabel{
    if (_countLabel == nil) {
        self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth - 100, 20, 80, 44)];
        self.countLabel.textAlignment = NSTextAlignmentRight;
        self.countLabel.font = [UIFont systemFontOfSize:25.0];
        self.countLabel.textColor = [UIColor lightGrayColor];
    }
    return _countLabel;
}
- (void)setModel:(ThreeModel *)model{
    NSURL *url = [NSURL URLWithString:model.photo];
    [self.photoView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.photoView.image = image;
    }];
    self.mainLabel.text = model.main;
    self.subLabel.text = model.sourcename;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:model.time];
    NSTimeInterval laterTime = - [date timeIntervalSinceNow];
    NSLog(@"%f", laterTime);
    NSString *timeStr;
    if (laterTime > 60 && laterTime < 3600) {
        timeStr = [NSString stringWithFormat:@"%.f分钟前", laterTime / 60];
    } else if (laterTime < 60) {
        timeStr = @"刚刚";
    } else if (laterTime > 3600 && laterTime < 3600 * 24) {
        timeStr = [NSString stringWithFormat:@"%.f小时前", laterTime / 3600];
    } else{
        timeStr = [NSString stringWithFormat:@"%.f天前", laterTime / 3600 / 24];
    }
    self.timeLabel.text = timeStr;
    self.countLabel.text = model.count;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
