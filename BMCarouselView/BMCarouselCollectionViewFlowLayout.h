//
//  BMCarouselCollectionViewFlowLayout.h
//  BMCarouselView
//
//  Created by 李志强 on 2017/5/23.
//  Copyright © 2017年 Li Zhiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMCarouselCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat aspectRatio;//图片宽高比，宽/高
@property (nonatomic, assign) CGFloat picSpacing;//图片之间的空隙

@end
