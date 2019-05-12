//
//  UIView+Framing.m
//  RaiderIO
//
//  Created by Chris McGrath on 5/12/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import "UIView+Framing.h"

@implementation UIView (Framing)

- (void)setPosition:(CGPoint)position
               size:(CGSize)size
        anchorPoint:(RIOAnchorPoint)anchorPoint {
    const CGPoint finalPosition = positionForAnchorPoint(anchorPoint, size, position);
    self.frame = CGRectMake(finalPosition.x, finalPosition.y,
                            size.width, size.height);
}

#pragma mark - Helpers

static CGPoint positionForAnchorPoint(RIOAnchorPoint anchorPoint,
                                      CGSize size,
                                      CGPoint position) {
    const CGPoint relativePosition = multiplierForAnchorPoint(anchorPoint, size);
    return CGPointMake(position.x - relativePosition.x*size.width,
                       position.y - relativePosition.y*size.height);
}

static CGPoint multiplierForAnchorPoint(RIOAnchorPoint anchorPoint,
                                        CGSize size) {
    switch (anchorPoint) {
        case RIOAnchorPointCenter:
            return CGPointMake(0.5, 0.5);
        case RIOAnchorPointCenterLeft:
            return CGPointMake(0, 0.5);
        case RIOAnchorPointCenterRight:
            return CGPointMake(1, 0.5);
        case RIOAnchorPointTopLeft:
            return CGPointMake(0, 0);
        case RIOAnchorPointTopRight:
            return CGPointMake(1, 0);
        case RIOAnchorPointTopCenter:
            return CGPointMake(0.5, 0);
        case RIOAnchorPointBottomLeft:
            return CGPointMake(0, 1);
        case RIOAnchorPointBottomRight:
            return CGPointMake(1, 1);
        case RIOAnchorPointBottomCenter:
            return CGPointMake(0.5, 1);
    }
}

@end
