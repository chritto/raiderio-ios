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
#import "RIOTextStackView.h"
#import "RIOTextStackViewModel.h"
#import "RIOTextStackViewModel+Layout.h"

@implementation RIOCharacterPreviewCell {
    RIOCharacterPreviewViewModel *_viewModel;
    RIOCharacterService *_characterService;

    RIOTextStackView *_textStackView;
    UILabel *_scoreLabel;
    UIImageView *_thumbnailView;
    UIActivityIndicatorView *_activityIndicatorView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _characterService = [RIOCharacterService new];

        _textStackView = [RIOTextStackView new];
        [self.contentView addSubview:_textStackView];

        _scoreLabel = [UILabel new];
        _scoreLabel.font = _viewModel.font;
        [self.contentView addSubview:_scoreLabel];

        _thumbnailView = [UIImageView new];
        [self.contentView addSubview:_thumbnailView];

        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicatorView.hidesWhenStopped = YES;
        [self.contentView addSubview:_activityIndicatorView];
    }
    return self;
}

- (void)configureWithViewModel:(RIOCharacterPreviewViewModel *)viewModel {
    [_textStackView configureWithViewModel:viewModel.textStackViewModel];
    _scoreLabel.text = viewModel.score;
    [_characterService fetchThumbnailWithURL:viewModel.thumbnailURL completion:^(UIImage * _Nullable image) {
        self->_thumbnailView.image = image;
    }];

    if (viewModel.loading) {
        [_activityIndicatorView startAnimating];
    } else {
        [_activityIndicatorView stopAnimating];
    }

    _viewModel = viewModel;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    const CGSize scoreSize = _viewModel.scoreSize;
    const CGSize textStackSize = [_viewModel.textStackViewModel sizeWithConstrainingSize:self.contentView.frame.size];
    const CGFloat thumbnailHeight = textStackSize.height;
    const CGFloat horizontalPadding = _viewModel.horizontalPadding;
    const UIEdgeInsets insets = _viewModel.insets;
    const CGFloat maxX = CGRectGetWidth(self.contentView.frame) - insets.right - scoreSize.width - horizontalPadding;

    CGFloat yPos = _viewModel.insets.top;
    CGRect const thumbnailFrame = CGRectIntegral(CGRectMake(insets.left,
                                                            yPos,
                                                            thumbnailHeight,
                                                            thumbnailHeight));
    CGFloat const xPos = CGRectGetMaxX(thumbnailFrame) + horizontalPadding;
    _textStackView.frame = CGRectMake(xPos, yPos, textStackSize.width, textStackSize.height);
    _thumbnailView.frame = thumbnailFrame;
    _scoreLabel.frame = CGRectMake(maxX + horizontalPadding,
                                   CGRectGetHeight(self.contentView.frame)/2.0 - scoreSize.height/2,
                                   scoreSize.width,
                                   scoreSize.height);

    _activityIndicatorView.center = CGPointMake(CGRectGetWidth(self.contentView.frame) - insets.right - CGRectGetWidth(_activityIndicatorView.frame)/2.0, CGRectGetHeight(self.contentView.frame)/2.0);
}

@end
