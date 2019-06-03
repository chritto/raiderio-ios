//
//  UIView+Framing.h
//  RaiderIO
//
//  Created by Chris McGrath on 5/12/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RIOAnchorPoint) {
    RIOAnchorPointCenter,
    RIOAnchorPointCenterLeft,
    RIOAnchorPointCenterRight,
    RIOAnchorPointTopLeft,
    RIOAnchorPointTopRight,
    RIOAnchorPointTopCenter,
    RIOAnchorPointBottomLeft,
    RIOAnchorPointBottomRight,
    RIOAnchorPointBottomCenter
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Framing)

- (void)setPosition:(CGPoint)position
               size:(CGSize)size
        anchorPoint:(RIOAnchorPoint)anchorPoint;

@end

NS_ASSUME_NONNULL_END
