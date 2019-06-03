//
//  RIOCharacterCache.h
//  RaiderIO
//
//  Created by Chris McGrath on 11/10/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RIOCharacterID;
@class RIOCharacter;

NS_ASSUME_NONNULL_BEGIN

@protocol RIOCharacterCacheListener <NSObject>

- (void)characterCacheDidUpdate;

@end

@interface RIOCharacterCache : NSObject

- (NSArray<RIOCharacterID *> *)favoriteCharacterIdentifiers;

- (nullable RIOCharacter *)characterWithID:(RIOCharacterID *)characterID;

- (void)clearCache;

/**
 * Generic listeners for any cache update
 */
- (void)addListener:(id<RIOCharacterCacheListener>)listener;
- (void)removeListener:(id<RIOCharacterCacheListener>)listener;

/**
 * Listeners for updates to a particular character
 */
- (void)addCharacterListener:(RIOCharacterID *)characterID
                    listener:(id<RIOCharacterCacheListener>)listener;
- (void)removeCharacterListener:(RIOCharacterID *)characterID
                       listener:(id<RIOCharacterCacheListener>)listener;

@end

NS_ASSUME_NONNULL_END
