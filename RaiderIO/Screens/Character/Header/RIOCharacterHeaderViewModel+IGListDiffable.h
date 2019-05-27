//
//  RIOCharacterHeaderViewModel+IGListDiffable.h
//  RaiderIO
//
//  Created by Chris McGrath on 5/12/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <IGListKit/IGListKit.h>

#import "RIOCharacterHeaderViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RIOCharacterHeaderViewModel (IGListDiffable) <IGListDiffable>

- (id<NSObject>)diffIdentifier;

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object;

@end

NS_ASSUME_NONNULL_END
