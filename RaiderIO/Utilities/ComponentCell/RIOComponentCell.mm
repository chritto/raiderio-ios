//
//  RIOComponentCell.mm
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOComponentCell.h"

#import <ComponentKit/ComponentKit.h>

#import "RIOMacros.h"

@interface RIOComponentCell () <CKComponentProvider>

@end

@implementation RIOComponentCell {
    CKComponentHostingView *_componentView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _componentView = [[CKComponentHostingView alloc] initWithComponentProvider:self.class
                                                                 sizeRangeProvider:nil];
        [self.contentView addSubview:_componentView];
    }
    return self;
}

- (void)configureWithComponent:(CKComponent *)component {
    [_componentView updateModel:component
                           mode:CKUpdateModeSynchronous];
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    _componentView.frame = self.contentView.bounds;
}

#pragma mark - CKComponentProvider

+ (CKComponent *)componentForModel:(id<NSObject>)model
                           context:(id<NSObject>)context {
    CKComponent * const component = RIO_SAFE_CAST(model, CKComponent);
    NSAssert(component != nil, @"Unexpected model class");
    return component;
}

@end
