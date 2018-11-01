//
//  RIOCharacterViewModel+Layout.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterViewModel+Layout.h"

@implementation RIOCharacterViewModel (Layout)

- (CGSize)sizeForConstrainingSize:(CGSize)constrainingSize {
    const CGRect nameFrame = [self nameFrameForConstrainingSize:constrainingSize];
    return CGSizeMake(constrainingSize.width,
                      nameFrame.size.height + nameInsets().top + nameInsets().bottom);
}

- (CGRect)nameFrameForConstrainingSize:(CGSize)constrainingSize {
    const CGFloat textHeight = [self.name sizeWithAttributes:nil].height;
    return CGRectMake(nameInsets().left,
                      nameInsets().top,
                      constrainingSize.width - nameInsets().left - nameInsets().right,
                      textHeight);
}

UIEdgeInsets nameInsets() {
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

@end
