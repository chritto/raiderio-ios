//
//  RIOCharacterViewModel+Layout.h
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RIOCharacterPreviewViewModel.h"

@class RIOTextStackViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface RIOCharacterPreviewViewModel (Layout)

- (CGSize)sizeForConstrainingSize:(CGSize)constrainingSize;

- (RIOTextStackViewModel *)textStackViewModel;

- (CGSize)scoreSize;

- (UIEdgeInsets)insets;

- (CGFloat)horizontalPadding;

- (UIFont *)font;

@end

NS_ASSUME_NONNULL_END
