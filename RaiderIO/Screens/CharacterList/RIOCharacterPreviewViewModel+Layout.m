//
//  RIOCharacterViewModel+Layout.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterPreviewViewModel+Layout.h"

@implementation RIOCharacterPreviewViewModel (Layout)

- (CGSize)sizeForConstrainingSize:(CGSize)constrainingSize {
    const CGRect nameFrame = [self nameFrameForConstrainingSize:constrainingSize];
    const CGRect guildFrame = [self guildFrameForConstrainingSize:constrainingSize];
    const CGRect realmFrame = [self realmFrameForConstrainingSize:constrainingSize];
    return CGSizeMake(constrainingSize.width,
                      (nameFrame.size.height
                       + guildFrame.size.height
                       + realmFrame.size.height
                       + nameInsets().top
                       + nameInsets().bottom));
}

- (CGRect)nameFrameForConstrainingSize:(CGSize)constrainingSize {
    const CGFloat textHeight = heightForText(self.name, constrainingSize);
    return CGRectMake(nameInsets().left,
                      nameInsets().top,
                      constrainingSize.width - nameInsets().left - nameInsets().right,
                      textHeight);
}

- (CGRect)guildFrameForConstrainingSize:(CGSize)constrainingSize {
    const CGFloat textHeight = heightForText(self.guild, constrainingSize);
    return CGRectMake(0, 0, constrainingSize.width, textHeight);
}

- (CGRect)realmFrameForConstrainingSize:(CGSize)constrainingSize {
    const CGFloat textHeight = heightForText(self.realm, constrainingSize);
    return CGRectMake(0, 0, constrainingSize.width, textHeight);
}

#pragma mark - private

static UIEdgeInsets nameInsets() {
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

static CGFloat heightForText(NSString *text, CGSize constrainingSize) {
    return [text boundingRectWithSize:constrainingSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:[UIFont systemFontSize]]}
                              context:nil].size.height;
}

@end
