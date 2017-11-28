//
//  SJPageIndicatorSetting.m
//  SJCycleScrollView
//
//  Created by BlueDancer on 2017/11/27.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "SJPageIndicatorSetting.h"

@implementation SJPageIndicatorSetting

- (instancetype)init {
    self = [super init];
    if ( !self ) return nil;
    _pageIndicatorTintColor = [UIColor grayColor];
    _currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageIndicatorSize = CGSizeMake(5, 5);
    return self;
}

- (UIColor *)pageIndicatorTintColor {
    if ( _pageIndicatorTintColor ) return _pageIndicatorTintColor;
    return [UIColor grayColor];
}
- (UIColor *)currentPageIndicatorTintColor {
    if ( _currentPageIndicatorTintColor ) return _currentPageIndicatorTintColor;
    return [UIColor whiteColor];
}
- (CGSize)currenPageIndicatorSize {
    if ( !CGSizeEqualToSize(_currenPageIndicatorSize, CGSizeZero) ) return _currenPageIndicatorSize;
    return self.pageIndicatorSize;
}

@end
