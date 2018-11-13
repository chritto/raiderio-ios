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
    const CGSize nameSize = [self nameSize];
    const CGSize guildSize = [self guildSize];
    const CGSize realmSize = [self realmSize];
    return CGSizeMake(constrainingSize.width,
                      (nameSize.height
                       + guildSize.height
                       + realmSize.height
                       + self.insets.top
                       + self.insets.bottom));
}

- (CGSize)nameSize {
    return sizeForText(self.characterID.name, self.font);
}

- (CGSize)guildSize {
    return sizeForText(self.guild, self.font);
}

- (CGSize)realmSize {
    return sizeForText(self.characterID.realm, self.font);
}

- (CGSize)scoreSize {
    return sizeForText(self.score, self.font);
}

- (UIEdgeInsets)insets {
    return UIEdgeInsetsMake(8, 8, 0, 8);
}

- (CGFloat)horizontalPadding {
    return 8;
}

- (UIFont *)font {
    return [UIFont systemFontOfSize:17];
}

#pragma mark - private

static CGSize sizeForText(NSString *text, UIFont *font) {
    return [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName: font}
                              context:nil].size;
}

@end
