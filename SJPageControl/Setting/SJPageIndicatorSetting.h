//
//  SJPageIndicatorSetting.h
//  SJCycleScrollView
//
//  Created by BlueDancer on 2017/11/27.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJPageIndicatorSetting : NSObject

/// default is gray.
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

/// default is white.
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

/// default is nil.
@property (nonatomic, strong, nullable) UIImage *pageIndicatorImage;

/// default is nil.
@property (nonatomic, strong, nullable) UIImage *currentPageIndicatorImage;

/// default is [5, 5]
@property (nonatomic) CGSize pageIndicatorSize;

/// default use pageIndicatorSize.
@property (nonatomic) CGSize currenPageIndicatorSize;

@end

NS_ASSUME_NONNULL_END
