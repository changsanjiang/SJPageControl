//
//  SJPageControl.m
//  SJCycleScrollView
//
//  Created by BlueDancer on 2017/11/27.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "SJPageControl.h"
#import <Masonry/Masonry.h>
#import <objc/message.h>
#import "SJPageIndicatorSetting.h"
#import "SJPageIndicator.h"

#pragma mark -
@interface SJPageControl ()

@property (nonatomic, strong, readonly) UIView *contentView;

@property (nonatomic, strong, readonly) NSMutableArray<SJPageIndicator *> *indicatorsM;

@end

@implementation SJPageControl  {
    NSMutableArray<SJPageIndicator *> *_indicatorsM;
    UIView *_contentView;
    SJPageIndicatorSetting *_setting;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( !self ) return nil;
    // set default values
    _pageIndicatorSpacing = 8;
    
    // setup views
    [self _pageControlSetupViews];
    
    return self;
}

- (CGSize)intrinsicContentSize {
    return [self _contentSizeOfPageNumber:_numberOfPages - 1];
}

- (void)update {
    NSInteger number = _numberOfPages;
    [self clean];
    self.numberOfPages = number;
}

- (void)clean {
    self.numberOfPages = 0;
}

#pragma mark -
- (void)setCurrentPage:(NSInteger)currentPage {
    if ( currentPage >= _numberOfPages ) currentPage = _numberOfPages - 1;
    if ( currentPage < 0 ) currentPage = 0;
    
    if ( _currentPage <= _numberOfPages - 1 ) self.indicatorsM[_currentPage].currentPage = NO;
    self.indicatorsM[currentPage].currentPage = YES;
    
    _currentPage = currentPage;
}

- (CGSize)_contentSizeOfPageNumber:(NSInteger)pageNum {
    if ( pageNum < 0 ) return CGSizeZero;
    __block CGFloat content_w = self.pageIndicatorSpacing;
    
    CGFloat i_w = self.setting.pageIndicatorSize.width;
    CGFloat spacing = _pageIndicatorSpacing;

    for ( int i = 0 ; i <= pageNum ; i ++ ) content_w += i_w + spacing;
    
    if ( pageNum >= _currentPage ) {
        content_w -= i_w;
        content_w += self.setting.currenPageIndicatorSize.width;
    }
    return CGSizeMake(content_w, MAX(self.setting.currenPageIndicatorSize.height, self.setting.pageIndicatorSize.height) + 16);
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    if ( numberOfPages == _numberOfPages ) return;
    if ( numberOfPages > 0 ) {
        // create
        if ( numberOfPages > _numberOfPages ) {
            BOOL needsSetCurrentPage = _numberOfPages == 0;
            while ( _numberOfPages != numberOfPages  ) {
                SJPageIndicator *pageIndicator = [SJPageIndicator new];
                pageIndicator.setting = self.setting;
                [self.contentView addSubview:pageIndicator];
                [pageIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.bottom.equalTo(pageIndicator.superview);
                    if ( _indicatorsM.lastObject ) make.leading.equalTo(_indicatorsM.lastObject.mas_trailing).offset(_pageIndicatorSpacing);
                    else make.leading.offset(_pageIndicatorSpacing);
                }];
                [self.indicatorsM addObject:pageIndicator];
                _numberOfPages ++;
            }
            
            // setting current page
            if ( needsSetCurrentPage ) self.currentPage = 0;
        }
        else {
            // remove
            while ( _numberOfPages != numberOfPages ) {
                _numberOfPages --;
                [_indicatorsM.lastObject removeFromSuperview];
                [_indicatorsM removeLastObject];
            }
            
            // setting current page
            if ( _currentPage >= _numberOfPages ) self.currentPage = _numberOfPages - 1;
        }
    }
    else {
        // clean
        while ( _indicatorsM.count ) {
            [_indicatorsM.lastObject removeFromSuperview];
            [_indicatorsM removeLastObject];
        }
        
        // reset
        _numberOfPages = 0;
        _currentPage = 0;
    }
    [self invalidateIntrinsicContentSize];
}

#pragma mark
- (void)_pageControlSetupViews {
    [self addSubview:self.contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}

- (UIView *)contentView {
    if ( _contentView ) return _contentView;
    _contentView = [UIView new];
    _contentView.backgroundColor = [UIColor clearColor];
    return _contentView;
}

- (NSMutableArray<SJPageIndicator *> *)indicatorsM {
    if ( _indicatorsM ) return _indicatorsM;
    _indicatorsM = [NSMutableArray new];
    return _indicatorsM;
}

- (SJPageIndicatorSetting *)setting {
    if ( _setting ) return _setting;
    _setting = [SJPageIndicatorSetting new];
    return _setting;
}

@end
