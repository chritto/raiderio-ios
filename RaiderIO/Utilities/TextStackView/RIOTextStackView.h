//
//  RIOTextStackView.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/14/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RIOMacros.h"

@class RIOTextStackViewModel;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, RIOTextStackViewDirection) {
    RIOTextStackDirectionVertical,
    RIOTextStackDirectionHorizontal
};

@interface RIOTextStackView : UIView

- (void)configureWithViewModel:(RIOTextStackViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
