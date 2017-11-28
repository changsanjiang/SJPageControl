//
//  SJPageControl.h
//  SJCycleScrollView
//
//  Created by BlueDancer on 2017/11/27.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SJPageIndicatorSetting;

@interface SJPageControl : UIView

/// page indicators.
@property (nonatomic) NSInteger numberOfPages;

/// default is 0.
@property (nonatomic) NSInteger currentPage;

/// setting page indicators.
@property (nonatomic, strong, readonly) SJPageIndicatorSetting *setting;

/// default is 8.
@property (nonatomic) CGFloat pageIndicatorSpacing;

- (void)update;

- (void)clean;

@end

NS_ASSUME_NONNULL_END
