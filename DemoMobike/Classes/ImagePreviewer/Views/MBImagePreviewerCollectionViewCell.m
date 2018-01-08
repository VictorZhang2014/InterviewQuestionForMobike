//
//  MBImagePreviewerCollectionViewCell.m
//  DemoMobike
//
//  Created by VictorZhang on 2018/1/8.
//  Copyright © 2018年 VictorZhang. All rights reserved.
//

#import "MBImagePreviewerCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>


@interface MBImagePreviewerCollectionViewCell()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation MBImagePreviewerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(2.5);
            make.left.mas_equalTo(2.5);
            make.bottom.mas_equalTo(self.mas_bottom).offset = -2.5;
            make.right.mas_equalTo(self.mas_right).offset = -2.5;
        }];
    }
    return self;
}

- (void)updateImage:(NSString *)urlStr {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[[UIImage alloc] init] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
}

@end
