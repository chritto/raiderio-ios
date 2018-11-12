//
//  RIOCharacterViewModel+Layout.h
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RIOCharacterPreviewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RIOCharacterPreviewViewModel (Layout)

- (CGSize)sizeForConstrainingSize:(CGSize)constrainingSize;

- (CGSize)nameSize;

- (CGSize)guildSize;

- (CGSize)realmSize;

- (CGSize)scoreSize;

- (UIEdgeInsets)insets;

- (CGFloat)horizontalPadding;

- (UIFont *)font;

@end

NS_ASSUME_NONNULL_END
