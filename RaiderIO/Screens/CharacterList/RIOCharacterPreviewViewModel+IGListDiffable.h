//
//  RIOCharacterPreviewViewModel+IGListDiffable.h
//  RaiderIO
//
//  Created by Chris McGrath on 5/11/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RIOCharacterPreviewViewModel.h"

@protocol IGListDiffable;

NS_ASSUME_NONNULL_BEGIN

@interface RIOCharacterPreviewViewModel (IGListDiffable)

- (id<NSObject>)diffIdentifier;

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object;

@end

NS_ASSUME_NONNULL_END
