//
//  RIOCharacterCell.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterPreviewCell.h"

#import "RIOCharacter.h"
#import "RIOCharacterService.h"
#import "RIOCharacterPreviewViewModel+Layout.h"

@implementation RIOCharacterPreviewCell {
    RIOCharacterPreviewViewModel *_viewModel;
    RIOCharacterService *_characterService;

    UILabel *_nameLabel;
    UILabel *_guildLabel;
    UILabel *_realmLabel;
    UIImageView *_thumbnailView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];

        _characterService = [RIOCharacterService new];

        _nameLabel = [UILabel new];
        [self.contentView addSubview:_nameLabel];

        _guildLabel = [UILabel new];
        [self.contentView addSubview:_guildLabel];

        _realmLabel = [UILabel new];
        [self.contentView addSubview:_realmLabel];

        _thumbnailView = [UIImageView new];
        [self.contentView addSubview:_thumbnailView];
    }
    return self;
}

- (void)configureWithViewModel:(RIOCharacterPreviewViewModel *)viewModel {
    _nameLabel.text = viewModel.name;
    _guildLabel.text = viewModel.guild;
    _realmLabel.text = [NSString stringWithFormat:@"%@ (%@)", viewModel.realm, viewModel.region];
    [_characterService fetchThumbnailWithURL:viewModel.thumbnailURL completion:^(UIImage * _Nullable image) {
        self->_thumbnailView.image = image;
    }];

    _viewModel = viewModel;
}

- (void)layoutSubviews {
    CGFloat const contentWidth = CGRectGetWidth(self.contentView.frame);

    [_nameLabel sizeToFit];
    [_guildLabel sizeToFit];
    [_realmLabel sizeToFit];

    CGFloat const thumbnailHeight = (CGRectGetHeight(_nameLabel.frame)
                                     + CGRectGetHeight(_nameLabel.frame)
                                     + CGRectGetHeight(_nameLabel.frame));
    CGFloat yPos = 0;
    CGRect const thumbnailFrame = CGRectIntegral(CGRectMake(0,
                                                            yPos,
                                                            thumbnailHeight,
                                                            thumbnailHeight));
    CGFloat const xPos = CGRectGetMaxX(thumbnailFrame);
    _nameLabel.frame = CGRectMake(xPos,
                                 yPos,
                                 contentWidth - xPos,
                                 CGRectGetHeight(_nameLabel.frame));
    yPos += CGRectGetHeight(_nameLabel.frame);
    _guildLabel.frame = CGRectMake(xPos,
                                  yPos,
                                  contentWidth - xPos,
                                  CGRectGetHeight(_guildLabel.frame));
    yPos += CGRectGetHeight(_guildLabel.frame);
    _realmLabel.frame = CGRectMake(xPos,
                                  yPos,
                                  contentWidth - xPos,
                                  CGRectGetHeight(_realmLabel.frame));
    _thumbnailView.frame = thumbnailFrame;
}

@end
