//
//  RIODungeonCell.m
//  RaiderIO
//
//  Created by Chris McGrath on 5/26/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import "RIODungeonCell.h"

#import "RIODungeonViewModel.h"
#import "RIOGeometry.h"
#import "UIView+Framing.h"

@implementation RIODungeonCell {
    UILabel *_name;
    UILabel *_level;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _name = [UILabel new];
        _name.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_name];
        
        _level = [UILabel new];
        _level.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_level];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    const CGRect insetBounds = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(12, 12, 12, 12));
    
    _name.frame = insetBounds;
    _level.frame = insetBounds;
    
//    [_name setPosition:CGRectGetCLPoint(insetBounds)
//                  size:[_name sizeThatFits:insetBounds.size]
//           anchorPoint:RIOAnchorPointCenterLeft];
//
//    [_level setPosition:CGRectGetCRPoint(insetBounds)
//                   size:[_level sizeThatFits:insetBounds.size]
//            anchorPoint:RIOAnchorPointCenterRight];
}

- (void)configureWithViewModel:(RIODungeonViewModel *)viewModel {
    _name.text = viewModel.bestRun.dungeon;
    _level.text = levelWithUpgrades(viewModel.bestRun.level, viewModel.bestRun.upgrades);
}

static NSString *levelWithUpgrades(NSInteger dungeonLevel, NSInteger upgrades) {
    NSString * const level = @(dungeonLevel).stringValue;
    if (upgrades == 1) {
        return [level stringByAppendingString:@"⭐"];
    } else if (upgrades == 2) {
        return [level stringByAppendingString:@"⭐⭐"];
    } else if (upgrades == 3) {
        return [level stringByAppendingString:@"⭐⭐⭐"];
    }
    return level;
}

@end
