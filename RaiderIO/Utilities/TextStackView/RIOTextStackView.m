//
//  RIOTextStackView.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/14/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOTextStackView.h"

#import "RIOTextStackViewModel+Layout.h"
#import "RIOCollections.h"

@implementation RIOTextStackView {
    RIOTextStackViewModel *_viewModel;

    NSArray<UILabel *> *_labels;
}

- (void)layoutSubviews {
    NSArray<NSValue *> * const frames = [_viewModel textFramesWithConstrainingSize:self.bounds.size];
    for (NSUInteger i = 0; i < _labels.count; i++) {
        _labels[i].frame = [frames[i] CGRectValue];
    }
}

- (void)configureWithViewModel:(RIOTextStackViewModel *)viewModel {
    _viewModel = viewModel;
    for (UILabel *label in _labels) {
        [label removeFromSuperview];
    }
    _labels = [viewModel.texts rio_map:^UILabel *(NSAttributedString *text) {
        UILabel * const label = [UILabel new];
        label.attributedText = text;
        return label;
    }];
    [self setNeedsLayout];
}

@end
