//
//  RIOCharacterCell.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterPreviewCell.h"

#import "RIOCharacterPreviewViewModel+Layout.h"

@implementation RIOCharacterPreviewCell {
    UILabel *_nameLabel;
    RIOCharacterPreviewViewModel *_viewModel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _nameLabel = [UILabel new];
        self.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_nameLabel];
    }
    return self;
}

- (void)configureWithViewModel:(RIOCharacterPreviewViewModel *)viewModel {
    _nameLabel.text = [NSString stringWithFormat:@"%@-%@", viewModel.name, viewModel.realm];
    _viewModel = viewModel;
}

- (void)layoutSubviews {
    _nameLabel.frame = [_viewModel nameFrameForConstrainingSize:self.bounds.size];
}

@end
