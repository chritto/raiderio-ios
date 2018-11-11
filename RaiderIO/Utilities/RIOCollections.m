//
//  RIOCollections.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/10/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCollections.h"

@implementation NSArray (RIOCollections)

- (NSArray *)rio_map:(id (^)(id object))block {
    NSMutableArray *output = [NSMutableArray new];
    for (id object in self) {
        [output addObject:block(object)];
    }
    return output;
}

@end
