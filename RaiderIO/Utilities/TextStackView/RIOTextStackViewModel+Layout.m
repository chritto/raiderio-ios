//
//  RIOTextStackViewModel+Layout.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/14/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOTextStackViewModel+Layout.h"

#import "RIOGeometry.h"
#import "RIOCollections.h"

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

- (CGSize)sizeWithConstrainingSize:(CGSize)constrainingSize {
    NSArray<NSValue *> *frames = [self textFramesWithConstrainingSize:constrainingSize];
    switch (self.direction) {
        case RIOTextStackDirectionVertical: {
            CGFloat totalHeight = 0;
            CGFloat maxWidth = 0;
            for (NSValue * const frameValue in frames) {
                const CGRect frame = [frameValue CGRectValue];
                totalHeight += frame.size.height;
                maxWidth = MAX(maxWidth, frame.size.width);
            }
            return CGSizeMake(maxWidth, totalHeight);
        }
        case RIOTextStackDirectionHorizontal: {
            CGFloat totalWidth = 0;
            CGFloat maxHeight = 0;
            for (NSValue * const frameValue in frames) {
                const CGRect frame = [frameValue CGRectValue];
                totalWidth += frame.size.width;
                maxHeight = MAX(maxHeight, frame.size.height);
            }
            return CGSizeMake(totalWidth, maxHeight);
        }
    }
}

#pragma mark - Private

static CGPoint nextFrameOrigin(RIOTextStackViewDirection direction, CGRect prevFrame) {
    switch (direction) {
        case RIOTextStackDirectionVertical:
            return CGPointMake(CGRectGetMinX(prevFrame), CGRectGetMaxY(prevFrame));
        case RIOTextStackDirectionHorizontal:
            return CGPointMake(CGRectGetMaxX(prevFrame), CGRectGetMinY(prevFrame));
    }
}

@end
