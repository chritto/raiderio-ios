//
//  RIOCharacterPreviewViewModel+IGListDiffable.m
//  RaiderIO
//
//  Created by Chris McGrath on 5/11/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import "RIOCharacterPreviewViewModel+IGListDiffable.h"

#import <IGListKit/IGListKit.h>

@implementation RIOCharacterPreviewViewModel (IGListDiffable)

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
