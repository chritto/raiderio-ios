//
//  RIOTextStackViewModel+Layout.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/14/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOTextStackViewModel+Layout.h"

#import "RIOGeometry.h"

@implementation RIOTextStackViewModel (Layout)

- (NSArray<NSValue *> *)textFramesWithConstrainingSize:(CGSize)constrainingSize {
    NSMutableArray<NSValue *> *frames = [NSMutableArray new];
    CGRect prevFrame = CGRectZero;
    for (NSAttributedString *text in self.texts) {
        const CGSize size = [text boundingRectWithSize:constrainingSize
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil].size;
        const CGRect frame = CGRectMakeWithOrigin(nextFrameOrigin(self.direction, prevFrame),
                                                  size);
        [frames addObject:[NSValue valueWithCGRect:frame]];
        prevFrame = frame;
    }
    return frames;
}

static CGPoint nextFrameOrigin(RIOTextStackViewDirection direction, CGRect prevFrame) {
    switch (direction) {
        case RIOTextStackDirectionVertical:
            return CGPointMake(CGRectGetMinX(prevFrame), CGRectGetMaxY(prevFrame));
        case RIOTextStackDirectionHorizontal:
            return CGPointMake(CGRectGetMaxX(prevFrame), CGRectGetMinY(prevFrame));
    }
}

@end
