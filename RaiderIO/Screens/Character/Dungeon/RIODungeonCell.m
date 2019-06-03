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
    UILabel *_stars;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _name = [UILabel new];
        [self.contentView addSubview:_name];
        
        _level = [UILabel new];
        [self.contentView addSubview:_level];

        _stars = [UILabel new];
        [self.contentView addSubview:_stars];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    const CGRect insetBounds = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(12, 12, 12, 12));
    
    [_name setPosition:CGRectGetCLPoint(insetBounds)
                  size:[_name sizeThatFits:insetBounds.size]
           anchorPoint:RIOAnchorPointCenterLeft];

    [_level setPosition:CGRectGetCRPoint(insetBounds)
                   size:[_level sizeThatFits:insetBounds.size]
            anchorPoint:RIOAnchorPointCenterRight];

    [_stars setPosition:CGPointTranslate(CGRectGetCLPoint(_level.frame),
                                         CGPointMake(-8, 0))
                   size:[_stars sizeThatFits:insetBounds.size]
            anchorPoint:RIOAnchorPointCenterRight];
}

- (void)configureWithViewModel:(RIODungeonViewModel *)viewModel {
    _name.text = viewModel.bestRun.dungeon;
    _level.text = [NSString stringWithFormat:@"%2ld", viewModel.bestRun.level];
    _stars.text = starsWithUpgrades(viewModel.bestRun.upgrades);
}

static NSString *starsWithUpgrades(NSInteger upgrades) {
    if (upgrades == 0) {
        return [NSString stringWithFormat:@"⨂"];
    } else if (upgrades == 1) {
        return [NSString stringWithFormat:@"⭐"];
    } else if (upgrades == 2) {
        return [NSString stringWithFormat:@"⭐⭐"];
    } else if (upgrades == 3) {
        return [NSString stringWithFormat:@"⭐⭐⭐"];
    }
    return @"";
}

@end
