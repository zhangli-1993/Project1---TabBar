//
//  FiveTableViewCell.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "FiveTableViewCell.h"
#import <UIImageView+WebCache.h>
#define kWidth [UIScreen mainScreen].bounds.size.width
@interface FiveTableViewCell ()
@property(nonatomic, retain) UILabel *titleLabel;
@property(nonatomic, retain) UILabel *subtitleLabel;
@property(nonatomic, retain) UILabel *time;
@property(nonatomic, retain) UILabel *count;
@property(nonatomic, retain) UIImageView *picture;
@end

@implementation FiveTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loading];
    }
    return self;
}

- (void)loading{
    self.picture = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 98, 98)];
    [self.contentView addSubview:self.picture];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, kWidth - 100, 40)];
    [self.contentView addSubview:self.titleLabel];
    
    self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, kWidth - 100, 20)];
    [self.contentView addSubview:self.subtitleLabel];
    
    self.time = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
    [self.contentView addSubview:self.time];
    
    self.count = [[UILabel alloc] initWithFrame:CGRectMake(kWidth - 50, 80, 50, 20)];
    [self.contentView addSubview:self.count];

}
//重写属性model的setter方法
- (void)setModel:(FiveModel *)model{
    NSURL *url = [NSURL URLWithString:model.picture];
    [self.picture sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.picture.image = image;
    }];
    self.titleLabel.text = model.title;
    self.subtitleLabel.text = model.subtitle;
    self.time.text = model.time;
    self.count.text = model.count;

}














@end
