//
//  RIOCharacterHeaderViewModel+IGListDiffable.m
//  RaiderIO
//
//  Created by Chris McGrath on 5/12/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import "RIOCharacterHeaderViewModel+IGListDiffable.h"

@implementation RIOCharacterHeaderViewModel (IGListDiffable)

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
