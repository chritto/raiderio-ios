//
//  RIOCharacterHeaderCell.m
//  RaiderIO
//
//  Created by Chris McGrath on 5/12/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import "RIOCharacterHeaderCell.h"

#import "RIOCharacterHeaderViewModel.h"
#import "RIOCharacterService.h"
#import "RIOGeometry.h"
#import "UIView+Framing.h"

@implementation RIOCharacterHeaderCell {
    RIOCharacterService *_service;
    
    UIImageView *_bannerView;
    UIImageView *_thumbnailView;
    UILabel *_nameLabel;
    UILabel *_scoreLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _service = [RIOCharacterService new];
        
        _bannerView = [UIImageView new];
        _bannerView.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundView = _bannerView;
        
        _thumbnailView = [UIImageView new];
        _thumbnailView.layer.masksToBounds = YES;
        [self.contentView addSubview:_thumbnailView];

        _nameLabel = [UILabel new];
        _nameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_nameLabel];
        
        _scoreLabel = [UILabel new];
        _scoreLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_scoreLabel];
    }
    return self;
}

- (void)layoutSubviews {
    const CGFloat padding = 12;
    const CGPoint paddingTranslation = CGPointMake(padding, 0);
    const CGFloat thumbnailSideLen = CGRectGetHeight(self.bounds)/2;
    
    [_thumbnailView setPosition:CGPointTranslate(CGRectGetCLPoint(self.bounds),
                                                 paddingTranslation)
                           size:CGSizeMake(thumbnailSideLen, thumbnailSideLen)
                    anchorPoint:RIOAnchorPointCenterLeft];
    _thumbnailView.layer.cornerRadius = thumbnailSideLen/2;
    
    const CGSize labelSize =
    CGSizeMake(self.bounds.size.width - CGRectGetMaxX(_thumbnailView.frame) - 3*paddingTranslation.x,
               [_nameLabel sizeThatFits:self.bounds.size].height);
    [_nameLabel setPosition:CGPointTranslate(CGRectGetCRPoint(_thumbnailView.frame),
                                             paddingTranslation)
                       size:labelSize
                anchorPoint:RIOAnchorPointCenterLeft];
    
    [_scoreLabel setPosition:CGPointTranslate(CGRectGetCRPoint(self.bounds),
                                              CGPointMake(-padding, 0))
                        size:[_scoreLabel sizeThatFits:self.bounds.size]
                 anchorPoint:RIOAnchorPointCenterRight];
}

- (void)configureWithViewModel:(RIOCharacterHeaderViewModel *)viewModel {
    _nameLabel.text = viewModel.name;
    _scoreLabel.text = [NSString stringWithFormat:@"%@", @(viewModel.score)];
    [_service fetchThumbnailWithURL:viewModel.thumbnailURL completion:^(UIImage * _Nullable image) {
        self->_thumbnailView.image = image;
    }];
    [_service fetchThumbnailWithURL:viewModel.bannerURL completion:^(UIImage * _Nullable image) {
        self->_bannerView.image = image;
    }];
}

@end
