//
//  BMCarouselCollectionViewFlowLayout.m
//  BMCarouselView
//
//  Created by 李志强 on 2017/5/23.
//  Copyright © 2017年 Li Zhiqiang. All rights reserved.
//

#import "BMCarouselCollectionViewFlowLayout.h"

#define SCREEN_WIDTH CGRectGetWidth([[UIScreen mainScreen] bounds])
#define SCREEN_HEIGHT CGRectGetHeight([[UIScreen mainScreen] bounds])
static const CGFloat kAspectRatio = 0.74; //图片宽高比，宽/高
static const CGFloat kLineSpacing = 20;   //图片之间的空隙

@implementation BMCarouselCollectionViewFlowLayout

#pragma mark - Override
- (void)prepareLayout {
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // cell间距
    self.minimumLineSpacing = kLineSpacing;
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    CGFloat itemWidth = (SCREEN_WIDTH - kLineSpacing * 2) / 1.2; //图片宽度+2个空隙+2个图片宽度的10% = ScreenWidth
    self.itemSize = CGSizeMake(itemWidth, itemWidth / kAspectRatio);
    [super prepareLayout];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *superAttributes = [super layoutAttributesForElementsInRect:rect];
    NSArray *attributes = [[NSArray alloc] initWithArray:superAttributes copyItems:YES];
    
    CGRect visibleRect = CGRectMake(self.collectionView.contentOffset.x, self.collectionView.contentOffset.y,
                                    self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    CGFloat offset = CGRectGetMidX(visibleRect);
    
    [attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attribute, NSUInteger idx, BOOL *_Nonnull stop) {
        CGFloat distance = offset - attribute.center.x;
        // 越往中心移动，值越小，那么缩放就越小，从而显示就越大
        // 同样，超过中心后，越往左、右走，缩放就越大，显示就越小
        CGFloat scaleForDistance = distance / self.itemSize.height;
        // 0.2可调整，值越大，显示就越大
        CGFloat scaleForCell = 0.9 + 0.1 * (1 - fabs(scaleForDistance));
        
        // only scale y-axis
        attribute.transform3D = CATransform3DMakeScale(1, scaleForCell, 1);
        attribute.zIndex = 1;
    }];
    
    return attributes;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    if (proposedContentOffset.x > self.collectionViewContentSize.width - SCREEN_WIDTH * 1.5) {
        return CGPointMake(self.collectionViewContentSize.width - SCREEN_WIDTH, 0);
    }
    
    // 1.获取collectionView最后停留的范围
    CGRect lastRect;
    lastRect.origin = proposedContentOffset;
    lastRect.size = self.collectionView.frame.size;
    
    // 2.取出这个范围类所有布局属性
    NSArray *array = [self layoutAttributesForElementsInRect:lastRect];
    
    // 3.遍历所有布局的属性
    //停止滑动时item应该在的位置
    __block CGFloat adjustOffsetX = MAXFLOAT;
    
    //屏幕中间的X
    
    CGFloat screenCenterX = proposedContentOffset.x + self.collectionView.frame.size.width / 2.0;
    [array enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        if (ABS(obj.center.x - screenCenterX) < ABS(adjustOffsetX)) {
            adjustOffsetX = obj.center.x - screenCenterX;
        }
    }];
    
    return CGPointMake(proposedContentOffset.x + adjustOffsetX, proposedContentOffset.y);
}

@end
