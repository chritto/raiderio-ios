//
//  RIOCollections.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/10/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (RIOCollections)

- (NSArray *)rio_map:(id (^)(ObjectType object))block;

@end

NS_ASSUME_NONNULL_END
