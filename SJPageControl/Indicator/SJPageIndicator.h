//
//  SJPageIndicator.h
//  SJCycleScrollView
//
//  Created by BlueDancer on 2017/11/27.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SJPageIndicatorSetting;

@interface SJPageIndicator : UIControl

@property (nonatomic, strong, readwrite) SJPageIndicatorSetting *setting;

@property (nonatomic, getter=isCurrentPage) BOOL currentPage;

@end

NS_ASSUME_NONNULL_END
