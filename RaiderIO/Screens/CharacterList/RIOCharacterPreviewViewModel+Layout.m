//
//  RIOCharacterViewModel+Layout.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterPreviewViewModel+Layout.h"

#import "RIOTextStackViewModel.h"
#import "RIOTextStackViewModel+Layout.h"

@implementation RIOCharacterPreviewViewModel (Layout)

- (CGSize)sizeForConstrainingSize:(CGSize)constrainingSize {
    const CGSize textStackSize = [self.textStackViewModel sizeWithConstrainingSize:constrainingSize];
    return CGSizeMake(constrainingSize.width,
                      (textStackSize.height
                       + self.insets.top
                       + self.insets.bottom));
}

- (RIOTextStackViewModel *)textStackViewModel {
    NSDictionary<NSAttributedStringKey, id> *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:17]};

    NSArray<NSAttributedString *> * const texts =
    @[ [[NSAttributedString alloc] initWithString:self.characterID.name attributes:attributes],
       [[NSAttributedString alloc] initWithString:(self.guild ?: @"No guild") attributes:attributes],
       [[NSAttributedString alloc] initWithString:self.characterID.realm attributes:attributes]
       ];

    return [[RIOTextStackViewModel alloc] initWithTexts:texts direction:RIOTextStackDirectionVertical];
}

- (CGSize)scoreSize {
    return sizeForText(self.score, self.font);
}

- (UIEdgeInsets)insets {
    return UIEdgeInsetsMake(6, 12, 6, 12);
}

- (CGFloat)horizontalPadding {
    return 12;
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
