//
//  FourTableViewCell.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "FourTableViewCell.h"
#import <UIImageView+WebCache.h>

#define kWidth [UIScreen mainScreen].bounds.size.width

@interface FourTableViewCell ()
@property(nonatomic, retain) UIImageView *picture;
@property(nonatomic, retain) UILabel *title;
@property(nonatomic, retain) UILabel *fuTitle;
@property(nonatomic, retain) UILabel *time;
@property(nonatomic, retain) UILabel *count;

@end

@implementation FourTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView{
    [self.contentView addSubview:self.picture];
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.fuTitle];
    [self.contentView addSubview:self.time];
    [self.contentView addSubview:self.count];
}

- (UIImageView *)picture{
    if (!_picture) {
        self.picture = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth / 4, kWidth /4)];
        self.picture.backgroundColor = [UIColor greenColor];
    }
    return _picture;
}

- (UILabel *)title{
    if (!_title) {
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 4, 0, kWidth * 0.75, kWidth / 4 / 2)];
        self.title.font = [UIFont systemFontOfSize:14.0f];
    }
    return _title;
}

- (UILabel *)fuTitle{
    if (!_fuTitle) {
        self.fuTitle = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 4 , kWidth / 4 / 2, kWidth * 0.75, kWidth / 4 / 4)];
        self.fuTitle.textColor = [UIColor lightGrayColor];
    }
    return _fuTitle;
}

- (UILabel *)time{
    if (!_time) {
        self.time = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 4, kWidth / 4 * 0.75, kWidth / 4, kWidth / 4 / 4)];
    }
    return _time;
}

- (UILabel *)count{
    if (!_count) {
        self.count = [[UILabel alloc] initWithFrame:CGRectMake(kWidth * 0.5, kWidth / 4 * 0.75, kWidth / 2, kWidth / 4 / 4)];
        self.count.textAlignment = NSTextAlignmentRight;
    }
    return _count;
}


- (void)setModel:(FourModel *)model{
    NSURL *url = [NSURL URLWithString:model.image];
    [self.picture sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.picture.image = image;
    }];
    self.title.text = model.title;
    self.fuTitle.text = model.fuTitle;
    self.count.text = model.count;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *datestr = [formatter dateFromString:model.time];
    NSTimeInterval timeInterval = -[datestr timeIntervalSinceNow];
    if (timeInterval < 60) {
        self.time.text = @"刚刚";
    }else if (timeInterval > 60 && timeInterval < 3600){
        NSInteger minute = timeInterval / 60;
        self.time.text = [NSString stringWithFormat:@"%ld分钟之前", minute];
    }else{
        NSInteger hour = timeInterval / 3600;
        if (hour > 24) {
            self.time.text = [NSString stringWithFormat:@"%ld天之前", hour / 24];
        }else{
            self.time.text = [NSString stringWithFormat:@"%ld小时之前", hour];
        }
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
