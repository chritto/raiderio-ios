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
    NSPointerArray *_genericListeners;
    NSMutableDictionary<RIOCharacterID *, NSPointerArray *> *_characterListeners;
}

- (instancetype)init {
    if (self = [super init]) {
        _service = [RIOCharacterService new];
        _genericListeners = [NSPointerArray weakObjectsPointerArray];
        _characterListeners = [NSMutableDictionary new];

        [self _setupEmptyCache];
    }
    return self;
}

- (NSArray<RIOCharacterID *> *)favoriteCharacterIdentifiers {
    return @[ [[RIOCharacterID alloc] initWithName:@"Arastalon" realm:@"Ner'zhul" region:@"us"],
              [[RIOCharacterID alloc] initWithName:@"Cadehunter" realm:@"Ner'zhul" region:@"us"],
              [[RIOCharacterID alloc] initWithName:@"Oenanthe" realm:@"Ner'zhul" region:@"us"],
              [[RIOCharacterID alloc] initWithName:@"Havocguy" realm:@"Ner'zhul" region:@"us"],
              [[RIOCharacterID alloc] initWithName:@"Joyzaiga" realm:@"Ner'zhul" region:@"us"],
              [[RIOCharacterID alloc] initWithName:@"Kaesti" realm:@"Ner'zhul" region:@"us"]];
}

- (RIOCharacter *)characterWithID:(RIOCharacterID *)characterID {
    RIOCharacter * const character = _cache[characterID];
    if (character == nil) {
        [self _beginFetchingCharacterIfNeeded:characterID];
    }
    return character;
}

- (void)clearCache {
    [self _setupEmptyCache];
}

- (void)addListener:(id<RIOCharacterCacheListener>)listener {
    [_genericListeners addPointer:(__bridge void *)listener];
}

- (void)removeListener:(id<RIOCharacterCacheListener>)listener {
    const NSUInteger listenerIndex = [[_genericListeners allObjects] indexOfObject:listener];
    if (listenerIndex != NSNotFound) {
        [_genericListeners removePointerAtIndex:listenerIndex];
    }
}

- (void)addCharacterListener:(RIOCharacterID *)characterID
                    listener:(id<RIOCharacterCacheListener>)listener {
    if (_characterListeners[characterID] == nil) {
        _characterListeners[characterID] = [NSPointerArray weakObjectsPointerArray];
    }

    [_characterListeners[characterID] addPointer:(__bridge void *)listener];
}

- (void)removeCharacterListener:(RIOCharacterID *)characterID
                       listener:(id<RIOCharacterCacheListener>)listener {
    NSPointerArray *characterListeners = _characterListeners[characterID];
    [characterListeners compact];
    if (characterListeners.count == 0) {
        return;
    }
    const NSUInteger listenerIndex = [[characterListeners allObjects] indexOfObject:listener];
    if (listenerIndex != NSNotFound) {
        [characterListeners removePointerAtIndex:listenerIndex];
    }
}

#pragma mark - Private

- (void)_setupEmptyCache {
    _cache = [NSMutableDictionary new];
    _fetching = [NSMutableSet new];
}

- (void)_beginFetchingCharacterIfNeeded:(RIOCharacterID *)characterID {
    if ([_fetching containsObject:characterID]) {
        return;
    }

    [_fetching addObject:characterID];
    [_service fetchCharacterWithID:characterID completion:^(RIOCharacter * _Nullable character) {
        self->_cache[characterID] = character;
        [self->_fetching removeObject:characterID];
        [self _notifyListenersOfCacheUpdateForCharacterID:characterID];
    }];
}

- (void)_notifyListenersOfCacheUpdateForCharacterID:(RIOCharacterID *)characterID {
    for (id<RIOCharacterCacheListener> listener in _genericListeners) {
        [listener characterCacheDidUpdate];
    }
    for (id<RIOCharacterCacheListener> listener in _characterListeners[characterID]) {
        [listener characterCacheDidUpdate];
    }
}

@end
