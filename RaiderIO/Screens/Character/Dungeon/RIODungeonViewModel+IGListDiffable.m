//
//  RIODungeonViewModel+IGListDiffable.m
//  RaiderIO
//
//  Created by Chris McGrath on 5/26/19.
//  Copyright © 2019 Chris McGrath. All rights reserved.
//

#import "RIODungeonViewModel+IGListDiffable.h"


@implementation RIODungeonViewModel (IGListDiffable)

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
