//
//  RIOCharacterCell.m
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterCell.h"

#import "RIOCharacterViewModel+Layout.h"

@implementation RIOCharacterCell {
    UILabel *_nameLabel;
    RIOCharacterViewModel *_viewModel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _nameLabel = [UILabel new];
        self.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_nameLabel];
    }
    return self;
}

- (void)configureWithViewModel:(RIOCharacterViewModel *)viewModel {
    _nameLabel.text = [NSString stringWithFormat:@"%@-%@", viewModel.name, viewModel.realm];
    _viewModel = viewModel;
}

- (void)layoutSubviews {
    _nameLabel.frame = [_viewModel nameFrameForConstrainingSize:self.bounds.size];
}

@end
