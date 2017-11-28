//
//  ViewController.m
//  SJPageControl
//
//  Created by BlueDancer on 2017/11/28.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "SJPageControlHeader.h"

@interface ViewController ()

@property (nonatomic, strong) SJPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _pageControl = [SJPageControl new];
    [self.view addSubview:_pageControl];
    _pageControl.numberOfPages = 3;
    _pageControl.setting.pageIndicatorSize = CGSizeMake(20, 20);
    _pageControl.setting.currentPageIndicatorImage = [UIImage imageNamed:@"current"];
    _pageControl.setting.currenPageIndicatorSize = CGSizeMake(40, 40);
    _pageControl.setting.pageIndicatorImage = [UIImage imageNamed:@"page"];
    
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
    
    
    [_pageControl update];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)add:(id)sender {
    _pageControl.numberOfPages += 1;
}

- (IBAction)remove:(id)sender {
    _pageControl.numberOfPages -= 1;
}

- (IBAction)clean:(id)sender {
    _pageControl.numberOfPages = 0;
}

- (IBAction)current:(id)sender {
    _pageControl.currentPage += 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
