//
//  ViewController.m
//  BMCarouselView
//
//  Created by 李志强 on 2017/5/3.
//  Copyright © 2017年 Li Zhiqiang. All rights reserved.
//

#import "ViewController.h"
#import "BMCarouselView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    BMCarouselView *carouselView = [[BMCarouselView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 500) pictureArray:@[[UIImage imageNamed:@"introduce_0"],[UIImage imageNamed:@"introduce_1"],[UIImage imageNamed:@"introduce_2"],[UIImage imageNamed:@"introduce_3"]] pictureSpacing:5];
    [self.view addSubview:carouselView];
}


@end
