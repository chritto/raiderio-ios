//
//  RIOCharacterCache.m
//  RaiderIO
//
//  Created by Chris McGrath on 11/10/18.
//  Copyright © 2018 Chris McGrath. All rights reserved.
//

#import "RIOCharacterCache.h"

#import "RIOCharacterID.h"
#import "RIOCharacterService.h"

@implementation RIOCharacterCache {
    RIOCharacterService *_service;

    NSMutableDictionary<RIOCharacterID *, RIOCharacter *> *_cache;
    NSMutableSet<RIOCharacterID *> *_fetching;
    NSPointerArray *_listeners;
}

- (instancetype)init {
    if (self = [super init]) {
        _service = [RIOCharacterService new];

        _cache = [NSMutableDictionary new];
        _fetching = [NSMutableSet new];
        _listeners = [NSPointerArray weakObjectsPointerArray];
    }
    return self;
}

- (NSArray<RIOCharacterID *> *)favoriteCharacterIdentifiers {
    return @[ [[RIOCharacterID alloc] initWithName:@"Sevv" realm:@"Ner'zhul" region:@"us"],
              [[RIOCharacterID alloc] initWithName:@"Joyzaiga" realm:@"Ner'zhul" region:@"us"],
              [[RIOCharacterID alloc] initWithName:@"Antizero" realm:@"Ner'zhul" region:@"us"],
              [[RIOCharacterID alloc] initWithName:@"Oenanthe" realm:@"Ner'zhul" region:@"us"],
              [[RIOCharacterID alloc] initWithName:@"Havocguy" realm:@"Ner'zhul" region:@"us"]];
}

- (RIOCharacter *)characterWithID:(RIOCharacterID *)characterID {
    RIOCharacter * const character = _cache[characterID];
    if (character == nil) {
        [self _beginFetchingCharacterIfNeeded:characterID];
    }
    return character;
}

- (void)addListener:(id<RIOCharacterCacheListener>)listener {
    [_listeners addPointer:(__bridge void *)listener];
}

- (void)removeListener:(id<RIOCharacterCacheListener>)listener {
    const NSUInteger listenerIndex = [[_listeners allObjects] indexOfObject:listener];
    if (listenerIndex != NSNotFound) {
        [_listeners removePointerAtIndex:listenerIndex];
    }
}

#pragma mark - Private

- (void)_beginFetchingCharacterIfNeeded:(RIOCharacterID *)characterID {
    if ([_fetching containsObject:characterID]) {
        return;
    }

    [_fetching addObject:characterID];
    [_service fetchCharacterWithID:characterID completion:^(RIOCharacter * _Nullable character) {
        self->_cache[characterID] = character;
        [self->_fetching removeObject:characterID];
        [self _notifyListenersOfCacheUpdate];
    }];
}

- (void)_notifyListenersOfCacheUpdate {
    NSArray<id<RIOCharacterCacheListener>> * const listeners = [_listeners allObjects];
    for (id<RIOCharacterCacheListener> listener in listeners) {
        [listener characterCacheDidUpdate];
    }
}

@end
