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
    UILabel *_scoreLabel;
    UIImageView *_thumbnailView;
    UIActivityIndicatorView *_activityIndicatorView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _characterService = [RIOCharacterService new];

        _nameLabel = [UILabel new];
        _nameLabel.font = _viewModel.font;
        [self.contentView addSubview:_nameLabel];

        _guildLabel = [UILabel new];
        _guildLabel.font = _viewModel.font;
        [self.contentView addSubview:_guildLabel];

        _realmLabel = [UILabel new];
        _realmLabel.font = _viewModel.font;
        [self.contentView addSubview:_realmLabel];

        _scoreLabel = [UILabel new];
        _scoreLabel.font = _viewModel.font;
        [self.contentView addSubview:_scoreLabel];

        _thumbnailView = [UIImageView new];
        [self.contentView addSubview:_thumbnailView];

        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self.contentView addSubview:_activityIndicatorView];
    }
    return self;
}

- (void)configureWithViewModel:(RIOCharacterPreviewViewModel *)viewModel {
    _nameLabel.text = viewModel.characterID.name;
    _guildLabel.text = viewModel.guild;
    _realmLabel.text = viewModel.realmDescription;
    _scoreLabel.text = viewModel.score;
    [_characterService fetchThumbnailWithURL:viewModel.thumbnailURL completion:^(UIImage * _Nullable image) {
        self->_thumbnailView.image = image;
    }];
    _activityIndicatorView.hidden = !viewModel.loading;

    _viewModel = viewModel;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    const CGSize nameSize = _viewModel.nameSize;
    const CGSize guildSize = _viewModel.guildSize;
    const CGSize realmSize = _viewModel.realmSize;
    const CGSize scoreSize = _viewModel.scoreSize;
    const CGFloat thumbnailHeight = nameSize.height + guildSize.height + realmSize.height;
    const CGFloat horizontalPadding = _viewModel.horizontalPadding;
    const UIEdgeInsets insets = _viewModel.insets;
    const CGFloat maxX = CGRectGetWidth(self.contentView.frame) - insets.right - scoreSize.width - horizontalPadding;

    CGFloat yPos = _viewModel.insets.top;
    CGRect const thumbnailFrame = CGRectIntegral(CGRectMake(insets.left,
                                                            yPos,
                                                            thumbnailHeight,
                                                            thumbnailHeight));
    CGFloat const xPos = CGRectGetMaxX(thumbnailFrame) + horizontalPadding;
    _nameLabel.frame = CGRectMake(xPos,
                                 yPos,
                                 nameSize.width,
                                 nameSize.height);
    yPos += nameSize.height;
    _guildLabel.frame = CGRectMake(xPos,
                                  yPos,
                                  guildSize.width,
                                  guildSize.height);
    yPos += guildSize.height;
    _realmLabel.frame = CGRectMake(xPos,
                                  yPos,
                                  realmSize.width,
                                  realmSize.height);
    _thumbnailView.frame = thumbnailFrame;
    _scoreLabel.frame = CGRectMake(maxX + horizontalPadding,
                                   CGRectGetHeight(self.contentView.frame)/2.0 - scoreSize.height/2,
                                   scoreSize.width,
                                   scoreSize.height);

    _activityIndicatorView.center = CGPointMake(CGRectGetWidth(self.contentView.frame) - insets.right - CGRectGetWidth(_activityIndicatorView.frame)/2.0, CGRectGetHeight(self.contentView.frame)/2.0);
}

@end
