//
//  SJPageIndicator.m
//  SJCycleScrollView
//
//  Created by BlueDancer on 2017/11/27.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "SJPageIndicator.h"
#import <Masonry/Masonry.h>
#import "SJPageIndicatorSetting.h"

@interface SJPageIndicator ()

@property (nonatomic, strong, readonly) UIImageView *pageIndicatorImageView;
@property (nonatomic, strong, readonly) UIImageView *currentPageIndicatorImageView;

@end

@implementation SJPageIndicator {
    UIImageView *_pageIndicatorImageView;
    UIImageView *_currentPageIndicatorImageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( !self ) return nil;
    [self _buttonSetupView];
    return self;
}

- (CGSize)intrinsicContentSize {
    CGFloat width = _currentPage ? _setting.currenPageIndicatorSize.width : _setting.pageIndicatorSize.width;
    return CGSizeMake(width, MAX(_setting.currenPageIndicatorSize.height, _setting.pageIndicatorSize.height) + 16);
}

- (void)setSetting:(SJPageIndicatorSetting *)setting {
    if ( !CGSizeEqualToSize(setting.pageIndicatorSize, _setting.pageIndicatorSize) ) {
        CGFloat min = MIN(setting.pageIndicatorSize.width, setting.pageIndicatorSize.height) * .5f;
        [_pageIndicatorImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(setting.pageIndicatorSize);
        }];
        
        if ( setting.pageIndicatorImage ) {
            _pageIndicatorImageView.layer.cornerRadius = 0;
            _pageIndicatorImageView.image = setting.pageIndicatorImage;
        }
        else {
            _pageIndicatorImageView.layer.cornerRadius = min;
            _pageIndicatorImageView.backgroundColor = setting.pageIndicatorTintColor;
        }
    }
    
    if ( !CGSizeEqualToSize(setting.currenPageIndicatorSize, _setting.currenPageIndicatorSize) ) {
        CGFloat min = MIN(setting.currenPageIndicatorSize.width, setting.currenPageIndicatorSize.height) * .5f;
        [_currentPageIndicatorImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(setting.currenPageIndicatorSize);
        }];
        
        if ( setting.currentPageIndicatorImage ) {
            _currentPageIndicatorImageView.layer.cornerRadius = 0;
            _currentPageIndicatorImageView.image = setting.currentPageIndicatorImage;
        }
        else {
            _currentPageIndicatorImageView.layer.cornerRadius = min;
            _currentPageIndicatorImageView.backgroundColor = setting.currentPageIndicatorTintColor;
        }
    }
    
    _setting = setting;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
}

- (void)setCurrentPage:(BOOL)currentPage {
    _currentPage = currentPage;
    
    _currentPageIndicatorImageView.hidden = !currentPage;
    _pageIndicatorImageView.hidden = currentPage;
    
    if ( currentPage ) {
        if ( _setting.currentPageIndicatorImage ) {
            _currentPageIndicatorImageView.image = _setting.currentPageIndicatorImage;
        }
        else {
            _currentPageIndicatorImageView.backgroundColor = _setting.currentPageIndicatorTintColor;
        }
    }
    else {
        if ( _setting.pageIndicatorImage ) {
            _pageIndicatorImageView.image = _setting.pageIndicatorImage;
        }
        else {
            _pageIndicatorImageView.backgroundColor = _setting.pageIndicatorTintColor;
        }
    }
    
    [self invalidateIntrinsicContentSize];
}

#pragma mark
- (void)_buttonSetupView {
    [self addSubview:self.pageIndicatorImageView];
    [_pageIndicatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
    
    [self addSubview:self.currentPageIndicatorImageView];
    _currentPageIndicatorImageView.hidden = YES;
    [_currentPageIndicatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
}

- (UIImageView *)pageIndicatorImageView {
    if ( _pageIndicatorImageView ) return _pageIndicatorImageView;
    _pageIndicatorImageView = [self _createImageView];
    return _pageIndicatorImageView;
}

- (UIImageView *)currentPageIndicatorImageView {
    if ( _currentPageIndicatorImageView ) return _currentPageIndicatorImageView;
    _currentPageIndicatorImageView = [self _createImageView];
    return _currentPageIndicatorImageView;
}

- (UIImageView *)_createImageView {
    UIImageView *imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds = YES;
    return imageView;
}

@end
