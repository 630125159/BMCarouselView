//
//  BMCarouselCollectionViewCell.m
//  BMCarouselView
//
//  Created by 李志强 on 2017/5/23.
//  Copyright © 2017年 Li Zhiqiang. All rights reserved.
//

#import "BMCarouselCollectionViewCell.h"

@interface BMCarouselCollectionViewCell ()

@property (nonatomic, strong) UIView *imageView;

@end

@implementation BMCarouselCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIView alloc] initWithFrame:self.bounds];
        self.imageView.layer.cornerRadius = 3;
        self.imageView.layer.masksToBounds = YES;
        [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)configWithImage:(id)image {
    self.imageView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:image].CGImage);
}

@end
