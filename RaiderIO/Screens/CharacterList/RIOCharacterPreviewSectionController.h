//
//  RIOCharacterSectionController.h
//  RaiderIO
//
//  Created by Chris McGrath on 10/31/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <IGListKit/IGListKit.h>

#import "RIOCharacterPreviewViewModel.h"
#import "RIOMacros.h"

@class RIOCharacterCache;

NS_ASSUME_NONNULL_BEGIN

@interface RIOCharacterPreviewSectionController : IGListGenericSectionController<RIOCharacterPreviewViewModel *>

- (instancetype)initWithCharacterCache:(RIOCharacterCache *)characterCache;

RIO_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
